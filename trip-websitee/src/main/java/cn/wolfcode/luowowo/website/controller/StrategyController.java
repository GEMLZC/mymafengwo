package cn.wolfcode.luowowo.website.controller;

import cn.wolfcode.luowowo.article.domain.Destination;
import cn.wolfcode.luowowo.article.domain.StrategyDetail;
import cn.wolfcode.luowowo.article.domain.Travel;
import cn.wolfcode.luowowo.article.service.*;
import cn.wolfcode.luowowo.cache.key.RedisKey;
import cn.wolfcode.luowowo.cache.service.IStrategyStatsCacheService;
import cn.wolfcode.luowowo.cache.vo.StrategyStats;
import cn.wolfcode.luowowo.comment.domain.StrategyComment;
import cn.wolfcode.luowowo.comment.query.StrategyCommentQuery;
import cn.wolfcode.luowowo.comment.service.IStrategyCommentService;
import cn.wolfcode.luowowo.common.query.StrategyDetailQuery;
import cn.wolfcode.luowowo.common.util.AjaxResult;
import cn.wolfcode.luowowo.member.domain.UserInfo;
import cn.wolfcode.luowowo.search.query.SearchQueryObject;
import cn.wolfcode.luowowo.search.service.IStrategySearchService;
import cn.wolfcode.luowowo.website.annotation.LoginUser;
import cn.wolfcode.luowowo.website.annotation.RequiredLogin;
import org.apache.dubbo.config.annotation.Reference;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import weibo4j.Oauth;
import weibo4j.http.AccessToken;
import weibo4j.model.WeiboException;

import java.util.Date;
import java.util.List;

import static cn.wolfcode.luowowo.cache.service.IStrategyStatsCacheService.REPLY_NUM;
import static cn.wolfcode.luowowo.cache.service.IStrategyStatsCacheService.SHARE_NUM;
import static cn.wolfcode.luowowo.cache.service.IStrategyStatsCacheService.VIEW_NUM;

@Controller
@RequestMapping("strategy")
public class StrategyController {
    @Reference
    private IStrategyDetailService strategyDetailService;
    @Reference
    private IStrategyContentService strategyContentService;
    @Reference
    private IStrategyTagService strategyTagService;
    @Reference
    private IDestinationService destinationService;
    @Reference
    private IStrategyCommentService strategyCommentService;
    @Reference
    private IStrategyCommendService strategyCommendService;
    @Reference
    private IStrategyStatsCacheService strategyStatsCacheService;
    @Reference
    private IStrategySearchService strategySearchService;



    @RequestMapping("detail")
    public String detail(Long id, Model model, @LoginUser UserInfo userInfo) {
        if (id != null) {
            //通过id查询文章
            StrategyDetail strategyDetail = strategyDetailService.queryById(id);
            strategyDetail.setStrategyContent(strategyContentService.queryById(id));

            model.addAttribute("detail", strategyDetail);

            //阅读数加一
            strategyStatsCacheService.incrById(id, 1, VIEW_NUM);

            //攻略评论统计
            model.addAttribute("vo", strategyStatsCacheService.getByStrategyId(id));
            if (userInfo != null) {
                //查询redis中用户收藏是否含有该攻略
                boolean isFavor = strategyStatsCacheService.isFavor(id, userInfo.getId());
                model.addAttribute("isFavor", isFavor);
            }

            //飙升排行榜阅读分数加一
            strategyStatsCacheService.addRank(RedisKey.STRATEGY_STATS_UP_SORT, 1, id);
        }
        return "strategy/detail";
    }

    @RequestMapping("")
    public String index(Model model) {
        //upCds 攻略飙升排行榜
        model.addAttribute("upCds", strategyStatsCacheService.listRankTop10(RedisKey.STRATEGY_STATS_UP_SORT));
        //hotCds 攻略热门排行
        model.addAttribute("hotCds", strategyStatsCacheService.listRankTop10(RedisKey.STRATEGY_STATS_HOT_SORT));
        //commends 攻略推荐前五篇
        model.addAttribute("commends", strategyCommendService.listTop5());
        //unabroads 国内攻略
        model.addAttribute("unabroads", strategySearchService.listCondition(SearchQueryObject.CONDITION_UNABROAD));
        //abroads 海外攻略
        model.addAttribute("abroads", strategySearchService.listCondition(SearchQueryObject.CONDITION_ABROAD));
        //themes 主题攻略
        model.addAttribute("themes", strategySearchService.listCondition(SearchQueryObject.CONDITION_THEME));
        //themeCds 主题推荐
        model.addAttribute("themeCds", strategySearchService.themeCommend());
        return "strategy/index";
    }

    @RequestMapping("list")
    public String list(Long destId, Model model, @ModelAttribute("qo") StrategyDetailQuery qo) {
        //通过地区id查询文章标签
        model.addAttribute("tags", strategyTagService.queryDetailTagByDestId(qo.getDestId()));
        List<Destination> list = destinationService.queryByParentId(destId);
        model.addAttribute("toasts", list);//吐司导航
        model.addAttribute("dest", list.remove(list.size() - 1));//目的地

        model.addAttribute("pageInfo", strategyDetailService.query(qo));
        return "strategy/list";
    }


    @RequiredLogin
    @RequestMapping("commentAdd")
    @ResponseBody
    public Object commentAdd(StrategyComment strategyComment, @LoginUser UserInfo userInfo) {
        AjaxResult result = new AjaxResult();
        strategyComment.setCreateTime(new Date());
        //对StrategyComment的用户属性进行赋值
        strategyComment.setUserId(userInfo.getId());
        strategyComment.setUsername(userInfo.getNickname());
        strategyComment.setHeadUrl(userInfo.getHeadImgUrl());
        strategyComment.setLevel(userInfo.getLevel());
        strategyCommentService.save(strategyComment);
        //评论数加一
        strategyStatsCacheService.incrById(strategyComment.getDetailId(), 1, REPLY_NUM);
        StrategyStats strategyStats = strategyStatsCacheService.getByStrategyId(strategyComment.getDetailId());
        //飙升排行榜评论分数加一
        strategyStatsCacheService.addRank(RedisKey.STRATEGY_STATS_UP_SORT, 1, strategyComment.getDetailId());
        return result.addData(strategyStats.getReplynum());
    }

    @RequestMapping("comment")
    public String comment(StrategyCommentQuery qo, Model model) {
        model.addAttribute("page", strategyCommentService.queryByDetailId(qo));
        return "strategy/commentTpl";
    }


    @RequestMapping("commentThumbUp")
    @ResponseBody
    @RequiredLogin
    public Object commentThumbUp(String toId, Long fromId) {
        strategyCommentService.commentThumbUp(fromId, toId);
        return new AjaxResult();
    }


    @RequestMapping("favor")
    @ResponseBody
    @RequiredLogin
    public Object favor(Long strategyId, @LoginUser UserInfo userInfo) {
        AjaxResult result = new AjaxResult();
        //调用service的方法直接返回一个布尔类型的值，这样直接给AjaxResult的success赋值
        boolean success = strategyStatsCacheService.favor(strategyId, userInfo.getId());
        result.setSuccess(success);
        StrategyStats strategyStats = strategyStatsCacheService.getByStrategyId(strategyId);
        //热门排行榜收藏分数加一
        strategyStatsCacheService.addRank(RedisKey.STRATEGY_STATS_HOT_SORT, 1, strategyId);

        return result.addData(strategyStats.getFavornum());
    }


    @RequestMapping("strategyThumbup")
    @ResponseBody
    @RequiredLogin
    public Object strategyThumbup(Long strategyId, @LoginUser UserInfo userInfo) {
        AjaxResult result = new AjaxResult();
        boolean success = strategyStatsCacheService.strategyThumbup(strategyId, userInfo.getId());
        result.setSuccess(success);
        StrategyStats strategyStats = strategyStatsCacheService.getByStrategyId(strategyId);
        //热门排行榜点赞分数加一
        strategyStatsCacheService.addRank(RedisKey.STRATEGY_STATS_HOT_SORT, 1, strategyId);
        return result.addData(strategyStats.getThumbsupnum());
    }


    @RequestMapping("searchPage")
    public String searchPage(SearchQueryObject qo, Model model) {
        model.addAttribute("page", strategySearchService.list(qo));
        return "strategy/searchPageTpl";
    }


    //分享
    @RequestMapping("share")
    @ResponseBody
    public AjaxResult share(Long strategyId){
        AjaxResult result = new AjaxResult();
        //分享数加一
        strategyStatsCacheService.incrById(strategyId, 1, SHARE_NUM);
        StrategyStats strategyStats = strategyStatsCacheService.getByStrategyId(strategyId);
        return result.addData(strategyStats.getSharenum());
    }

}
