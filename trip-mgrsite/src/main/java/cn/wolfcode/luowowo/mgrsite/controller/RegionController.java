package cn.wolfcode.luowowo.mgrsite.controller;

import cn.wolfcode.luowowo.article.domain.Destination;
import cn.wolfcode.luowowo.article.domain.Region;
import cn.wolfcode.luowowo.article.service.IDestinationService;
import cn.wolfcode.luowowo.article.service.IRegionService;
import cn.wolfcode.luowowo.common.query.QueryObject;
import cn.wolfcode.luowowo.common.util.AjaxResult;
import org.apache.dubbo.config.annotation.Reference;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("region")
public class RegionController {
    @Reference
    private IRegionService regionService;
    @Reference
    private IDestinationService destinationService;

    /**
     * 区域管理页面
     * @param qo
     * @param model
     * @return
     */
    @RequestMapping("list")
    public String list(@ModelAttribute("qo") QueryObject qo, Model model) {
        model.addAttribute("pageInfo", regionService.query(qo));

        return "region/list";
    }

    /**
     * 获取区域下关联的目的地
     * @param rid
     * @return
     */
    @RequestMapping("listDestByRegionId")
    @ResponseBody
    public List<Destination> getListDestByRef(Long rid) {
        Region region = regionService.queryById(rid);

        return destinationService.getListDestByRef(region.getRefIds());
    }

    /**
     * 查询全部目的地
     * @param rid
     * @return
     */
    @RequestMapping("listDests")
    @ResponseBody
    public List<Destination> listDests(Long rid) {
        return destinationService.queryForList();
    }

    /**
     * 保存信息
     * @param region
     * @return
     */
    @RequestMapping("saveOrUpdate")
    @ResponseBody
    public Object saveOrUpdate(Region region) {
        regionService.saveOrUpdate(region);
        return new AjaxResult();
    }
}
