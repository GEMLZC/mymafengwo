package cn.wolfcode.luowowo.mgrsite.controller;

import cn.wolfcode.luowowo.article.domain.StrategyTheme;
import cn.wolfcode.luowowo.article.service.IStrategyThemeService;
import cn.wolfcode.luowowo.common.query.QueryObject;
import cn.wolfcode.luowowo.common.util.AjaxResult;
import org.apache.dubbo.config.annotation.Reference;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("strategyTheme")
public class StrategyThemeController {
    @Reference
    private IStrategyThemeService strategyThemeService;

    @RequestMapping("list")
    public String list (QueryObject qo,Model model) {
        model.addAttribute("pageInfo", strategyThemeService.query(qo));
        return "strategyTheme/list";
    }

    /**
     * 保存信息
     * @param strategyTheme
     * @return
     */
    @RequestMapping("saveOrUpdate")
    @ResponseBody
    public Object saveOrUpdate(StrategyTheme strategyTheme) {
        strategyThemeService.saveOrUpdate(strategyTheme);
        return new AjaxResult();
    }
}
