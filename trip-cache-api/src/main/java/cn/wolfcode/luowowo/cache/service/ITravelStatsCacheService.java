package cn.wolfcode.luowowo.cache.service;

import cn.wolfcode.luowowo.article.domain.StrategyCollect;
import cn.wolfcode.luowowo.article.domain.StrategyDetail;
import cn.wolfcode.luowowo.article.domain.Travel;
import cn.wolfcode.luowowo.article.domain.TravelCollect;
import cn.wolfcode.luowowo.cache.key.RedisKey;
import cn.wolfcode.luowowo.cache.vo.StrategyStats;
import cn.wolfcode.luowowo.cache.vo.TravelStats;

import java.util.List;

public interface ITravelStatsCacheService {
    //统计数类型
    final int  VIEW_NUM = 1;//阅读数
    final int  REPLY_NUM = 2;//回复数
    final int  FAVOR_NUM = 3;//收藏数
    final int  THUMBUP_NUM = 4;//点赞数
    final int  SHARE_NUM = 5;//分享数数

    /**
     * 保存数据到redis
     * @param travelStats
     */
    void setTravelStats(TravelStats travelStats);

    /**
     * 判断统计对象是否为空
     * @param travelId
     * @return
     */
    boolean noExistTravel(Long travelId);
    /**
     * 通过攻略id获取攻略的统计数
     * @param id
     * @return
     */
    TravelStats getByTravelId(Long id);
    /**
     * 用户点赞
     *
     * @param travelId
     * @param userId
     * @return
     */
    boolean travelThumbup(Long travelId, Long userId);
    /**
     * 统计数增加
     * @param travelId
     * @param num
     * @param type
     */
    void incrById(Long travelId, int num, int type);

    /**
     * 收藏
     * @param travelId
     * @param id
     * @return
     */
    boolean favor(Long travelId, Long id);

    /**
     * 添加排行榜内容
     * @param key
     * @param num
     * @param id
     */
    void addRank(RedisKey key, int num, Long id);

    /**
     * 根据用户id获取该用户的游记收藏
     * @param userId
     * @return
     */
    List<Travel> getfavor(Long userId);
    /**
     * 获取所有收藏关系
     */
    List<TravelCollect> getAllfavor();

    /**
     * 保存收藏关系
     * @param travelList
     * @param userId
     */
    void setfavor(List<Travel> travelList,Long userId);
}
