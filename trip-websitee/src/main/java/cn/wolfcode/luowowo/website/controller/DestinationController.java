package cn.wolfcode.luowowo.website.controller;

import cn.wolfcode.luowowo.article.domain.*;
import cn.wolfcode.luowowo.article.service.*;
import cn.wolfcode.luowowo.common.query.NewDestinationQuery;
import cn.wolfcode.luowowo.common.query.StrategyDetailQuery;
import cn.wolfcode.luowowo.common.query.TravelQuery;
import cn.wolfcode.luowowo.search.service.IDestinationSearchService;
import cn.wolfcode.luowowo.search.template.DestinationTemplate;
import org.apache.dubbo.config.annotation.Reference;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import weibo4j.model.Query;

import javax.servlet.http.HttpServletRequest;
import java.util.Enumeration;
import java.util.List;

@Controller
@RequestMapping("destination")
public class DestinationController {
    @Reference
    private IRegionService regionService;
    @Reference
    private IDestinationService destinationService;
    @Reference
    private IStrategyCatalogService strategyCatalogService;
    @Reference
    private IStrategyDetailService strategyDetailService;
    @Reference
    private IStrategyContentService strategyContentService;
    @Reference
    private ITravelService travelService;
    @Reference
    private IDestinationSearchService destinationSearchService;
    @Reference
    private IDestinationThemeTagService destinationThemeTagService;
    @Reference
    private IQuarterService quarterService;
    @Reference
    private IDestinationThemeService destinationThemeService;
    @Reference
    private INewDestinationService newDestinationService;

    //目的地页面
    @RequestMapping("")
    public String index(Model model , String access_token, HttpServletRequest request) throws Exception{
        //hotRegions    热门目的地
        model.addAttribute("hotRegions", regionService.queryHostRegion());
        //月份集合  months
        List<Quarter> months = quarterService.listAll();
        model.addAttribute("months",months);
        //主题集合
        List<DestinationTheme> destinationThemes = destinationThemeService.listAll();
        model.addAttribute("destThemes",destinationThemes);
        return "destination/index";
    }


    @RequestMapping("listHotDestByRegionId")
    public String listHotDestByRegionId(Model model, @ModelAttribute("regionId") Long regionId) {
        List<Destination> list = destinationService.queryByRegionId(regionId);

        model.addAttribute("leftDests", list.subList(0, list.size() / 2));
        model.addAttribute("rightDests", list.subList(list.size() / 2, list.size()));
        return "destination/hotdestTpl";
    }

    @RequestMapping("listdestByThemesId")
    public String listdestByThemesId(Model model, Long themeId) {
        model.addAttribute("tid",themeId);
        DestinationTheme destinationTheme = destinationThemeService.get(themeId);
        List<DestinationThemeTag> tags = destinationTheme.getTags();
        model.addAttribute("tags",tags);
        return "destination/themedestTpl";
    }

    @RequestMapping("listHotDestByMonthId")
    public String listHotDestByMonthId(Model model, @ModelAttribute("mid") Long mid) {
        //默认查一月份
        Quarter quarter = quarterService.get(mid);
        List<NewDestination> list = quarter.getDestinations();
        //上面显示的目的地 topDests
        List<NewDestination> topDests =  list.subList(0,list.size()/2);
        model.addAttribute("topDests",topDests);
        //上面显示的目的地 underDests
        List<NewDestination> underDests =list.subList(list.size()/2,list.size());
        model.addAttribute("underDests",underDests);
        model.addAttribute("size",underDests.size());
        return "destination/monthdestTpl";
    }

    @RequestMapping("guide")
    public String guide(Model model, Long id, TravelQuery qo) {
        List<Destination> list = destinationService.queryByParentId(id);
        model.addAttribute("toasts", list);//吐司导航
        model.addAttribute("dest", list.remove(list.size() - 1));//目的地

        //概况
        model.addAttribute("catalogs", strategyCatalogService.queryCatalogByDestId(id));
        //该目的地下的攻略
        model.addAttribute("strategyDetails", strategyDetailService.queryByDestId(id));
        return "destination/guide";
    }


    @RequestMapping("surveyPage")
    public String surveyPage(Model model, @ModelAttribute("qo") StrategyDetailQuery qo) {
        List<Destination> list = destinationService.queryByParentId(qo.getDestId());
        model.addAttribute("toasts", list);//吐司导航
        model.addAttribute("dest", list.remove(list.size() - 1));

        return "destination/survey";
    }


    @RequestMapping("survey")
    public String survey(Model model, @ModelAttribute("qo") StrategyDetailQuery qo) {
        List<StrategyCatalog> catalogs = strategyCatalogService.queryCatalogByDestId(qo.getDestId());
        //全部分类catalogs
        model.addAttribute("catalogs", catalogs);
        for (StrategyCatalog catalog : catalogs) {
            if (catalog.getId().equals(qo.getCatalogId())){
                List<StrategyDetail> details = catalog.getDetails();
                //catalog,拿到第一篇文章
                model.addAttribute("catalog",catalog);
                //拿到第一篇文章的内容
                StrategyDetail detail = details.get(0);
                detail.setStrategyContent(strategyContentService.queryById(detail.getId()));
                //文章
                model.addAttribute("detail",detail);
                break;
            }
        }
        return "destination/surveyTpl";
    }

    @RequestMapping("travels")
    public String travels(Model model, TravelQuery qo) {
        //该目的地下的游记
        model.addAttribute("pageInfo", travelService.query(qo));
        return "destination/travelTpl";
    }

    @RequestMapping("search")
    public String search(String destName,Model model){
        DestinationTemplate destinationTemplate = destinationSearchService.queryByName(destName);
        String guide = guide(model, destinationTemplate.getId(), null);
        return guide;
    }

    @RequestMapping("filter")
    public String filter(Model model, @ModelAttribute("qo") NewDestinationQuery qo){
        DestinationTimeList timeList = new DestinationTimeList();
        timeList.setQuarters(quarterService.query()); //查询月份
        timeList.setTags(destinationThemeTagService.queryByThemeId(DestinationTheme.THEME_HOLIDAY)); //查询标签
        //查询主题下的标签
        model.addAttribute("tags",destinationThemeService.queryExcludeHoliday(DestinationTheme.THEME_HOLIDAY));
        model.addAttribute("time",timeList);
        //查询目的地
        qo.setPageSize(9);
        model.addAttribute("pageInfo",newDestinationService.query(qo));
        return "destination/destFilter";
    }
}
