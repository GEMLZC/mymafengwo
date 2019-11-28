package cn.wolfcode.luowowo.mgrsite.job;

import cn.wolfcode.luowowo.article.domain.StrategyCollect;
import cn.wolfcode.luowowo.article.domain.StrategyDetail;
import cn.wolfcode.luowowo.article.domain.TravelCollect;
import cn.wolfcode.luowowo.article.service.IStrategyCollectService;
import cn.wolfcode.luowowo.article.service.IStrategyDetailService;
import cn.wolfcode.luowowo.article.service.ITravelCollectService;
import cn.wolfcode.luowowo.cache.service.IStrategyStatsCacheService;
import cn.wolfcode.luowowo.cache.service.ITravelStatsCacheService;
import cn.wolfcode.luowowo.cache.service.IUserCacheService;
import cn.wolfcode.luowowo.cache.service.IUserInfoCacheService;
import cn.wolfcode.luowowo.cache.vo.StrategyStats;
import cn.wolfcode.luowowo.cache.vo.UserStats;

import cn.wolfcode.luowowo.comment.service.IStrategyCommentService;
import cn.wolfcode.luowowo.member.domain.User;
import cn.wolfcode.luowowo.member.service.IUserService;
import org.apache.dubbo.config.annotation.Reference;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;


import java.util.List;

@Component
public class StatsPersistenceJob {
    @Reference
    private IStrategyStatsCacheService strategyStatsCacheService;
    @Reference
    private IStrategyDetailService strategyDetailService;
    @Reference
    private ITravelStatsCacheService travelStatsCacheService;
    @Reference
    private IUserInfoCacheService userInfoCacheService;
    @Reference
    private IUserCacheService userCacheService;
    @Reference
    private IUserService userService;
    @Reference
    private IStrategyCommentService strategyCommentService;
    @Reference
    private IStrategyCollectService strategyCollectService;
    @Reference
    private ITravelCollectService travelCollectService;



    //从0秒开始，每5秒执行1次
    @Scheduled(cron = "0/59 * * * * ?")
    public void persistence() {
        List<StrategyStats> list = strategyStatsCacheService.getAllStrategyStatis();
        for (StrategyStats ss : list) {
            StrategyDetail strategyDetail = new StrategyDetail();
            strategyDetail.setId(ss.getStrategyId());
            strategyDetail.setReplynum(ss.getReplynum());
            strategyDetail.setViewnum(ss.getViewnum());
            strategyDetail.setSharenum(ss.getSharenum());
            strategyDetail.setThumbsupnum(ss.getThumbsupnum());
            strategyDetail.setFavornum(ss.getFavornum());
            strategyDetailService.updateStats(strategyDetail);
        }
        //个人中心-我的游记:累计访问数落地
        //查询所有用户的总访问数
        List<UserStats> allTodayNum = userInfoCacheService.getAllViewNum();
        for (UserStats userStats : allTodayNum) {
            User user = new User();
            user.setId(userStats.getUserId());
            user.setNickname(userStats.getNickName());
            user.setTodaynum(userStats.getTodaynum());
            userService.updateViewNum(user);
        }
        //用户收藏的攻略落地
        List<StrategyCollect> allstrategyfavor = strategyStatsCacheService.getAllfavor();
        System.out.println(allstrategyfavor);
        for (StrategyCollect strategyCollect : allstrategyfavor) {
            final Long userid = strategyCollect.getUserid();
            final List<Long> liststrategy = strategyCollectService.liststrategy(userid);
            if (!liststrategy.contains(strategyCollect.getStrategyid())){
                strategyCollectService.save(strategyCollect);
            }
        }
        //用户收藏的游记落地
        List<TravelCollect> alltravelfavor = travelStatsCacheService.getAllfavor();
        System.out.println(alltravelfavor);
        for (TravelCollect travelCollect : alltravelfavor) {
            final Long userid = travelCollect.getUserid();
            final List<Long> liststrategy = travelCollectService.listtravel(userid);
            if (!liststrategy.contains(travelCollect.getTravelid())){
                travelCollectService.save(travelCollect);
            }
        }



    }
}
