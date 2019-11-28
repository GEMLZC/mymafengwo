package cn.wolfcode.luowowo.website.controller;


import cn.wolfcode.luowowo.article.domain.Destination;
import cn.wolfcode.luowowo.article.service.IDestinationService;
import cn.wolfcode.luowowo.cache.service.ICommunityQuestionCacheService;
import cn.wolfcode.luowowo.cache.service.IQuestionUserCacheService;
import cn.wolfcode.luowowo.cache.vo.QuestionUser;
import cn.wolfcode.luowowo.comment.domain.CommunityQuestion;
import cn.wolfcode.luowowo.comment.domain.CommuntiyReply;
import cn.wolfcode.luowowo.comment.domain.ImgAndTxt;
import cn.wolfcode.luowowo.comment.domain.QuestionList;
import cn.wolfcode.luowowo.comment.service.ICommunityQuestionService;
import cn.wolfcode.luowowo.common.query.QueryObject;
import cn.wolfcode.luowowo.member.domain.UserInfo;
import cn.wolfcode.luowowo.member.service.IUserInfoService;
import cn.wolfcode.luowowo.website.annotation.LoginUser;
import cn.wolfcode.luowowo.website.annotation.RequiredLogin;
import cn.wolfcode.luowowo.website.util.UploadUtil;
import org.apache.commons.beanutils.BeanUtils;
import org.apache.dubbo.config.annotation.Reference;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import java.lang.reflect.InvocationTargetException;
import java.util.*;


@Controller
@RequestMapping("community")
public class CommunityController {
    @Reference
    private IDestinationService destinationService;
    @Reference
    private ICommunityQuestionService communityQuestionService;
    @Reference
    private ICommunityQuestionCacheService communityQuestionCacheService;
    @Reference
    private IQuestionUserCacheService questionUserCacheService;
    @Reference
    private IUserInfoService userInfoService;
    @Value("${file.dir}")
    private String path;

    @RequestMapping("")
    @RequiredLogin
    public String index() {
        return "community/public";
    }

    @RequestMapping("listDests")
    @ResponseBody
    public List<Destination> listDests() {
        return destinationService.queryForList();
    }

    //详情页面
    @RequestMapping("/wendaDetail")
    public String wendaDetail(String id,Model model){
        //detail 对象
        CommunityQuestion c = communityQuestionService.queryById(id);
        model.addAttribute("detail",c);
        //size 回答数
        model.addAttribute("size",c.getUsers().size());
        return "community/wendaDetail";
    }

    //wangE上传图片
    @RequestMapping("/upload")
    @ResponseBody
    public Object uploadImage(List<MultipartFile> pic, Integer type,@LoginUser UserInfo userInfo) throws Exception {
        Map<String, Object> map = new HashMap<>();
        List<String> list = new ArrayList<>();
        for (MultipartFile p : pic) {
            try {
                String path = UploadUtil.upload(p, this.path);
                list.add("/" + path);
            } catch (Exception e) {
                map.put("errno", 1);
            }

        }
        map.put("errno", 0);
        map.put("data", list);
        //存入redis
        if (type != null && userInfo != null) {//如果是回答上传图片就不会为空
            communityQuestionCacheService.setImgUrl(list,userInfo.getId());
        }
        return map;
    }

    @RequestMapping("save")
    public String save(CommunityQuestion communityQuestion, Model model, @LoginUser UserInfo userInfo) {
        communityQuestion.setCreatTime(new Date());
        communityQuestion.setUserId(userInfo.getId());
        communityQuestion.setUserName(userInfo.getNickname());
        communityQuestion.setHeadImgUrl(userInfo.getHeadImgUrl());
        //查询地区名称
        Destination destination = destinationService.queryById(communityQuestion.getDestId());
        //设置标签和地区名称
        String destName = destination.getName();
        communityQuestion.setTag(destName);
        communityQuestion.setDestName(destName);


        communityQuestion = communityQuestionService.save(communityQuestion);
        //再次查询刚刚的保存的数据
        CommunityQuestion c = communityQuestionService.queryById(communityQuestion.getId());
        model.addAttribute("detail", c);
        model.addAttribute("size", c.getUsers().size());

        return "community/wendaDetail";
    }

    @RequestMapping("commentAdd")
    @RequiredLogin
    public String commentAdd(CommuntiyReply communtiyReply, String questionId, String txt, @LoginUser UserInfo userInfo, Model model) throws Exception {

        //查询哪个问题
        CommunityQuestion communityQuestion = communityQuestionService.queryById(questionId);
        //1、往MongoDB的问题加入用户的回答和图片
        List<CommuntiyReply> users = communityQuestion.getUsers();
        //拷贝属性到userInfo的子类上
        BeanUtils.copyProperties(communtiyReply, userInfo);
        users.add(communtiyReply);
        //设置图片与内当前内容都对应
        List<ImgAndTxt> imgAndTxts = communityQuestion.getImgAndTxts();
        List<String> urls = communityQuestionCacheService.getImgUrl(userInfo.getId());
        ImgAndTxt imgAndTxt = null;
        if (urls != null) {//说明上传过图片

            for (String url : urls) {
                imgAndTxt = new ImgAndTxt();
                imgAndTxt.setId(userInfo.getId());//绑定用户的id
                imgAndTxt.setImgUrl(url);
                imgAndTxt.setTxt(txt);
                imgAndTxts.add(imgAndTxt);
            }
        } else {
            imgAndTxt = new ImgAndTxt();
            imgAndTxt.setTxt(txt);
            imgAndTxt.setId(userInfo.getId());//绑定用户的id
            imgAndTxts.add(imgAndTxt);
        }

        communityQuestion.setImgAndTxts(imgAndTxts);
        communityQuestionService.save(communityQuestion);
        model.addAttribute("user", communtiyReply);

        //2.往redis加入用户回答的问题,做排行榜
        QuestionUser questionUser = new QuestionUser();
        questionUser.setUserId(communtiyReply.getId());
        questionUser.setNickname(communtiyReply.getNickname());
        questionUser.setCreatTime(new Date());
        questionUser.setHeadImgUrl(communtiyReply.getHeadImgUrl());
        questionUser.setLevel(communtiyReply.getLevel());
        questionUserCacheService.setQuestionUser(communtiyReply.getId(), questionUser, communityQuestion);
        return "community/replyTpl";
    }


    @RequestMapping("wenDaList")
    public String wenDaList(Model model, @ModelAttribute("qo") QueryObject qo) throws Exception {
        List<CommunityQuestion> questions = communityQuestionService.query(qo);
        if (questions.size() == 0){
            return null;
        }
        List<QuestionList> list = new ArrayList<>();
        //获取出单个问答的图片和回答内容，并把全部属性转移到子类上
        for (CommunityQuestion question : questions) {
             QuestionList q = new QuestionList();
             BeanUtils.copyProperties(q,question);
             //随机出imgAndTxt集合的一个
            Random random = new Random();
            List<ImgAndTxt> imgAndTxts = q.getImgAndTxts();
            if (imgAndTxts.size() == 0){//如果imgAndTxts没有直接下一次循环
                list.add(q);
                continue;
            }
            int i = random.nextInt(imgAndTxts.size());//随机生成[0,size)范围内的数

            ImgAndTxt imgAndTxt = imgAndTxts.get(i);
            q.setImgUrl(imgAndTxt.getImgUrl());
            q.setTxt(imgAndTxt.getTxt());

            Long userId = imgAndTxt.getId();//获取用户的id，查询当前用户
            UserInfo userInfo = userInfoService.queryById(userId);
            q.setUser(userInfo);
            q.setReplynum(question.getUsers().size());
            list.add(q);
        }


        model.addAttribute("detail",list);
        if (qo.getCurrentPage() != 1){
            return "community/nextTpl";
        }

        //回答排行榜
        model.addAttribute("sort",questionUserCacheService.listTop10());
        return "community/wenda";
    }
}
