package cn.wolfcode.luowowo.website.listener;

import cn.wolfcode.luowowo.article.domain.StrategyCollect;
import cn.wolfcode.luowowo.article.domain.StrategyDetail;
import cn.wolfcode.luowowo.article.domain.Travel;
import cn.wolfcode.luowowo.article.domain.TravelCollect;
import cn.wolfcode.luowowo.article.service.IStrategyCollectService;
import cn.wolfcode.luowowo.article.service.IStrategyDetailService;
import cn.wolfcode.luowowo.article.service.ITravelCollectService;
import cn.wolfcode.luowowo.article.service.ITravelService;
import cn.wolfcode.luowowo.cache.key.RedisKey;
import cn.wolfcode.luowowo.cache.service.IStrategyStatsCacheService;
import cn.wolfcode.luowowo.cache.service.ITravelStatsCacheService;
import cn.wolfcode.luowowo.cache.service.IUserCacheService;
import cn.wolfcode.luowowo.cache.service.IUserInfoCacheService;
import cn.wolfcode.luowowo.cache.vo.StrategyStats;
import cn.wolfcode.luowowo.cache.vo.TravelStats;
import cn.wolfcode.luowowo.cache.vo.UserStats;
import cn.wolfcode.luowowo.member.domain.User;
import cn.wolfcode.luowowo.member.service.IUserInfoService;
import cn.wolfcode.luowowo.member.service.IUserService;
import org.apache.dubbo.config.annotation.Reference;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.ApplicationListener;
import org.springframework.context.event.ContextRefreshedEvent;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * 启动时初始化热数据
 * ContextRefreshedEvent表示spring初始化bean完成事件
 */
@Component
public class HotDataInitListener implements ApplicationListener<ContextRefreshedEvent>{
    @Reference
    private IStrategyDetailService strategyDetailService;
    @Reference
    private ITravelService travelService;
    @Value("${hot.data.init}")
    private boolean flag;//热数据初始化开关
    @Reference
    private IStrategyStatsCacheService strategyStatsCacheService;
    @Reference
    private IUserCacheService userCacheService;
    @Reference
    private IUserInfoCacheService userInfoCacheService;
    @Reference
    private IUserService userService;
    @Reference
    private ITravelStatsCacheService travelStatsCacheService;
    @Reference
    private IStrategyCollectService strategyCollectService;
    @Reference
    private ITravelCollectService travelCollectService;

    @Override
    public void onApplicationEvent(ContextRefreshedEvent event) {
        //判断是否做数据迁移
        if (flag){
            System.out.println("热数据初始化中。。。。。");
            //查询所有攻略信息
            List<StrategyDetail> list = strategyDetailService.query();
            //查询所有游记信息
            List<Travel> travelList = travelService.list();
            //查询所有用户信息
            List<User> userList = userService.query();
            //查询所有用户所收藏的攻略id
            final List<StrategyCollect> strategyCollects = strategyCollectService.list();
            //查询所有用户所收藏的游记id
            final List<TravelCollect> travelCollects = travelCollectService.list();
            //把用户信息存入redis
            for (User user : userList) {
                if(userInfoCacheService.noExistUser(user.getId())){
                    UserStats userStats = new UserStats();

                    userStats.setUserId(user.getId());
                    userStats.setNickName(user.getNickname());
                    userStats.setHeadImgUrl(user.getHeadImgUrl());
                    userStats.setLevel(user.getLevel());
                    userStats.setTodaynum(user.getTodaynum());
                    userStats.setViewnum(user.getViewnum());
                    //把热数据对象存储到redis中
                    userInfoCacheService.setUserStats(userStats);
                }
                //把用户当天访问数存入redis
                if(userInfoCacheService.noExistUserTodaynum(user.getId())){
                    UserStats userStats = new UserStats();
                    userStats.setUserId(user.getId());
                    userStats.setNickName(user.getNickname());
                    userStats.setHeadImgUrl(user.getHeadImgUrl());
                    userStats.setLevel(user.getLevel());
                    userStats.setTodaynum(user.getTodaynum());
                    userStats.setViewnum(user.getViewnum());
                    userInfoCacheService.setUserTodayNum(userStats);
                }

            }

            //把游记信息存入redis
            for (Travel travel : travelList) {
                //if (travelStatsCacheService.noExistTravel(travel.getId())) {

                    TravelStats travelStats = new TravelStats();
                    travelStats.setViewnum(travel.getViewnum());
                    travelStats.setReplynum(travel.getReplynum());
                    travelStats.setFavornum(travel.getFavornum());
                    travelStats.setSharenum(travel.getSharenum());
                    travelStats.setThumbsupnum(travel.getThumbsupnum());

                    travelStats.setTravelId(travel.getId());
                    travelStats.setDestId(travel.getDest().getId());
                    travelStats.setDestName(travel.getDest().getName());
                    travelStats.setTitle(travel.getTitle());
                    travelStatsCacheService.setTravelStats(travelStats);
                //}
            }
            //把攻略信息存入redis
            for (StrategyDetail strategyDetail : list) {
                //if (strategyStatsCacheService.noExistStrategy(strategyDetail.getId())) {
                    //把热数据放到热数据对象中
                    StrategyStats stats = new StrategyStats();
                    stats.setThumbsupnum(strategyDetail.getThumbsupnum());
                    stats.setFavornum(strategyDetail.getFavornum());
                    stats.setReplynum(strategyDetail.getReplynum());
                    stats.setSharenum(strategyDetail.getSharenum());
                    stats.setViewnum(strategyDetail.getViewnum());

                    stats.setStrategyId(strategyDetail.getId());
                    stats.setDestId(strategyDetail.getDest().getId());
                    stats.setDestName(strategyDetail.getDest().getName());
                    stats.setTitle(strategyDetail.getTitle());
                    //把热数据对象存储到redis中
                    strategyStatsCacheService.setStrategyStats(stats);
                //}

                //判断redis中有无排行榜的数据
                if (strategyStatsCacheService.noExistLead(RedisKey.STRATEGY_STATS_UP_SORT,strategyDetail.getId())){//飙升排行
                    //zset的分值  规则：浏览数+评论数
                    int num = strategyDetail.getViewnum() + strategyDetail.getReplynum();
                    strategyStatsCacheService.addRank(RedisKey.STRATEGY_STATS_UP_SORT,num,strategyDetail.getId());
                }


                if (strategyStatsCacheService.noExistLead(RedisKey.STRATEGY_STATS_HOT_SORT,strategyDetail.getId())){//热门排行
                    //zset的分值  规则：浏览数+评论数
                    int num = strategyDetail.getFavornum() + strategyDetail.getThumbsupnum();
                    strategyStatsCacheService.addRank(RedisKey.STRATEGY_STATS_HOT_SORT,num,strategyDetail.getId());
                }
            }
            System.out.println("初始化完成");
        }
       /* if(flag){
            List<User> list = userService.query();
            for (User user : list) {
                userCacheService.setUserViewnum(RedisKey.USER_STATS_VIEWNUM.getCacheKey(user.getId()),user.getViewnum());
                userCacheService.setUserTodaynum(RedisKey.USER_STATS_TODAYNUM.getCacheKey(user.getId()),user.getTodaynum());
            }
        }*/
    }
}
