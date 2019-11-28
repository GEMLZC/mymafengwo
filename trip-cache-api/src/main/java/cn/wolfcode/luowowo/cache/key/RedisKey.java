package cn.wolfcode.luowowo.cache.key;

import cn.wolfcode.luowowo.common.util.Consts;
import lombok.Getter;

@Getter
public enum RedisKey {

    VERIFY_CODE("verify_code", Consts.VERIFY_CODE_TIMEOUT), //验证码
    USER_INFO(Consts.USER_INFO_TOKEN, Consts.USER_INFO_TIMEOUT), //用户
    STRATEGY_STATS("strategy_stats", -1L), //攻略统计
    STRATEGY_STATS_THUMBUP("strategy_stats_thumbup", -1L), //攻略点赞统计
    STRATEGY_STATS_HOT_SORT("strategy_stats_hot_sort", -1L), //攻略热门统计排序
    STRATEGY_STATS_UP_SORT("strategy_stats_up_sort", -1L), //攻略飙升统计排序
    STRATEGY_STATS_FAVOR("strategy_stats_favor", -1L), //攻略收藏统计

    TRAVEL_STATS("travel_stats", -1L), //游记统计
    TRAVEL_STATS_THUMBUP("travel_stats_thumbup", -1L), //攻略点赞统计
    TRAVEL_STATS_HOT_SORT("travel_stats_hot_sort", -1L), //攻略热门统计排序
    TRAVEL_STATS_UP_SORT("travel_stats_up_sort", -1L), //攻略飙升统计排序
    TRAVEL_STATS_FAVOR("travel_stats_favor", -1L), //攻略收藏统计

    USE_STATS("use_stats",-1L),//用户统计
    USE_STATS_DAY_VISIT("use_stats_day_visit",-1L),//用户每天访问量统计

    USER_VISITOR("user_visitor",-1L),//最新访客用户

    QUESTION_USER("question_user", -1L), //回答问题的用户
    COMMUNTIY_IMGURL("communtiy_imgurl", Consts.COMMUNTIY_IMGURL_TIMEOUT), //图片url

    HOTEL_STATS_FAVOR("hotel_stats_favor",-1L),




    HAS_BEEN_COLLECT("has_been_collect",-1L),//用户足迹统计(去过的景点)
    VIEW_STATS("view_stats",-1L),//景点统计数据
    VIEW_STATS_FAVOR("view_stats_favor",-1L),//用户收藏统计
    VIEW_COMMENT_THUMBUP("view_comment_thumbup",-1L),//景点点评的点赞列表
    VIEW_COMMENT_THUMBUP_NUM("view_comment_thumbup_num",-1L),//景点点评的点赞数


    USE_BLACK("use_black",-1L),//黑名单

    USER_LIST("user_list",-1L);//用户集合,



    private String prefix;
    private Long timeout;

    RedisKey(String prefix, Long timeout) {
        this.prefix = prefix;
        this.timeout = timeout;
    }

    public String getCacheKey(Object key) {
        return prefix + ":" + key;
    }
}
