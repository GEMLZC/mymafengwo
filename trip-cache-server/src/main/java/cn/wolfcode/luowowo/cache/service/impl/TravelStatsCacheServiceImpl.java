package cn.wolfcode.luowowo.cache.service.impl;

import cn.wolfcode.luowowo.article.domain.StrategyCollect;
import cn.wolfcode.luowowo.article.domain.StrategyDetail;
import cn.wolfcode.luowowo.article.domain.Travel;
import cn.wolfcode.luowowo.article.domain.TravelCollect;
import cn.wolfcode.luowowo.article.service.ITravelService;
import cn.wolfcode.luowowo.cache.key.RedisKey;
import cn.wolfcode.luowowo.cache.service.ITravelStatsCacheService;
import cn.wolfcode.luowowo.cache.service.ITravelStatsCacheService;
import cn.wolfcode.luowowo.cache.vo.StrategyStats;
import cn.wolfcode.luowowo.cache.vo.TravelStats;
import cn.wolfcode.luowowo.common.util.DateUtil;
import com.alibaba.fastjson.JSON;
import org.apache.dubbo.config.annotation.Reference;
import org.apache.dubbo.config.annotation.Service;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.StringRedisTemplate;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Set;
import java.util.concurrent.TimeUnit;

@Service
public class TravelStatsCacheServiceImpl implements ITravelStatsCacheService {
    @Autowired
    private StringRedisTemplate redisTemplate;
    @Reference
    private ITravelService travelService;


    @Override
    public void setTravelStats(TravelStats travelStats) {
        String cacheKey = RedisKey.TRAVEL_STATS.getCacheKey(travelStats.getTravelId());
        redisTemplate.opsForValue().set(cacheKey, JSON.toJSONString(travelStats));
    }


    @Override
    public TravelStats getByTravelId(Long id) {
        String cacheKey = RedisKey.TRAVEL_STATS.getCacheKey(id);
        String json = redisTemplate.opsForValue().get(cacheKey);
        return JSON.parseObject(json, TravelStats.class);
    }

    @Override
    public boolean noExistTravel(Long travelId) {
        return (getByTravelId(travelId)) == null;
    }

    @Override
    public boolean travelThumbup(Long travelId, Long userId) {
        String cacheKey = RedisKey.TRAVEL_STATS_THUMBUP.getCacheKey(travelId + ":" + userId);
        String json = redisTemplate.opsForValue().get(cacheKey);
        System.out.println("点赞:"+json);
        if (json == null) {
            Date nowDate = new Date();//当前时间
            //System.out.println(nowDate);
            Date endDate = DateUtil.getEndDate(nowDate);//24点

            redisTemplate.opsForValue().set(cacheKey, "yes",
                    DateUtil.getDateBetween(endDate, nowDate),
                    TimeUnit.MILLISECONDS);
            //更新点赞统计数
            incrById(travelId, 1, ITravelStatsCacheService.THUMBUP_NUM);
            return true;
        }
        return false;
    }
    //统计数增加
    @Override
    public void incrById(Long travelId, int num, int type) {
        TravelStats travelStats = getByTravelId(travelId);
        switch (type) {
            case ITravelStatsCacheService.VIEW_NUM://阅读数
                travelStats.setViewnum(travelStats.getViewnum() + num);
                break;
            case ITravelStatsCacheService.REPLY_NUM://回复数
                travelStats.setReplynum(travelStats.getReplynum() + num);
                break;
            case ITravelStatsCacheService.FAVOR_NUM://收藏数
                travelStats.setFavornum(travelStats.getFavornum() + num);
                break;
            case ITravelStatsCacheService.THUMBUP_NUM://点赞数
                travelStats.setThumbsupnum(travelStats.getThumbsupnum() + num);
                break;
            case ITravelStatsCacheService.SHARE_NUM://分享数
                travelStats.setThumbsupnum(travelStats.getSharenum() + num);
                break;
        }
        //再保存到redis中（更新数据）
        setTravelStats(travelStats);
    }

    @Override
    public boolean favor(Long travelId, Long userId) {
        boolean flag = false;//返回标志
        int num = 0;//收藏数
        List<Long> ids = new ArrayList<>();//该集合为攻略下收藏用户id的集合
        String cacheKey = RedisKey.TRAVEL_STATS_FAVOR.getCacheKey(userId);

        //获取用户的收藏列表
        String arrIds = redisTemplate.opsForValue().get(cacheKey);
        //如果收藏列表不为空解析为一个集合
        if (arrIds != null) {
            //解析为一个集合操作
            ids = JSON.parseArray(arrIds, Long.class);
        }
        if (ids.contains(travelId)) {//存在说明是取消收藏
            ids.remove(travelId);
            num = -1;
        } else {
            //收藏
            ids.add(travelId);
            num = 1;
            flag = true;
        }
        //更新数据(redis的攻略收藏统计数据和创建、更新一个用户收藏信息)
        redisTemplate.opsForValue().set(cacheKey, JSON.toJSONString(ids));
        incrById(travelId, num, FAVOR_NUM);
        return flag;
    }


    @Override
    public void addRank(RedisKey key, int num, Long id) {
        String name = RedisKey.TRAVEL_STATS.getCacheKey(id);
        //存入zset
        redisTemplate.opsForZSet().incrementScore(key.getPrefix(),name,num);//偏移数值是为了可以通用调用
    }

    @Override
    public List<Travel> getfavor(Long userId) {
        List<Long> ids = new ArrayList<>();//该集合为攻略下收藏用户id的集合
        String cacheKey = RedisKey.TRAVEL_STATS_FAVOR.getCacheKey(userId);

        //获取用户的收藏列表
        String arrIds = redisTemplate.opsForValue().get(cacheKey);
        //如果收藏列表不为空解析为一个集合
        if (arrIds != null) {
            //解析为一个集合操作
            ids = JSON.parseArray(arrIds, Long.class);
        }
        //获取到用户的收藏列表(用户所收藏的攻略的id集合)
        List<Travel> travellList = new ArrayList<>();
        for (Long tid : ids) {
            //根据攻略id查询攻略
            final Travel travel = travelService.queryById(tid);
            travellList.add(travel);
        }


        return travellList;
    }

    @Override
    public List<TravelCollect> getAllfavor() {
        List<TravelCollect> collectionList = new ArrayList<>();
        String cacheKey = RedisKey.TRAVEL_STATS_FAVOR.getCacheKey("*");

        Set<String> keys = redisTemplate.keys(cacheKey);//通配符查询出攻略统计所有对象
        for (String key : keys) {
            //获取用户id
            //System.out.println(key);
            String[] temp = key.split(":");
            int length = temp.length;
            String id=temp[length-1];
            Long uid = Long.valueOf(id);
            //System.out.println(uid);

            String json = redisTemplate.opsForValue().get(key);
            List<Long> tids = JSON.parseArray(json, Long.class);//获取到攻略id集合
            for (Long tid : tids) {
                final TravelCollect travelCollect = new TravelCollect();
                travelCollect.setUserid(uid);
                travelCollect.setTravelid(tid);
                collectionList.add(travelCollect);
            }

        }

        return collectionList;

    }

    @Override
    public void setfavor(List<Travel> travelList,Long userId) {

        List<Long> ids = new ArrayList<>();//该集合用于封装攻略下收藏用户id的集合

        String cacheKey = RedisKey.TRAVEL_STATS_FAVOR.getCacheKey(userId);

        //获取用户的收藏列表
        String arrIds = redisTemplate.opsForValue().get(cacheKey);
        //如果收藏列表不为空解析为一个集合
        if (arrIds != null) {
            //解析为一个集合操作
            ids = JSON.parseArray(arrIds, Long.class);
        }
        //获取到用户的收藏列表(用户所收藏的攻略的id集合)
        for (Travel travel : travelList) {
            final Long travelId = travel.getId();
            if(!ids.contains(travelId)){
                ids.add(travelId);
            }
        }
        redisTemplate.opsForValue().set(cacheKey, JSON.toJSONString(ids));
    }
}
