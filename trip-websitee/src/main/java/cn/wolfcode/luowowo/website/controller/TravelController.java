package cn.wolfcode.luowowo.website.controller;

import cn.wolfcode.luowowo.article.domain.Destination;
import cn.wolfcode.luowowo.article.domain.Travel;
import cn.wolfcode.luowowo.article.domain.TravelContent;
import cn.wolfcode.luowowo.article.service.IDestinationService;
import cn.wolfcode.luowowo.article.service.IStrategyDetailService;
import cn.wolfcode.luowowo.article.service.ITravelContentService;
import cn.wolfcode.luowowo.article.service.ITravelService;
import cn.wolfcode.luowowo.cache.key.RedisKey;
import cn.wolfcode.luowowo.cache.service.ITravelStatsCacheService;
import cn.wolfcode.luowowo.cache.vo.StrategyStats;
import cn.wolfcode.luowowo.cache.vo.TravelStats;
import cn.wolfcode.luowowo.cache.vo.StrategyStats;
import cn.wolfcode.luowowo.comment.domain.TravelComment;
import cn.wolfcode.luowowo.comment.service.ITravelCommentService;
import cn.wolfcode.luowowo.common.query.TravelQuery;
import cn.wolfcode.luowowo.common.util.AjaxResult;
import cn.wolfcode.luowowo.member.domain.UserInfo;
import cn.wolfcode.luowowo.website.annotation.LoginUser;
import cn.wolfcode.luowowo.website.annotation.RequiredLogin;
import cn.wolfcode.luowowo.website.util.UMEditorUploader;
import cn.wolfcode.luowowo.website.util.UploadUtil;
import org.apache.dubbo.config.annotation.Reference;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.util.*;

import static cn.wolfcode.luowowo.cache.service.IStrategyStatsCacheService.SHARE_NUM;

@Controller
@RequestMapping("travel")
public class TravelController {
    @Reference
    private ITravelService travelService;
    @Reference
    private IDestinationService destinationService;
    @Reference
    private ITravelContentService travelContentService;
    @Reference
    private IStrategyDetailService strategyDetailService;
    @Reference
    private ITravelCommentService travelCommentService;
    @Reference
    private ITravelStatsCacheService travelStatsCacheService;

    @Value("${file.dir}")
    private String path;

    @RequestMapping("")
    public String index(Model model, @ModelAttribute("qo") TravelQuery qo, Long id) {
        qo.setOvert(1);//公开状态
        qo.setState(2);//发布状态
        model.addAttribute("pageInfo", travelService.query(qo));
        return "travel/list";
    }

    @RequestMapping("detail")
    public String detail(Model model, Long id) {
        //detail
        Travel travel = travelService.queryById(id);
        travel.setTravelContent(travelContentService.queryById(id));
        model.addAttribute("detail", travel);
        //toasts
        Long destId = travel.getDest().getId();
        List<Destination> list = destinationService.queryByParentId(destId);
        model.addAttribute("toasts", list);//吐司导航
        //sds
        model.addAttribute("sds", strategyDetailService.queryByDestId(destId));

        //ts
        TravelQuery qo = new TravelQuery();
        qo.setDestId(Math.toIntExact(destId));//强转
        qo.setOrderBy("2");//设置排序方案
        model.addAttribute("ts", travelService.queryDestId(qo));

        //list
        model.addAttribute("list", travelCommentService.queryByTravelId(id));
        return "travel/detail";
    }


    @RequiredLogin
    @RequestMapping("input")
    public String input(Model model, Long id) {
        model.addAttribute("dests", destinationService.queryForList());//旅游地点

        if (id != null) {
            Travel travel = travelService.queryById(id);
            travel.setTravelContent(travelContentService.queryById(id));
            model.addAttribute("tv", travel);
        }
        return "travel/input";
    }

    @RequestMapping("getContent")
    @ResponseBody
    public TravelContent getContent(Long id) {
        return travelContentService.queryById(id);
    }

    @RequestMapping("coverImageUpload")
    @ResponseBody
    public String coverImageUpload(MultipartFile pic) {
        return UploadUtil.upload(pic, path);
    }


    //UME上传图片
    @RequestMapping("/contentImage")
    @ResponseBody
    public String uploadUEImage(MultipartFile upfile, HttpServletRequest request) throws Exception {
        UMEditorUploader up = new UMEditorUploader(request);
        java.lang.String[] fileType = {".gif", ".png", ".jpg", ".jpeg", ".bmp"};
        up.setAllowFiles(fileType);
        up.setMaxSize(10000); //单位KB
        up.upload(upfile, path);

        String callback = request.getParameter("callback");
        String result = "{\"name\":\"" + up.getFileName() + "\", \"originalName\": \"" + up.getOriginalName() + "\", \"size\": " + up.getSize()
                + ", \"state\": \"" + up.getState() + "\", \"type\": \"" + up.getType() + "\", \"url\": \"" + up.getUrl() + "\"}";
        result = result.replaceAll("\\\\", "\\\\");
        if (callback == null) {
            return result;
        } else {
            return "<script>" + callback + "(" + result + ")</script>";
        }
    }


    @RequestMapping("saveOrUpdate")
    @ResponseBody
    public Object saveOrUpdate(Travel travel, @LoginUser UserInfo userInfo) {
        travel.setAuthor(userInfo);
        return travelService.saveOrUpdate(travel);
    }

    @RequestMapping("commentAdd")
    @RequiredLogin
    public String commentAdd(TravelComment travelComment,Long floor,  @LoginUser UserInfo userInfo,Model model) {
        travelComment.setCreateTime(new Date());
        //设置用户属性
        travelComment.setUserId(userInfo.getId());
        travelComment.setHeadUrl(userInfo.getHeadImgUrl());
        travelComment.setLevel(userInfo.getLevel());
        travelComment.setUsername(userInfo.getNickname());
        travelComment.setCity(userInfo.getCity());
        model.addAttribute("c",travelCommentService.save(travelComment));
        model.addAttribute("floor",++floor);
        return "travel/commentTpl";
    }
    //收藏
    @RequestMapping("favor")
    @ResponseBody
    @RequiredLogin
    public Object favor(Long travelId, @LoginUser UserInfo userInfo) {
        AjaxResult result = new AjaxResult();
        //调用service的方法直接返回一个布尔类型的值，这样直接给AjaxResult的success赋值
        boolean success = travelStatsCacheService.favor(travelId, userInfo.getId());
        result.setSuccess(success);
        final TravelStats travelStats = travelStatsCacheService.getByTravelId(travelId);
        //热门排行榜收藏分数加一
        travelStatsCacheService.addRank(RedisKey.TRAVEL_STATS_HOT_SORT, 1, travelId);

        return result.addData(travelStats.getFavornum());
    }
    //关注
    /*@RequestMapping("attention")
    @ResponseBody
    @RequiredLogin
    public Object attention(Long userId, @LoginUser UserInfo userInfo) {
        AjaxResult result = new AjaxResult();



        return result;
    }*/



    //分享
    @RequestMapping("share")
    @ResponseBody
    public AjaxResult share(Long travelId){
        AjaxResult result = new AjaxResult();
        travelService.addShareNum(travelId,1);
        return result.addData(travelService.getShareNum(travelId));
    }
}
