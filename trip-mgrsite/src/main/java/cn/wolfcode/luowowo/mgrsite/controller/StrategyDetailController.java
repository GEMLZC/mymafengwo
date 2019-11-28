package cn.wolfcode.luowowo.mgrsite.controller;

import cn.wolfcode.luowowo.article.domain.StrategyDetail;
import cn.wolfcode.luowowo.article.service.*;
import cn.wolfcode.luowowo.common.query.QueryObject;
import cn.wolfcode.luowowo.common.query.StrategyDetailQuery;
import cn.wolfcode.luowowo.common.util.AjaxResult;
import org.apache.dubbo.config.annotation.Reference;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("strategyDetail")
public class StrategyDetailController {
    @Reference
    private IStrategyDetailService strategyDetailService;
    @Reference
    private IStrategyContentService strategyContentService;
    @Reference
    private IStrategyCatalogService strategyCatalogService;
    @Reference
    private IStrategyThemeService strategyThemeService;
    @Reference
    private IStrategyTagService strategyTagService;

    @RequestMapping("list")
    public String list (StrategyDetailQuery qo, Model model) {
        model.addAttribute("pageInfo", strategyDetailService.query(qo));
        return "strategyDetail/list";
    }

    /**
     * 保存信息
     * @param strategyDetail
     * @return
     */
    @RequestMapping("saveOrUpdate")
    @ResponseBody
    public Object saveOrUpdate(StrategyDetail strategyDetail , String tags) {
        strategyDetailService.saveOrUpdate(strategyDetail , tags);
        return new AjaxResult();
    }

    @RequestMapping("input")
    public String input(Long id , Model model) {
        if (id != null){
            StrategyDetail strategyDetail = strategyDetailService.queryById(id);
            strategyDetail.setStrategyContent(strategyContentService.queryById(id));

            model.addAttribute("tags",strategyTagService.queryDetailTagByTagId(id));
            model.addAttribute("entity",strategyDetail);
        }
        model.addAttribute("catalogs",strategyCatalogService.list());
        model.addAttribute("themes",strategyThemeService.list());

        return "strategyDetail/input";
    }
}
