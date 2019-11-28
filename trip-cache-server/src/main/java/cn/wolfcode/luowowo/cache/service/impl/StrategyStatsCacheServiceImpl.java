package cn.wolfcode.luowowo.cache.service.impl;

import cn.wolfcode.luowowo.article.domain.StrategyCollect;
import cn.wolfcode.luowowo.article.domain.StrategyDetail;
import cn.wolfcode.luowowo.article.domain.Travel;
import cn.wolfcode.luowowo.article.service.IStrategyDetailService;
import cn.wolfcode.luowowo.cache.key.RedisKey;
import cn.wolfcode.luowowo.cache.service.IStrategyStatsCacheService;
import cn.wolfcode.luowowo.cache.vo.StrategyStats;

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
public class StrategyStatsCacheServiceImpl implements IStrategyStatsCacheService {
    @Autowired
    private StringRedisTemplate redisTemplate;
    @Reference
    private IStrategyDetailService strategyDetailService;

    @Override
    public void setStrategyStats(StrategyStats strategyStats) {
        String cacheKey = RedisKey.STRATEGY_STATS.getCacheKey(strategyStats.getStrategyId());
        redisTemplate.opsForValue().set(cacheKey, JSON.toJSONString(strategyStats));
    }

    @Override
    public StrategyStats getByStrategyId(Long id) {
        String cacheKey = RedisKey.STRATEGY_STATS.getCacheKey(id);
        String json = redisTemplate.opsForValue().get(cacheKey);
        return JSON.parseObject(json, StrategyStats.class);
    }

    @Override
    public void incrById(Long strategyId, int num, int type) {
        StrategyStats stats = getByStrategyId(strategyId);
        switch (type) {
            case VIEW_NUM://阅读数
                stats.setViewnum(stats.getViewnum() + num);
                break;
            case REPLY_NUM://回复数
                stats.setReplynum(stats.getReplynum() + num);
                break;
            case FAVOR_NUM://收藏数
                stats.setFavornum(stats.getFavornum() + num);
                break;
            case THUMBUP_NUM://点赞数
                stats.setThumbsupnum(stats.getThumbsupnum() + num);
                break;
            case SHARE_NUM://分享数
                stats.setSharenum(stats.getSharenum() + num);
                break;
        }
        //再保存到redis中（更新数据）
        setStrategyStats(stats);
    }

    @Override
    public boolean favor(Long strategyId, Long userId) {
        boolean flag = false;//返回标志
        int num = 0;//收藏数
        List<Long> ids = new ArrayList<>();//该集合为攻略下收藏用户id的集合
        String cacheKey = RedisKey.STRATEGY_STATS_FAVOR.getCacheKey(userId);
        System.out.println("点击游记收藏");
        //获取用户的收藏列表
        String arrIds = redisTemplate.opsForValue().get(cacheKey);
        //如果收藏列表不为空解析为一个集合
        if (arrIds != null) {
            //解析为一个集合操作
            ids = JSON.parseArray(arrIds, Long.class);
        }

        if (ids.contains(strategyId)) {//存在说明是取消收藏
            ids.remove(strategyId);
            num = -1;
        } else {
            //收藏
            ids.add(strategyId);
            num = 1;
            flag = true;
        }
        //更新数据(redis的攻略收藏统计数据和创建、更新一个用户收藏信息)
        redisTemplate.opsForValue().set(cacheKey, JSON.toJSONString(ids));
        incrById(strategyId, num, FAVOR_NUM);
        return flag;
    }

    @Override
    public boolean isFavor(Long strategyId, Long userId) {
        String cacheKey = RedisKey.STRATEGY_STATS_FAVOR.getCacheKey(userId);
        String json = redisTemplate.opsForValue().get(cacheKey);
        if (json != null) {
            List<Long> ids = JSON.parseArray(json, Long.class);
            return ids.contains(strategyId);//判断有无攻略的id
        }
        return false;
    }

    @Override
    public boolean strategyThumbup(Long strategyId, Long userId) {
        String cacheKey = RedisKey.STRATEGY_STATS_THUMBUP.getCacheKey(strategyId + ":" + userId);
        String json = redisTemplate.opsForValue().get(cacheKey);
        if (json == null) {
            Date nowDate = new Date();//当前时间
            Date endDate = DateUtil.getEndDate(nowDate);//24点

            redisTemplate.opsForValue().set(cacheKey, "yes",
                    DateUtil.getDateBetween(endDate, nowDate),
                    TimeUnit.MILLISECONDS);
            //更新点赞统计数
            incrById(strategyId, 1, THUMBUP_NUM);
            return true;
        }
        return false;
    }

    @Override
    public List<StrategyStats> getAllStrategyStatis() {
        List<StrategyStats> list = new ArrayList<>();
        String cacheKey = RedisKey.STRATEGY_STATS.getCacheKey("*");
        Set<String> keys = redisTemplate.keys(cacheKey);//通配符查询出攻略统计所有对象
        for (String key : keys) {
            String json = redisTemplate.opsForValue().get(key);
            StrategyStats stats = JSON.parseObject(json, StrategyStats.class);
            list.add(stats);
        }

        return list;
    }

    @Override
    public boolean noExistStrategy(Long strategyDetailId) {
        return getByStrategyId(strategyDetailId) == null;
    }

    @Override
    public boolean noExistLead(RedisKey key, Long id) {
        String name = RedisKey.STRATEGY_STATS.getCacheKey(id);
        return redisTemplate.opsForZSet().rank(key.getPrefix(),name) == null;
    }

    @Override
    public void addRank(RedisKey key, int num, Long id) {
        String name = RedisKey.STRATEGY_STATS.getCacheKey(id);
        //存入zset
        redisTemplate.opsForZSet().incrementScore(key.getPrefix(),name,num);//偏移数值是为了可以通用调用
    }

    @Override
    public List<StrategyStats> listRankTop10(RedisKey key) {
        List<StrategyStats> list = new ArrayList<>();
        //分数前十的排行榜
        Set<String> keys = redisTemplate.opsForZSet().reverseRange(key.getPrefix(), 0, 9);
        for (String s : keys) {
            String json = redisTemplate.opsForValue().get(s);

            list.add(JSON.parseObject(json, StrategyStats.class));
        }
        return list;
    }

    @Override
    public List<StrategyDetail> getfavor(Long uid) {
        List<Long> ids = new ArrayList<>();//该集合为攻略下收藏用户id的集合
        String cacheKey = RedisKey.STRATEGY_STATS_FAVOR.getCacheKey(uid);

        //获取用户的收藏列表
        String arrIds = redisTemplate.opsForValue().get(cacheKey);
        //如果收藏列表不为空解析为一个集合
        if (arrIds != null) {
            //解析为一个集合操作
            ids = JSON.parseArray(arrIds, Long.class);
        }
        //获取到用户的收藏列表(用户所收藏的攻略的id集合)
        List<StrategyDetail> strategyDeatilList = new ArrayList<>();
        for (Long sid : ids) {
            //根据攻略id查询攻略
            StrategyDetail detail = strategyDetailService.queryById(sid);
            strategyDeatilList.add(detail);
        }


        return strategyDeatilList;
    }

    @Override
    public List<StrategyCollect> getAllfavor() {
        List<StrategyCollect> collectionList = new ArrayList<>();
        String cacheKey = RedisKey.STRATEGY_STATS_FAVOR.getCacheKey("*");

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
            List<Long> sids = JSON.parseArray(json, Long.class);//获取到攻略id集合
            for (Long sid : sids) {
                StrategyCollect strategyCollect = new StrategyCollect();
                strategyCollect.setUserid(uid);
                strategyCollect.setStrategyid(sid);
                collectionList.add(strategyCollect);
            }

        }

        return collectionList;

    }

    @Override
    public void setfavor(List<StrategyDetail> strategyDetailList, Long userId) {
        List<Long> ids = new ArrayList<>();//该集合用于封装攻略下收藏用户id的集合

        String cacheKey = RedisKey.STRATEGY_STATS_FAVOR.getCacheKey(userId);

        //获取用户的收藏列表
        String arrIds = redisTemplate.opsForValue().get(cacheKey);
        //如果收藏列表不为空解析为一个集合
        if (arrIds != null) {
            //解析为一个集合操作
            ids = JSON.parseArray(arrIds, Long.class);
        }
        //获取到用户的收藏列表(用户所收藏的攻略的id集合)
        for (StrategyDetail strategyDetail : strategyDetailList) {
            final Long sid = strategyDetail.getId();
            if(!ids.contains(sid)){
                ids.add(sid);
            }
        }
        redisTemplate.opsForValue().set(cacheKey, JSON.toJSONString(ids));

    }
}
