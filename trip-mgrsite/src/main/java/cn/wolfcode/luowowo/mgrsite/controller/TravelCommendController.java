package cn.wolfcode.luowowo.mgrsite.controller;

import cn.wolfcode.luowowo.article.domain.TravelCommend;
import cn.wolfcode.luowowo.article.service.ITravelCommendService;
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
@RequestMapping("travelCommend")
public class TravelCommendController {
    @Value("${file.dir}")
    private String path;
    @Reference
    private ITravelCommendService travelCommendService;

    @RequestMapping("save")
    @ResponseBody
    public Object save(TravelCommend travelCommend, MultipartFile pic) {
        String coverUrl = UploadUtil.upload(pic, path);
        travelCommend.setCoverUrl("/"+coverUrl);
        travelCommendService.save(travelCommend);
        return new AjaxResult();
    }


    @RequestMapping("list")
    public String list(Model model, QueryObject qo) {
        model.addAttribute("pageInfo",travelCommendService.query(qo));
        return "travelCommend/list";
    }
}
