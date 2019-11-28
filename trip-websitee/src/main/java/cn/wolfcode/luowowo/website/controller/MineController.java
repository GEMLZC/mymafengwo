package cn.wolfcode.luowowo.website.controller;

import cn.wolfcode.luowowo.article.domain.*;
import cn.wolfcode.luowowo.article.service.*;
import cn.wolfcode.luowowo.cache.key.RedisKey;
import cn.wolfcode.luowowo.cache.service.IStrategyStatsCacheService;
import cn.wolfcode.luowowo.cache.service.ITravelStatsCacheService;
import cn.wolfcode.luowowo.cache.service.IUserInfoCacheService;
import cn.wolfcode.luowowo.cache.service.IViewStatsCacheService;
import cn.wolfcode.luowowo.cache.vo.StrategyStats;
import cn.wolfcode.luowowo.cache.vo.TravelStats;
import cn.wolfcode.luowowo.cache.vo.UserStats;
import cn.wolfcode.luowowo.cache.vo.TravelStats;
import cn.wolfcode.luowowo.comment.domain.StrategyComment;
import cn.wolfcode.luowowo.comment.domain.TravelComment;
import cn.wolfcode.luowowo.comment.service.IStrategyCommentService;
import cn.wolfcode.luowowo.comment.service.ITravelCommentService;
import cn.wolfcode.luowowo.common.query.TravelQuery;
import cn.wolfcode.luowowo.common.query.Userquery;
import cn.wolfcode.luowowo.common.util.AjaxResult;
import cn.wolfcode.luowowo.common.util.Consts;
import cn.wolfcode.luowowo.hotel.domain.Hotel;
import cn.wolfcode.luowowo.hotel.service.IHotelService;
import cn.wolfcode.luowowo.member.domain.User;
import cn.wolfcode.luowowo.member.domain.UserInfo;
import cn.wolfcode.luowowo.member.service.IUserInfoService;
import cn.wolfcode.luowowo.member.service.IUserService;
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

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/mine")
public class MineController {
    @Reference
    private IUserService userService;
    @Reference
    private ITravelService travelService;
    @Reference
    private IDestinationService destinationService;
    @Reference
    private ITravelStatsCacheService travelStatsCacheService;
    @Reference
    private IUserInfoCacheService userInfoCacheService;
    @Reference
    private ITravelCommentService travelCommentService;
    @Reference
    private IStrategyDetailService strategyDetailService;
    @Reference
    private IStrategyCommentService strategyCommentService;
    @Reference
    private IStrategyStatsCacheService strategyStatsCacheService;
    @Reference
    private ITravelCollectService travelCollectService;
    @Reference
    private IStrategyCollectService strategyCollectService;
    @Reference
    private ITravelAgencyService travelAgencyService;
    @Reference
    private IViewStatsCacheService viewStatsCacheService;
    @Reference
    private IViewService viewService;
    @Reference
    private IHotelService hotelService;
    @Reference
    private IViewCommentService viewCommentService;


    @Reference
    private IUserInfoService userInfoService;
    @Value("${file.dir}")
    private String path;

    //我的窝
    @RequiredLogin
    @RequestMapping("/home")
    public String index(Model model, @LoginUser UserInfo userInfo, Userquery qo) {
        /*获取被访问对象*/
        User user = userService.get(userInfo.getId());
        /*获取被访问对象的游记集合*/
        int totalcommentnum = 0;
        //根据用户id查询评论
        final List<ViewComment> viewComments = viewCommentService.getByUserId(userInfo.getId());
        totalcommentnum = viewComments.size();
        for (ViewComment viewComment : viewComments) {
            final int commentsize = viewComment.getCommentBacks().size();
            viewComment.setCommentnum(commentsize);
        }


        List<Travel> travels = travelService.getByUserId(userInfo.getId());
        /*传递用户*/
        model.addAttribute("user", user);
        /*传递游记的长度*/
        model.addAttribute("tsize", travels.size());
        /*传递游记集合*/
        model.addAttribute("travels", travels);
        /*获取用户的关注*/
        model.addAttribute("viewComments", viewComments);
        model.addAttribute("totalcommentnum", totalcommentnum);
        model.addAttribute("user", user);
        model.addAttribute("tsize", travels.size());
        model.addAttribute("travels", travels);
        List<User> users = userService.listFollow(userInfo.getId());
        model.addAttribute("users", users);
        model.addAttribute("usize", users.size());
        /*判断如果访问用户不是当前用户,就存入redis*/
        /*if(qo.getUserId()!=userInfo.getId()){
            userInfoCacheService.setUserVisitor(qo.getUserId(),userInfo.getId());
        }*/
        return "mine/homepage";
    }

    /*关注的用户的窝*/
    @RequiredLogin
    @RequestMapping("/homes")
    public String homes(Model model, @LoginUser UserInfo userInfo, Userquery qo) {
        /*获取被访问对象*/
        User user = userService.get(qo.getUserId());
        /*获取被访问对象的游记集合*/
        List<Travel> travels = travelService.getByUserId(qo.getUserId());
        /*传递用户*/
        model.addAttribute("user", user);
        /*传递游记的长度*/
        model.addAttribute("tsize", travels.size());
        /*传递游记集合*/
        model.addAttribute("travels", travels);
        /*获取用户的关注*/
        List<User> users = userService.listFollow(qo.getUserId());
        model.addAttribute("users", users);
        model.addAttribute("usize", users.size());
        /*判断如果访问用户不是当前用户,就存入redis*/
        if (qo.getUserId() != userInfo.getId()) {
            userInfoCacheService.setUserVisitor(qo.getUserId(), userInfo.getId());
        }
        return "mine/homespage";
    }

    //我的游记
    @RequiredLogin
    @RequestMapping("/mytravelnotes")
    public String mytravelnotes(Model model, @LoginUser UserInfo userInfo, @ModelAttribute("qo") TravelQuery qo) {
        /*设置当前用户*/
        qo.setAuthorId(qo.getUserId());
        //游记信息(含国家)
        PageInfo<Travel> travelPageInfo = travelService.query(qo);
        //总游记数
        int travelNum = travelService.getTravelNum(userInfo.getId());
        //回复数
        int travelReplyNum = travelService.getTravelReplyNum(qo.getUserId());
        //阅读数
        int travelViewNum = travelService.getTravelViewNum(qo.getUserId());

        //获取当前用户信息
        Long uid = userInfo.getId();
        User user = userService.get(uid);

        //最新访客
        //把当前用户封装成用户缓存对象

        UserStats visitUserStats = new UserStats();
        visitUserStats.setUserId(user.getId());
        visitUserStats.setNickName(user.getNickname());
        visitUserStats.setHeadImgUrl(user.getHeadImgUrl());
        visitUserStats.setLevel(user.getLevel());
        visitUserStats.setTodaynum(user.getTodaynum());
        visitUserStats.setViewnum(user.getViewnum());
        //设置创建时间
        Date date = new Date();
        visitUserStats.setCreationtime(date);

        //把最新访问用户存入redis
        //userInfoCacheService.setVisitUserStats(visitUserStats);

        //从redis中获取所有访问用户
        //List<UserStats> allVisitUserStats = userInfoCacheService.getAllVisitUserStats();
        //截取8个
        //allVisitUserStats.subList(0,8);


        //获取用户统计对象
        UserStats userStats = userInfoCacheService.getByUserId(qo.getUserId());
        //累计访问数
        Integer viewnum = userStats.getViewnum();
        //今日访问数
        //Integer todaynum = userStats.getTodaynum();

        //访问该页面时,相关统计数据+1
        //总访问数+1
        Integer statsViewnum = userStats.getViewnum();
        statsViewnum = statsViewnum + 1;
        userStats.setViewnum(statsViewnum);
        userInfoCacheService.setUserStats(userStats);
        //当天访问数
        //获取用户当天访问数对象
        UserStats byUserIdForTodayNum = userInfoCacheService.getByUserIdForTodayNum(userInfo.getId());
        Integer todaynum = byUserIdForTodayNum.getTodaynum();
        todaynum = todaynum + 1;
        byUserIdForTodayNum.setTodaynum(todaynum);
        userInfoCacheService.setUserTodayNum(byUserIdForTodayNum);


        model.addAttribute("user", user);
        //model.addAttribute("allVisitUserStats",allVisitUserStats);
        model.addAttribute("viewnum", viewnum);
        model.addAttribute("todaynum", todaynum);
        model.addAttribute("travelSize", travelNum);
        model.addAttribute("travelReplyNum", travelReplyNum);
        model.addAttribute("travelViewNum", travelViewNum);
        model.addAttribute("travelPageInfo", travelPageInfo);
        model.addAttribute("user", user);
        model.addAttribute("viewnum", viewnum);
        model.addAttribute("todaynum", todaynum);
        model.addAttribute("travelSize", travelNum);
        model.addAttribute("travelReplyNum", travelReplyNum);
        model.addAttribute("travelViewNum", travelViewNum);
        model.addAttribute("pageInfo", travelPageInfo);
        /*判断redis中是否有值*/
        if (!userInfoCacheService.noexistVisitor(qo.getUserId())) {
            /*获取访问对象,并传递到界面*/
            List<Long> list = userInfoCacheService.getUserVisitor(qo.getUserId());
            List<User> vs = new ArrayList<>();
            if (list.size() != 0) {
                for (Long a : list) {
                    User user1 = userService.get(a);
                    vs.add(user1);
                }
            }
            model.addAttribute("users", vs);

        }
        /*获取最新的访问用户id*/
        return "mine/mytravelnotes";
    }

    //ta的游记
    @RequiredLogin
    @RequestMapping("/tatravelnotes")
    public String tatravelnotes(Model model, @LoginUser UserInfo userInfo, @ModelAttribute("qo") TravelQuery qo) {
        /*设置当前用户*/
        qo.setAuthorId(qo.getUserId());
        //游记信息(含国家)
        PageInfo<Travel> travelPageInfo = travelService.query(qo);
        //总游记数
        int travelNum = travelService.getTravelNum(qo.getUserId());
        //回复数
        int travelReplyNum = travelService.getTravelReplyNum(qo.getUserId());
        //阅读数
        int travelViewNum = travelService.getTravelViewNum(qo.getUserId());

        //获取当前用户信息
        User user = userService.get(qo.getUserId());
        //获取用户统计对象
        UserStats userStats = userInfoCacheService.getByUserId(qo.getUserId());
        //累计访问数
        Integer viewnum = userStats.getViewnum();
        //今日访问数
        //Integer todaynum = userStats.getTodaynum();
        //访问该页面时,相关统计数据+1
        //总访问数+1
        Integer statsViewnum = userStats.getViewnum();
        statsViewnum = statsViewnum + 1;
        userStats.setViewnum(statsViewnum);
        userInfoCacheService.setUserStats(userStats);
        //当天访问数
        //获取用户当天访问数对象
        UserStats byUserIdForTodayNum = userInfoCacheService.getByUserIdForTodayNum(qo.getUserId());
        Integer todaynum = byUserIdForTodayNum.getTodaynum();
        todaynum = todaynum + 1;
        byUserIdForTodayNum.setTodaynum(todaynum);
        userInfoCacheService.setUserTodayNum(byUserIdForTodayNum);
        model.addAttribute("user", user);
        model.addAttribute("viewnum", viewnum);
        model.addAttribute("todaynum", todaynum);
        model.addAttribute("travelSize", travelNum);
        model.addAttribute("travelReplyNum", travelReplyNum);
        model.addAttribute("travelViewNum", travelViewNum);
        model.addAttribute("pageInfo", travelPageInfo);
        /*判断redis中是否有值*/
        if (!userInfoCacheService.noexistVisitor(qo.getUserId())) {
            /*获取访问对象,并传递到界面*/
            List<Long> list = userInfoCacheService.getUserVisitor(qo.getUserId());
            List<User> vs = new ArrayList<>();
            if (list.size() != 0) {
                for (Long a : list) {
                    User user1 = userService.get(a);
                    vs.add(user1);
                }
            }
            model.addAttribute("users", vs);

        }
        /*获取最新的访问用户id*/
        return "mine/tatravelnotes";
    }

    //点赞
    @RequestMapping("/top")
    @ResponseBody
    public Object top(Long travelId, @LoginUser UserInfo user) {
        //System.out.println(travelId);
        AjaxResult result = new AjaxResult();
        if (user == null) {
            result.setCode(102);
            return result.mark("顶之前请先登录");
        }
        Long userId = user.getId();
        //判断是否点赞成功
        boolean flag = travelStatsCacheService.travelThumbup(travelId, userId);
        result.setSuccess(flag);
        //查询当前游记的统计数据
        TravelStats travelStats = travelStatsCacheService.getByTravelId(travelId);
        return result.addData(travelStats.getThumbsupnum());
    }

    //我的点评
    @RequestMapping("review")
    @RequiredLogin
    public String review(@LoginUser UserInfo userInfo, Model model) {
        //获取当前用户信息
        Long uid = userInfo.getId();
        User user = userService.get(uid);
        int goldenCommentnum = 0;//金牌点评数
        int totalcommentnum = 0;//总点评数
        int totalthumbsupnum = 0;//总点赞数

        final List<ViewComment> viewComments = viewCommentService.getByUserId(uid);

        totalcommentnum = viewComments.size();

        for (ViewComment viewComment : viewComments) {
            if (viewComment.isGoldenComment()) {
                goldenCommentnum++;
            }
            final Integer thumbsupnum = viewComment.getThumbsupnum();
            totalthumbsupnum = totalthumbsupnum + thumbsupnum;
        }

        model.addAttribute("goldenCommentnum", goldenCommentnum);
        model.addAttribute("totalcommentnum", totalcommentnum);
        model.addAttribute("totalthumbsupnum", totalthumbsupnum);
        model.addAttribute("viewComments", viewComments);
        model.addAttribute("user", user);

        return "mine/review";
    }

    //点评点赞
    @RequestMapping("viewCommentThumbup")
    @ResponseBody
    @RequiredLogin
    public Object viewCommentThumbup(Long viewCommentId, @LoginUser UserInfo userInfo) {

        final AjaxResult result = viewStatsCacheService.thumbsUpComment(viewCommentId, userInfo.getId());

        return result;
    }


    //我的收藏
    @RequiredLogin
    @RequestMapping("travelcollection")
    public String travelcollection(@LoginUser UserInfo userInfo, Model model) {
        //获取当前用户信息
        Long uid = userInfo.getId();
        User user = userService.get(uid);

        //地点收藏
        final List<HashMap<String, Object>> viewandhotels = new ArrayList<>();
        final List<View> viewlist = new ArrayList<>();//地点集合
        //获取用户收藏的景点id
        final List<Long> viewids = viewStatsCacheService.getfavor(uid);
        //根据景点id查询景点内容
        if (viewids.size() > 0) {
            for (Long viewid : viewids) {
                final View view = viewService.get(viewid);
                viewlist.add(view);
            }
        }

        for (View view : viewlist) {
            //获取该景点所属的地点
            final Destination destination = view.getDest();
            //根据地点查询该地点的酒店
            final List<Hotel> hotels = hotelService.selectHotelByDestId(destination.getId());
            //封装酒店
            HashMap<String, Object> viewmap = new HashMap<>();
            viewmap.put("view", view);
            viewmap.put("hotels", hotels);
            viewandhotels.add(viewmap);
        }


        //游记收藏
        //把该用户收藏的游记关系存入redis
        //总id集合
        final List<Long> totaltravelid = new ArrayList<>();

        //获取已落地的游记id集合
        final List<Long> listtravel = travelCollectService.listtravel(uid);
        //查询redis中该用户的游记集合
        final List<Travel> rtlist = travelStatsCacheService.getfavor(uid);
        //获取redis集合的id
        final List<Long> idlist = new ArrayList<>();//redis中的游记id集合
        for (Travel travel : rtlist) {
            final Long id = travel.getId();
            idlist.add(id);
        }
        //把库中的游记存入redis中的游记集合存入redis集合
        for (Long id : listtravel) {
            if (!totaltravelid.contains(id)) {
                totaltravelid.add(id);
            }
        }
        for (Long id : idlist) {
            if (!totaltravelid.contains(id)) {
                totaltravelid.add(id);
            }

        }

        final List<Travel> travelList = new ArrayList<>();
        for (Long id : totaltravelid) {
            final Travel travel = travelService.queryById(id);
            travelList.add(travel);
        }
        //添加游记的最新回复
        for (Travel travel : travelList) {
            //添加最新回复对象
            Long travelId = travel.getId();
            //查询该游记的最新回复
            TravelComment latestComment = travelCommentService.getLatestComment(travelId);
            if (latestComment != null) {
                travel.setLastComment(latestComment);
            }
        }
        //把加工后的游记集合从新传回redis
        travelStatsCacheService.setfavor(travelList, uid);



        //攻略收藏
        //把该用户收藏的攻略关系存入redis
        //总id集合
        final List<Long> totalstrategyid = new ArrayList<>();
        //查询该用户所收藏的攻略
        //获取已落地的攻略id集合
        final List<Long> liststrategy = strategyCollectService.liststrategy(uid);
        //查询redis中该用户的游记集合
        List<StrategyDetail> rslist = strategyStatsCacheService.getfavor(uid);
        //获取redis集合的id
        final List<Long> sidlist = new ArrayList<>();//redis中的游记id集合
        for (StrategyDetail strategyDetail : rslist) {
            final Long id = strategyDetail.getId();
            sidlist.add(id);
        }
        //把库中的游记存入redis中的游记集合存入redis集合
        for (Long id : liststrategy) {
            if (!totalstrategyid.contains(id)) {
                totalstrategyid.add(id);
            }
        }
        for (Long id : sidlist) {
            if (!totalstrategyid.contains(id)) {
                totalstrategyid.add(id);
            }
        }
        final List<StrategyDetail> strategyDetailList = new ArrayList<>();
        for (Long id : totalstrategyid) {
            final StrategyDetail detail = strategyDetailService.queryById(id);
            strategyDetailList.add(detail);
        }
        //封装评论动态
        for (StrategyDetail detail : strategyDetailList) {
            Long detailId = detail.getId();
            StrategyComment latestComment = strategyCommentService.getLatestComment(detailId);
            if (latestComment != null) {
                detail.setLastComment(latestComment);
            }
        }
        //把加工后的游记集合从新传回redis
        strategyStatsCacheService.setfavor(strategyDetailList, uid);


        //旅行社收藏
        final List<TravelAgency> travelAgencies = travelAgencyService.query();


        model.addAttribute("viewandhotels", viewandhotels);
        model.addAttribute("travelAgencies", travelAgencies);
        model.addAttribute("strategyDetailList", strategyDetailList);
        model.addAttribute("travelList", travelList);
        model.addAttribute("user", user);

        return "mine/travelcollection";
    }

    //设置
    @RequiredLogin
    @RequestMapping("/setting")
    public String setting(Model model, @LoginUser UserInfo userInfo, Userquery qo) {
        qo.setUserinfoId(userInfo.getId());
        /*获取被访问对象*/
        User user = userService.get(userInfo.getId());//当前登录对象
        String phone = user.getPhone();
        //号码转换为带*
        //前三位
        String sub = phone.substring(0, 3);
        //后四位
        String substring = phone.substring(8, phone.length());
        phone = sub + "****" + substring;
        System.out.println(phone + "----------------");
        user.setPhone(phone);

        //获取当前用户的黑名单
        List<Long> black = userInfoCacheService.getBlack(userInfo.getId());
        //作为过滤条件 不等于这个才进行封装
        List<User> userNotInBlack = userService.getUserByIdNotIn(black, userInfo.getId());

        List<User> bs = new ArrayList<>();
        if (black.size() != 0) {
            for (Long b : black) {
                User user1 = userService.get(b);
                bs.add(user1);

            }
        }
        model.addAttribute("user", user);
        model.addAttribute("blacks", bs);
        model.addAttribute("users", userNotInBlack);
        return "mine/setting";
    }

    //设置
    @RequiredLogin
    @RequestMapping("/addBlack")
    @ResponseBody
    public AjaxResult addBlack(Long userId, @LoginUser UserInfo userInfo) {
        AjaxResult ajaxResult = new AjaxResult();
        try {
            userInfoCacheService.setBlack(userInfo.getId(), userId);
        } catch (Exception e) {
            ajaxResult.mark(e.getMessage());
        }
        return ajaxResult;
    }

    //保存
    @RequiredLogin
    @RequestMapping("/input")
    public String input(Model model, User user) {
        /*获取被访问对象*/
        userService.update(user);
        User user1 = userService.get(user.getId());
        model.addAttribute("user", user1);

        return "mine/setting";
    }

    /*文件上传*/
    @RequestMapping("/coverImageUpload")
    @ResponseBody
    public String coverImageUpload(MultipartFile pic) {
        return UploadUtil.upload(pic, path);
    }

    //原手机发送验证码
    @RequestMapping("/getCode")
    @ResponseBody
    public Object getCode(String phone) {
        return userInfoService.sendVerifyCode(phone);
    }

    //原验证码的提交
    @RequestMapping("/submit")
    @ResponseBody
    public Object submit(String phone, String oldCod) {
        return userInfoService.submitCode(phone, oldCod);
    }

    //新手机发送验证码
    @RequestMapping("/getNewCode")
    @ResponseBody
    public Object getNewCode(String phone) {
        return userInfoService.sendVerifyCode(phone);
    }

    //新验证码的提交
    @RequestMapping("/updatePhone")
    @ResponseBody
    public Object updatePhone(String phone, String newCod) {
        return userInfoService.submitCode(phone, newCod);
    }

    /*验证新手机号是否被注册*/
    @RequestMapping("/checkPhone")
    @ResponseBody
    public Object checkPhone(String phone) {
        return userInfoService.checkPhone(phone);
    }

    /*修改手机号*/
    @RequiredLogin
    @RequestMapping("/savePhone")
    public Object savePhone(String phone, @LoginUser UserInfo userInfo, Model model) {
        userService.savePhone(userInfo.getId(), phone);
        User user = userService.get(userInfo.getId());
        String phone1 = user.getPhone();
        //号码转换为带*
        //前三位
        String sub = phone1.substring(0, 3);
        //后四位
        String substring = phone1.substring(8, phone.length());
        phone1 = sub + "****" + substring;
        System.out.println(phone1 + "----------------");
        user.setPhone(phone1);
        model.addAttribute("user", user);
        return "mine/setting";
    }

    /*验证新手机号是否被注册*/
    @RequiredLogin
    @RequestMapping("/logout")
    public String logout(@LoginUser UserInfo userInfo, HttpSession session, HttpServletResponse response, HttpServletRequest request) {
        /*删除本地session*/
        session.removeAttribute(Consts.USER_INFO);
        //从request中拿到，登录时响应给前端的cookies
        Cookie[] cookies = request.getCookies();
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                //如果是用户的token，才去查询
                if (cookie.getName().equals(Consts.USER_INFO_TOKEN)) {
                    //通过远程的缓存服务获取token
                    String token = cookie.getValue();
                    /*删除redis*/
                    userInfoCacheService.remove(token);
                    /*删除cookie*/
                    /*cookie.setMaxAge(0);*/
                }
            }
        }
        return "/";

    }

    /*修改手机号*/
    @RequiredLogin
    @RequestMapping("/focus")
    @ResponseBody
    public AjaxResult focus(Long id, @LoginUser UserInfo userInfo) {
        AjaxResult result = new AjaxResult();
        AjaxResult ajaxResult = userService.setFolws(userInfo.getId(), id);
        return ajaxResult;
    }

}