package cn.wolfcode.luowowo.cache.service.impl;

import cn.wolfcode.luowowo.cache.key.RedisKey;
import cn.wolfcode.luowowo.cache.service.IUserInfoCacheService;
import cn.wolfcode.luowowo.cache.vo.StrategyStats;
import cn.wolfcode.luowowo.cache.vo.TravelStats;
import cn.wolfcode.luowowo.cache.vo.UserStats;
import cn.wolfcode.luowowo.common.util.DateUtil;
import com.alibaba.fastjson.JSON;
import org.apache.dubbo.config.annotation.Service;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.StringRedisTemplate;

import java.util.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;
import java.util.concurrent.TimeUnit;

@Service
public class UserInfoCacheServiceImpl implements IUserInfoCacheService {
    @Autowired
    private StringRedisTemplate redisTemplate;

    @Override
    public void setUserInfo(String token, String json) {
        redisTemplate.opsForValue().set(RedisKey.USER_INFO.getCacheKey(token), json,
                RedisKey.USER_INFO.getTimeout(), TimeUnit.MILLISECONDS);
    }

    @Override
    public String getUserInfo(String token) {
        String cacheKey = RedisKey.USER_INFO.getCacheKey(token);
        String json = redisTemplate.opsForValue().get(cacheKey);
        //如果一直使用json数据，那么自动延长过期时间
        if (json != null) {
            redisTemplate.expire(cacheKey, RedisKey.USER_INFO.getTimeout(), TimeUnit.MILLISECONDS);
        }
        return json;
    }

    @Override
    public boolean noExistUser(Long userId) {
        return (getByUserId(userId)) == null;
    }

    @Override
    public UserStats getByUserId(Long userId) {
        String cacheKey = RedisKey.USE_STATS.getCacheKey(userId);
        String json = redisTemplate.opsForValue().get(cacheKey);
        return JSON.parseObject(json, UserStats.class);
    }

    @Override
    public void setUserStats(UserStats userStats) {
        String cacheKey = RedisKey.USE_STATS.getCacheKey(userStats.getUserId());
        redisTemplate.opsForValue().set(cacheKey, JSON.toJSONString(userStats));

    }

    public List<UserStats> getUserStats() {
        List<UserStats> list = new ArrayList<>();
        String cacheKey = RedisKey.USER_LIST.getCacheKey("*");
        Set<String> keys = redisTemplate.keys(cacheKey);//通配符查询出攻略统计所有对象
        for (String key : keys) {
            String json = redisTemplate.opsForValue().get(key);
            UserStats userStats = JSON.parseObject(json, UserStats.class);
            list.add(userStats);
        }

        return list;

    }

    public void setUser(UserStats userStats) {
        String cacheKey = RedisKey.USER_LIST.getCacheKey(userStats.getUserId());
        redisTemplate.opsForValue().set(cacheKey, JSON.toJSONString(userStats));
    }


    public void setBlack(Long id, Long userId) {
        String cacheKey = RedisKey.USE_BLACK.getCacheKey(id);
        List<Long> list = getBlack(id);

        if (list.size()==0) {
            list.add(userId);
        }else{
            if (!list.contains(userId)) {
                //如果不包含的话就添加
                list.add(userId);
            }
        }

        redisTemplate.opsForValue().set(cacheKey, JSON.toJSONString(list));
}

    public List<Long> getBlack(Long id) {
        String cacheKey = RedisKey.USE_BLACK.getCacheKey(id);
        String s = redisTemplate.opsForValue().get(cacheKey);
        if (s != null) {
            List<Long> list = JSON.parseArray(s, Long.class);
            return list;
        } else {
            return new ArrayList<Long>();
        }
    }

    @Override
    public boolean noExistUserTodaynum(Long userId) {

        return (getByUserIdForTodayNum(userId)) == null;
    }

    @Override
    public UserStats getByUserIdForTodayNum(Long userId) {
        String cacheKey = RedisKey.USE_STATS_DAY_VISIT.getCacheKey(userId);
        String json = redisTemplate.opsForValue().get(cacheKey);
        return JSON.parseObject(json, UserStats.class);

    }

    @Override
    public void setUserTodayNum(UserStats userStats) {
        String cacheKey = RedisKey.USE_STATS_DAY_VISIT.getCacheKey(userStats.getUserId());
        String jsonString = JSON.toJSONString(userStats);
        System.out.println("json字符串:"+jsonString);
        Date nowDate = new Date();//当前时间
        Date endDate = DateUtil.getEndDate(nowDate);//24点
        //redisTemplate.opsForValue().set(cacheKey, JSON.toJSONString(userStats));
        redisTemplate.opsForValue().set(cacheKey, jsonString,
                DateUtil.getDateBetween(endDate, nowDate),
                TimeUnit.MILLISECONDS);
    }

    @Override
    public List<UserStats> getAllViewNum() {
        List<UserStats> list = new ArrayList<>();
        String cacheKey = RedisKey.USE_STATS.getCacheKey("*");
        Set<String> keys = redisTemplate.keys(cacheKey);//通配符查询出攻略统计所有对象
        for (String key : keys) {
            String json = redisTemplate.opsForValue().get(key);
            UserStats userStats = JSON.parseObject(json, UserStats.class);
            list.add(userStats);
        }

        return list;

    }

    /*@Override
    public void setVisitUserStats(UserStats visitUserStats) {
        String cacheKey = RedisKey.USER_VISITOR.getCacheKey(visitUserStats.getUserId());
        redisTemplate.opsForValue().set(cacheKey, JSON.toJSONString(visitUserStats));
    }

    @Override
    public List<UserStats> getAllVisitUserStats() {
        List<UserStats> list = new ArrayList<>();
        String cacheKey = RedisKey.USER_VISITOR.getCacheKey("*");
        Set<String> keys = redisTemplate.keys(cacheKey);//通配符查询出攻略统计所有对象
        for (String key : keys) {
            String json = redisTemplate.opsForValue().get(key);
            UserStats userStats = JSON.parseObject(json, UserStats.class);
            list.add(userStats);
        }
        Collections.reverse(list); // 倒序排列
        return list;
    }*/

    public void setUserVisitor(Long userId, Long id) {
        String cacheKey = RedisKey.USER_VISITOR.getCacheKey(userId);
        List<Long> list = getUserVisitor(userId);
        if (list.size()==0) {
            list.add(id);
        }else{
            if (!list.contains(id)) {
                //如果不包含的话就添加
                list.add(0,id);
            }
        }
        redisTemplate.opsForValue().set(cacheKey, JSON.toJSONString(list));
    }

    public List<Long> getUserVisitor(Long userId) {
        String cacheKey = RedisKey.USER_VISITOR.getCacheKey(userId);
        String s = redisTemplate.opsForValue().get(cacheKey);
        if (s != null) {
            List<Long> list = JSON.parseArray(s, Long.class);
            return list;
        } else {
            return new ArrayList<Long>();
        }
    }

    public boolean noexistVisitor(Long userId) {
        return getUserVisitor(userId) == null;
    }

    public void remove(String token) {
        String cacheKey = RedisKey.USER_INFO.getCacheKey(token);
        redisTemplate.delete(cacheKey);
    }


}
