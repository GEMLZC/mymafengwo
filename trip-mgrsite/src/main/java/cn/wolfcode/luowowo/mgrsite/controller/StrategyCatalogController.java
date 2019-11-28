package cn.wolfcode.luowowo.mgrsite.controller;

import cn.wolfcode.luowowo.article.domain.Region;
import cn.wolfcode.luowowo.article.domain.StrategyCatalog;
import cn.wolfcode.luowowo.article.service.IStrategyCatalogService;
import cn.wolfcode.luowowo.common.query.QueryObject;
import cn.wolfcode.luowowo.common.util.AjaxResult;
import org.apache.dubbo.config.annotation.Reference;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("strategyCatalog")
public class StrategyCatalogController {
    @Reference
    private IStrategyCatalogService strategyCatalogService;

    @RequestMapping("list")
    public String list (QueryObject qo,Model model) {
        model.addAttribute("pageInfo", strategyCatalogService.query(qo));
        return "strategyCatalog/list";
    }

    /**
     * 保存信息
     * @param strategyCatalog
     * @return
     */
    @RequestMapping("saveOrUpdate")
    @ResponseBody
    public Object saveOrUpdate(StrategyCatalog strategyCatalog) {
        strategyCatalogService.saveOrUpdate(strategyCatalog);
        return new AjaxResult();
    }
}
