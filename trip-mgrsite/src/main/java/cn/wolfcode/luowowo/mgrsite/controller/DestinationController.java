package cn.wolfcode.luowowo.mgrsite.controller;

import cn.wolfcode.luowowo.article.domain.Destination;
import cn.wolfcode.luowowo.article.service.IDestinationService;
import cn.wolfcode.luowowo.common.query.DestinationQuery;
import cn.wolfcode.luowowo.common.util.AjaxResult;
import com.github.pagehelper.PageInfo;
import org.apache.dubbo.config.annotation.Reference;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("destination")
public class DestinationController {
    @Reference
    private IDestinationService destinationService;


    @RequestMapping("list")
    public String getListAllDest(@ModelAttribute("qo") DestinationQuery qo, Model model) {
        model.addAttribute("pageInfo",destinationService.query(qo));
        //吐司导航
        model.addAttribute("toasts",destinationService.queryByParentId(qo.getParentId()));
        return "destination/list";
    }


    @RequestMapping("changeHotState")
    @ResponseBody
    public AjaxResult changeHotState(Long id, Long hot) {
        AjaxResult result = new AjaxResult();
        try {
            destinationService.updateStatus(id,hot);
        }catch (Exception e){
            result.mark("修改失败");
        }
        return result;
    }


    @RequestMapping("setInfo")
    @ResponseBody
    public AjaxResult setInfo(Destination destination) {
        AjaxResult result = new AjaxResult();
        try {
            destinationService.updateInfo(destination);
        }catch (Exception e){
            result.mark("修改失败");
        }
        return result;
    }

}
