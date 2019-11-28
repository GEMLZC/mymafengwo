package cn.wolfcode.luowowo.cache.service;

import cn.wolfcode.luowowo.article.domain.StrategyCollect;
import cn.wolfcode.luowowo.article.domain.StrategyDetail;
import cn.wolfcode.luowowo.cache.key.RedisKey;
import cn.wolfcode.luowowo.cache.vo.StrategyStats;


import java.util.List;

public interface IStrategyStatsCacheService {
    //统计数类型
    final int  VIEW_NUM = 1;//阅读数
    final int  REPLY_NUM = 2;//回复数
    final int  FAVOR_NUM = 3;//收藏数
    final int  THUMBUP_NUM = 4;//点赞数
    final int  SHARE_NUM = 5;//点赞数

    /**
     * 保存数据到redis
     * @param strategyStats
     */
    void setStrategyStats(StrategyStats strategyStats);

    /**
     * 通过攻略id获取攻略的统计数
     * @param id
     * @return
     */
    StrategyStats getByStrategyId(Long id);

    /**
     * 统计数增加
     * @param id
     * @param num
     * @param type
     */
    void incrById(Long id, int num, int type);

    /**
     * 收藏
     * @param strategyId
     * @param id
     * @return
     */
    boolean favor(Long strategyId, Long id);

    /**
     * 用户收藏判断
     * @param strategyId
     * @param userId
     * @return
     */
    boolean isFavor(Long strategyId, Long userId);

    /**
     * 用户点赞
     *
     * @param strategyId
     * @param userId
     * @return
     */
    boolean strategyThumbup(Long strategyId, Long userId);

    /**
     * 获取文章统计对象集合
     * @return
     */
    List<StrategyStats> getAllStrategyStatis();

    /**
     * 判断统计对象为空
     * @param strategyDetailId
     * @return true
     */
    boolean noExistStrategy(Long strategyDetailId);

    /**
     * 判断排行榜key为空
     * @param key
     * @param id
     * @return true
     */
    boolean noExistLead(RedisKey key, Long id);

    /**
     * 添加排行榜内容
     * @param key
     * @param num
     * @param id
     */
    void addRank(RedisKey key, int num, Long id);

    /**
     * 查询排行榜前10的地区数据
     * @param key
     * @return
     */
    List<StrategyStats> listRankTop10(RedisKey key);

    /**
     * 根据用户id查询用户所收藏的攻略
     * @param uid
     * @return
     */
    List<StrategyDetail> getfavor(Long uid);

    /**
     * 获取所有收藏关系
     */
    List<StrategyCollect> getAllfavor();
    /**
     * 保存收藏关系
     * @param strategyDetailList
     * @param userId
     */
    void setfavor(List<StrategyDetail> strategyDetailList, Long userId);
}
