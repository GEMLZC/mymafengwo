package cn.wolfcode.luowowo.cache.service;

public interface IUserCacheService {

    String getUserStats(String key);

    /**
     * 统计数增加
     * @param id
     * @param num
     * @param
     */
    void incrById(Long id, int num);

    /**
     * 保存用户的总访问数
     * @param cacheKey
     * @param viewnum
     */
    void setUserViewnum(String cacheKey, Integer viewnum);

    /**
     * 保存用户的当天访问数
     * @param cacheKey
     * @param todaynum
     */
    void setUserTodaynum(String cacheKey, Integer todaynum);
}
