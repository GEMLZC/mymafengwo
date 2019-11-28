package cn.wolfcode.luowowo.mgrsite.controller;

import cn.wolfcode.luowowo.article.domain.StrategyCommend;
import cn.wolfcode.luowowo.article.service.IStrategyCommendService;
import cn.wolfcode.luowowo.common.query.QueryObject;
import cn.wolfcode.luowowo.common.util.AjaxResult;
import cn.wolfcode.luowowo.mgrsite.util.UploadUtil;
import org.apache.dubbo.config.annotation.Reference;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

@Controller
@RequestMapping("strategyCommend")
public class StrategyCommendController {
    @Value("${file.dir}")
    private String path;
    @Reference
    private IStrategyCommendService strategyCommendService;

    @RequestMapping("save")
    @ResponseBody
    public Object save(StrategyCommend strategyCommend, MultipartFile pic) {
        String coverUrl = UploadUtil.upload(pic, path);
        strategyCommend.setCoverUrl("/"+coverUrl);
        strategyCommendService.save(strategyCommend);
        return new AjaxResult();
    }


    @RequestMapping("list")
    public String list(Model model, QueryObject qo) {
        model.addAttribute("pageInfo",strategyCommendService.query(qo));
        return "strategyCommend/list";
    }
}
