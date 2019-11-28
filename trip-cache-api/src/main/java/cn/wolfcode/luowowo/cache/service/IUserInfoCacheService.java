package cn.wolfcode.luowowo.cache.service;

import cn.wolfcode.luowowo.cache.vo.TravelStats;
import cn.wolfcode.luowowo.cache.vo.UserStats;

import java.util.List;

public interface IUserInfoCacheService {
    /**
     * 把userinfo信息保存redis中
     * @param token
     * @param json
     */
    void setUserInfo(String token,String json);

    /**
     * 从redis拿到userinfo对象
     * @param token
     * @return
     */
    String getUserInfo(String token);

    /**
     * 判断统计对象是否为空
     * @param id
     * @return
     */
    boolean noExistUser(Long id);
    /**
     * 通过用户id获取用户的统计数
     * @param userId
     * @return
     */
    UserStats getByUserId(Long userId);

    /**
     * 把用户统计对象存入redis
     * @param userStats
     */
    void setUserStats(UserStats userStats);

    /**
     * 判断用户当天访问数是否为空
     * @return
     */
    boolean noExistUserTodaynum(Long userId);
    /**
     * 通过用户id获取用户的当天访问数
     * @param userId
     * @return
     */
    UserStats getByUserIdForTodayNum(Long userId);
    /**
     * 把用户的当天访问数存入redis
     * @param userStats
     */
    void setUserTodayNum(UserStats userStats);

    /**
     * 获取所有用户的总访问数
     * @return
     */
    List<UserStats> getAllViewNum();

    /**
     * 把最新访问用户存入redis
     * @param visitUserStats
    void setVisitUserStats(UserStats visitUserStats);

    *//**
     * 从redis中获取所有访问用户
     * @return
     *//*
    List<UserStats> getAllVisitUserStats();*/
    /**
     * 设置最近访客
     * @param userId
     * @param id
     */
    void setUserVisitor(Long userId, Long id);
    /**
     * 获取最近访客的list集合
     *
     * @param userId
     */
    List<Long> getUserVisitor (Long userId);

    /**
     * 判断redis是否有值
     * @param userId
     * @return
     */
    boolean noexistVisitor(Long userId);

    /**
     * 通过token删除对应的redis
     * @param token
     */
    void remove(String token);

    /**
     * 获取User的集合
     * @return
     */
    List<UserStats> getUserStats();

    /**
     * 添加user的关注集合
     * @param userStats
     */
    void setUser(UserStats userStats);

    /**
     * 添加黑名单
     * @param id
     * @param userId
     */
    void setBlack(Long id, Long userId);

    /**
     * 获取黑名单
     *
     * @param id
     */
    List<Long> getBlack(Long id);

}
