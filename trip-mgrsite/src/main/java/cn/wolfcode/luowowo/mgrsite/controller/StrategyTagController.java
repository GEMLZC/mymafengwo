package cn.wolfcode.luowowo.mgrsite.controller;

import cn.wolfcode.luowowo.article.service.IStrategyTagService;
import cn.wolfcode.luowowo.common.query.QueryObject;
import org.apache.dubbo.config.annotation.Reference;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("strategyTag")
public class StrategyTagController {
    @Reference
    private IStrategyTagService strategyTagService;

    @RequestMapping("list")
    public String list (QueryObject qo,Model model) {
        model.addAttribute("pageInfo", strategyTagService.query(qo));
        return "strategyTag/list";
    }
}
