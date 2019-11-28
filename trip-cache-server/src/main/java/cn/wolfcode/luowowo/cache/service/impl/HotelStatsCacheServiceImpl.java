package cn.wolfcode.luowowo.cache.service.impl;

import cn.wolfcode.luowowo.cache.key.RedisKey;
import cn.wolfcode.luowowo.cache.service.IHotelStatsCacheService;
import com.alibaba.fastjson.JSON;
import org.apache.dubbo.config.annotation.Service;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.StringRedisTemplate;

import java.util.ArrayList;
import java.util.List;

@Service
public class HotelStatsCacheServiceImpl implements IHotelStatsCacheService {
    @Autowired
    private StringRedisTemplate redisTemplate;
    public boolean favor(Long hotelId, Long userId) {
        boolean flag = false;//返回标志
        int num = 0;//收藏数
        List<Long> ids = new ArrayList<>();//该集合为攻略下收藏用户id的集合
        String cacheKey = RedisKey.HOTEL_STATS_FAVOR.getCacheKey(userId);

        //获取用户的收藏列表
        String arrIds = redisTemplate.opsForValue().get(cacheKey);
        //如果收藏列表不为空解析为一个集合
        if (arrIds != null) {
            //解析为一个集合操作
            ids = JSON.parseArray(arrIds, Long.class);
        }

        if (ids.contains(hotelId)) {//存在说明是取消收藏
            ids.remove(hotelId);
            num = -1;
        } else {
            //收藏
            ids.add(hotelId);
            num = 1;
            flag = true;
        }
        //更新数据(redis的攻略收藏统计数据和创建、更新一个用户收藏信息)
        redisTemplate.opsForValue().set(cacheKey, JSON.toJSONString(ids));
       /* incrById(hotelId, num, FAVOR_NUM);*/
        return flag;
    }

    public boolean isFavor(Long hotelId, Long userId) {
        String cacheKey = RedisKey.HOTEL_STATS_FAVOR.getCacheKey(userId);
        String json = redisTemplate.opsForValue().get(cacheKey);
        if (json != null) {
            List<Long> ids = JSON.parseArray(json, Long.class);
            return ids.contains(hotelId);//判断有无攻略的id
        }
        return false;
    }
}
