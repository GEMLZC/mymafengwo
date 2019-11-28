package cn.wolfcode.luowowo.website.controller;

import cn.wolfcode.luowowo.article.service.IStrategyCommendService;
import cn.wolfcode.luowowo.article.service.ITravelCommendService;
import cn.wolfcode.luowowo.article.service.ITravelService;
import cn.wolfcode.luowowo.cache.service.IUserInfoCacheService;
import cn.wolfcode.luowowo.common.query.TravelQuery;
import cn.wolfcode.luowowo.common.util.Consts;
import cn.wolfcode.luowowo.member.domain.UserInfo;
import cn.wolfcode.luowowo.search.query.SearchQueryObject;
import cn.wolfcode.luowowo.search.service.*;
import cn.wolfcode.luowowo.search.template.DestinationTemplate;
import cn.wolfcode.luowowo.search.template.StrategyTemplate;
import cn.wolfcode.luowowo.search.template.TravelTemplate;
import cn.wolfcode.luowowo.search.template.UserInfoTemplate;
import cn.wolfcode.luowowo.search.vo.SearchResult;
import cn.wolfcode.luowowo.website.annotation.LoginUser;
import com.alibaba.fastjson.JSON;
import org.apache.dubbo.config.annotation.Reference;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;
import weibo4j.Oauth;
import weibo4j.Users;
import weibo4j.http.AccessToken;
import weibo4j.model.User;
import weibo4j.model.WeiboException;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.UUID;

import static javafx.scene.input.KeyCode.T;

@Controller
public class IndexController {
    @Reference
    private IUserInfoCacheService userInfoCacheService;
    @Reference
    private ITravelCommendService travelCommendService;
    @Reference
    private IStrategyCommendService strategyCommendService;
    @Reference
    private ITravelService travelService;
    @Value("${qq.userinfo}")
    private String url;


    //搜索服务
    @Reference
    private IStrategySearchService strategySearchService;
    @Reference
    private IDestinationSearchService destinationSearchService;
    @Reference
    private ITravelSearchService travelSearchService;
    @Reference
    private IUserInfoSearchService userInfoSearchService;
    @Reference
    private ISearchService searchService;


    @RequestMapping("/")
    public String index(String code, HttpSession session
            , HttpServletResponse response
            , HttpServletRequest request
            , Model model) throws WeiboException {
        UserInfo u = (UserInfo) session.getAttribute(Consts.USER_INFO);
        if (u == null) {
            Cookie[] cookies = request.getCookies();
            if (cookies != null) {
                for (Cookie cookie : cookies) {
                    if (cookie.getName().equals(Consts.USER_INFO_TOKEN)) {
                        String json = userInfoCacheService.getUserInfo(cookie.getValue());
                        u = JSON.parseObject(json, UserInfo.class);
                        session.setAttribute(Consts.USER_INFO, u);
                    }
                }
            }
            if (code != null && u == null) {//说明此时用户通过新浪微博登录
                Oauth oauth = new Oauth();
                AccessToken accessToken = oauth.getAccessTokenByCode(code);
                String userUid = accessToken.getUserUid();//uid
                Users users = new Users(accessToken.getAccessToken());
                //获取用户信息
                User user = users.showUserById(userUid);
                UserInfo userInfo = new UserInfo();
                //拿到微博的个人信息设置到本地上
                userInfo.setId(Long.valueOf(user.getId()));
                userInfo.setNickname(user.getScreenName());
                userInfo.setHeadImgUrl(user.getProfileImageUrl());
                //把userInfo储存到session中和redis中
                session.setAttribute(Consts.USER_INFO, userInfo);
                //使用UUID作为redis key的一部分,生成tonken
                String token = UUID.randomUUID().toString().replaceAll("-", "");
                //调用远程服务,保存到redis
                userInfoCacheService.setUserInfo(token, JSON.toJSONString(userInfo));
                //响应cookie给前端
                Cookie cookie = new Cookie(Consts.USER_INFO_TOKEN, token);
                response.addCookie(cookie);
            }
        }

        //tcs 游记推荐前五篇
        model.addAttribute("tcs", travelCommendService.listTop5());
        //scs 攻略推荐前五篇
        model.addAttribute("scs", strategyCommendService.listTop5());

        return "index/index";
    }

    @RequestMapping("/xxx")
    @ResponseBody
    public UserInfo xxx(@LoginUser UserInfo userInfo) {
        return userInfo;
    }

    /**
     * 新浪微博登录界面
     *
     * @param session
     * @return
     * @throws WeiboException
     */
    @RequestMapping("/login-sian-weibo")
    public String loginSinaWeibo(HttpServletRequest request, HttpSession session)
            throws WeiboException {
        session.setAttribute("login_current_url", request.getHeader("Referer"));
        Oauth oauth = new Oauth();
        String url = oauth.authorize("code", "");
        return "redirect:" + url;
    }

    @RequestMapping("getQQ_UserInfo")
    @ResponseBody
    public String getQQ_UserInfo() {
        RestTemplate rest = new RestTemplate();
        String msg = rest.getForObject(url, String.class);
        return msg;
    }


    @RequestMapping("index/travelPage")
    public String travelPage(Model model, TravelQuery qo) {
        qo.setPageSize(8);
        model.addAttribute("pageInfo", travelService.query(qo));
        return "index/travelPageTpl";
    }

    @RequestMapping("q")
    public String query(Model model, @ModelAttribute("qo") SearchQueryObject qo) {
        Integer type = qo.getType();
        String view = "";
        switch (type) {
            case SearchQueryObject.SEARCH_DEST:
                searchDest(model,qo);//目的地查询
                view = "searchDest";
                break;
            case SearchQueryObject.SEARCH_STRATEGY:
                hightLightSearch(model,qo,StrategyTemplate.INDEX_TYPE_NAME,StrategyTemplate.class
                        ,"title","subTitle","summary");
                view = "searchStrategy";
                break;
            case SearchQueryObject.SEARCH_TRAVEL:
                hightLightSearch(model,qo,TravelTemplate.INDEX_TYPE_NAME,TravelTemplate.class
                        ,"title","summary");
                view = "searchTravel";
                break;
            case SearchQueryObject.SEARCH_USER:
                hightLightSearch(model,qo,UserInfoTemplate.INDEX_TYPE_NAME,UserInfoTemplate.class
                        ,"nickname","destName");
                view = "searchUser";
                break;
            default:
                searchAll(model,qo);
                view = "searchAll";
        }
        return "index/"+view;
    }

    private void searchAll(Model model, SearchQueryObject qo) {
        int total = 0;
        Page<StrategyTemplate> strategys = searchService.hightLightSearch(StrategyTemplate.INDEX_TYPE_NAME, StrategyTemplate.class, qo, "title", "subTitle", "summary");
        total += strategys.getTotalElements();

        Page<TravelTemplate> travels = searchService.hightLightSearch(TravelTemplate.INDEX_TYPE_NAME, TravelTemplate.class, qo, "title",  "summary");
        total += travels.getTotalElements();

        Page<UserInfoTemplate> users = searchService.hightLightSearch(UserInfoTemplate.INDEX_TYPE_NAME, UserInfoTemplate.class, qo, "nickname", "destName");
        total += users.getTotalElements();

        Page<DestinationTemplate> dests = searchService.hightLightSearch(DestinationTemplate.INDEX_TYPE_NAME, DestinationTemplate.class, qo, "name", "info");
        total += dests.getTotalElements();

        SearchResult data = new SearchResult();
        data.setStrategys(strategys.getContent());
        data.setTravels(travels.getContent());
        data.setUsers(users.getContent());
        data.setDests(dests.getContent());
        data.setTotal(total);
        model.addAttribute("data",data);
    }

    /**
     * 高亮显示
     * @param model
     * @param qo
     * @param indexAndType
     * @param clazz
     * @param fields
     * @return page
     */
    private void hightLightSearch(Model model, SearchQueryObject qo ,String indexAndType , Class clazz,String...fields) {
        Page<Object> page = searchService.hightLightSearch(indexAndType, clazz, qo, fields);
        model.addAttribute("page",page);

    }

    private void searchDest(Model model, SearchQueryObject qo) {
        int total = 0;
        String keyword = qo.getKeyword();
        //地区
        DestinationTemplate destinationTemplate = destinationSearchService.queryByName(keyword);
        if (destinationTemplate != null){
            total += 1;
        }
        model.addAttribute("dest",destinationTemplate);
        SearchResult data = new SearchResult();
        //攻略
        List<StrategyTemplate>  strategys =  strategySearchService.queryByName(keyword);
        total += strategys.size();
        //游记
        List<TravelTemplate>  travels =  travelSearchService.queryByName(keyword);
        total += travels.size();
        //用户
        List<UserInfoTemplate>  users =  userInfoSearchService.queryByName(keyword);
        total += users.size();

        data.setStrategys(strategys);
        data.setTravels(travels);
        data.setUsers(users);
        data.setTotal(total);
        model.addAttribute("data",data);
    }
}
