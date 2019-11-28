package cn.wolfcode.luowowo.mgrsite.controller;

import cn.wolfcode.luowowo.article.domain.Travel;
import cn.wolfcode.luowowo.article.domain.TravelContent;
import cn.wolfcode.luowowo.article.service.ITravelContentService;
import cn.wolfcode.luowowo.article.service.ITravelService;
import cn.wolfcode.luowowo.cache.key.RedisKey;
import cn.wolfcode.luowowo.common.query.QueryObject;
import cn.wolfcode.luowowo.common.query.TravelQuery;
import cn.wolfcode.luowowo.common.util.AjaxResult;
import cn.wolfcode.luowowo.common.util.DateUtil;
import org.apache.dubbo.config.annotation.Reference;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Date;
import java.util.concurrent.TimeUnit;

@Controller
@RequestMapping("travel")
public class TravelController {
    @Reference
    private ITravelService travelService;
    @Reference
    private ITravelContentService travelContentService;


    @RequestMapping("list")
    public String list (@ModelAttribute("qo") TravelQuery qo, Model model) {
        model.addAttribute("pageInfo", travelService.query(qo));
        return "travel/list";
    }

    /**
     * 保存信息
     * @param travel
     * @return
     */
    @RequestMapping("saveOrUpdate")
    @ResponseBody
    public Object saveOrUpdate(Travel travel) {
        travelService.saveOrUpdate(travel);
        return new AjaxResult();
    }

    @RequestMapping("getTravelContent")
    @ResponseBody
    public TravelContent getTravelContent(Long id) {
        return travelContentService.queryById(id);
    }

    @RequestMapping("updateState")
    @ResponseBody
    public Object updateState(Long id , Long state) {
        travelService.updateState(id,state);
        return new AjaxResult();
    }


}
