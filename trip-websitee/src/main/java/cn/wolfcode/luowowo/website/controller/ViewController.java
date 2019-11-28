package cn.wolfcode.luowowo.website.controller;

import cn.wolfcode.luowowo.article.domain.View;
import cn.wolfcode.luowowo.article.domain.ViewComment;
import cn.wolfcode.luowowo.article.domain.ViewTag;
import cn.wolfcode.luowowo.article.service.IDestinationService;
import cn.wolfcode.luowowo.article.service.IViewCommentService;
import cn.wolfcode.luowowo.article.service.IViewService;
import cn.wolfcode.luowowo.article.service.IViewTagService;
import cn.wolfcode.luowowo.cache.service.IViewStatsCacheService;
import cn.wolfcode.luowowo.comment.domain.ViewCommentBack;
import cn.wolfcode.luowowo.comment.service.IViewCommentBackService;
import cn.wolfcode.luowowo.common.query.ViewQuery;
import cn.wolfcode.luowowo.common.util.AjaxResult;
import cn.wolfcode.luowowo.member.domain.UserInfo;
import cn.wolfcode.luowowo.website.annotation.LoginUser;
import cn.wolfcode.luowowo.website.annotation.RequiredLogin;
import cn.wolfcode.luowowo.website.util.UploadUtil;
import com.github.pagehelper.PageInfo;
import org.apache.dubbo.config.annotation.Reference;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

/**
 * Created by Xhek on 2019/11/23.
 */
@Controller
@RequestMapping("/view")
public class ViewController {

    @Value("${file.dir}")
    private String dir;

    @Reference
    private IViewService viewService;

    @Reference
    private IDestinationService destinationService;

    @Reference
    private IViewTagService viewTagService;
    @Reference
    private IViewStatsCacheService viewCacheService;
    @Reference
    private IViewCommentService viewCommentService;

    @Reference
    private IViewCommentBackService commentBackService;

    @RequestMapping("/list")
    public String list(Long destId, Model model, ViewQuery qo) {


        //dest
        model.addAttribute("dest", viewService.queryByDestAndType(destId, View.VIEW_MAIN).get(0));

        //viewTop5 必游景点前五
        List<View> viewsMust = viewService.queryByDestAndType(destId, View.VIEW_MUST);
        model.addAttribute("viewTop5", viewsMust.subList(0, 5));

        //hotView其他热门景点
        List<View> hotViews = viewService.queryByDestAndType(destId, View.VIEW_HOT);
        model.addAttribute("hotView", hotViews.subList(0, 8));

        //tags
        List<ViewTag> viewTags = viewTagService.listAllViewTagsByDestId(destId);
        model.addAttribute("tags", viewTags);

        return "view/list";
    }

    @RequestMapping("/detail")
    public String detail(Long id, Model model, @ModelAttribute("qo") ViewQuery qo, @LoginUser UserInfo user) {

        //将风景id设置给查询条件
        qo.setViewId(id);
        //detail
        model.addAttribute("detail", viewService.get(id));

//        model.addAttribute("isThumbup",viewCacheService);


        return "view/detail";
    }

    @RequestMapping("/addVisit")
    @ResponseBody
    @RequiredLogin
    public Object addvisit(Long viewId, @LoginUser UserInfo userInfo) {
        AjaxResult result = new AjaxResult();


        boolean hasVisited = viewCacheService.visit(userInfo.getId(), viewId);
        result.setSuccess(hasVisited);
        return result;
    }

    @RequestMapping("/favor")
    @ResponseBody
    @RequiredLogin
    public Object favor(Long viewId, @LoginUser UserInfo userInfo) {
        AjaxResult result = new AjaxResult();
        boolean isfavor = viewCacheService.favor(userInfo.getId(), viewId);
        result.setSuccess(isfavor);
        return result;
    }

    @RequestMapping("/addComment")
    @ResponseBody
    @RequiredLogin
    public Object addComment(ViewComment comment, @LoginUser UserInfo user) {

        comment.setUser(user);

        return viewCommentService.save(comment);
    }

    @RequestMapping("/thumbsUpComment")
    @ResponseBody
    @RequiredLogin
    public Object thumbsUpComment(Long commentId, @LoginUser UserInfo user) {


        AjaxResult result = viewCacheService.thumbsUpComment(commentId, user.getId());
        ViewComment viewComment = viewCommentService.get(commentId);
        int num = 0;//偏移量
        if (result.isSuccess()) {
            num = 1;
        } else {
            num = -1;
        }
        viewComment.setThumbsupnum(viewComment.getThumbsupnum() + num);
        if (viewComment.getThumbsupnum() >= 20) {
            viewComment.setGoldenComment(true);
        } else {
            viewComment.setGoldenComment(false);
        }
        viewCommentService.update(viewComment);

        result.setData(viewComment.getThumbsupnum());
        return result;
    }

    @RequestMapping("/comment/imgUpload")
    @ResponseBody
    public Object imgUpload(MultipartFile file) {
        AjaxResult result = new AjaxResult();
        String url = null;
        try {

            url = UploadUtil.upload(file, dir);

        } catch (Exception e) {
            e.printStackTrace();
            result.mark("图片过大!");
        }
        result.setData("/" + url);
        return result;
    }


    @RequestMapping("/commentBack")
    @RequiredLogin
    public String commentBack(ViewCommentBack commentBack, Model model, @LoginUser UserInfo userInfo) {
        commentBack.setUserId(userInfo.getId());
        commentBack.setHeadUrl(userInfo.getHeadImgUrl());
        commentBack.setUsername(userInfo.getNickname());
        //保存评论
        commentBack = commentBackService.save(commentBack);
        //cb 评论列表
        model.addAttribute("cb", commentBack);
        return "view/commentBackTpl";
    }


    @RequestMapping("/allViews")
    public String allViews(Model model, @ModelAttribute("qo") ViewQuery qo) {

        qo.setPageSize(5);
        model.addAttribute("pageInfo", viewService.query(qo));
        return "view/allViewsTpl";
    }

    @RequestMapping("/listComment")
    public String listComment(Long vid, @ModelAttribute("qo") ViewQuery qo, Model model, @LoginUser UserInfo user) {
        qo.setPageSize(5);
        //pageInfo
        qo.setViewId(vid);
        PageInfo pageInfo = viewCommentService.query(qo);
        List<ViewComment> list = pageInfo.getList();
        if (user != null) {
            for (ViewComment comment : list) {

                AjaxResult result = viewCacheService.getThumbupUser(comment.getId());
                if (result.isSuccess()) {
                    List<Long> userIds = (List<Long>) result.getData();
                    if (userIds != null) {
                        if (userIds.contains(user.getId())) {
                            comment.setFlag(true);
                        } else {
                            comment.setFlag(false);
                        }
                    }
                }
            }
        }

        for (ViewComment comment : list) {
            //评论
            List<ViewCommentBack> commentBacks = commentBackService.findByCommentId(comment.getId());
            comment.setCommentBacks(commentBacks);

        }


        model.addAttribute("viewId",vid);
        model.addAttribute("pageInfo", pageInfo);

        return "view/viewCommentTpl";
    }


    @RequestMapping("/innerView")
    public String innerView(ViewQuery qo,Long vid,Model model){
        qo.setParentId(vid);
        viewService.getByParentId(qo);
        model.addAttribute("innerView");


        return "view/innerViewTpl";
    }

}
