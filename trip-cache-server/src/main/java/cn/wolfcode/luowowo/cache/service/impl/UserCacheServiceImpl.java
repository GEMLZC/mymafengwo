package cn.wolfcode.luowowo.cache.service.impl;

import cn.wolfcode.luowowo.cache.service.IUserCacheService;
import cn.wolfcode.luowowo.common.util.DateUtil;
import org.apache.dubbo.config.annotation.Service;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.StringRedisTemplate;

import java.util.Date;
import java.util.concurrent.TimeUnit;

@Service
public class UserCacheServiceImpl implements IUserCacheService {

    @Autowired
    private StringRedisTemplate redisTemplate;


    public String getUserStats(String key) {
        return  redisTemplate.opsForValue().get(key);
    }

    public void incrById(Long id, int num) {

    }

    public void setUserViewnum(String cacheKey, Integer viewnum) {
        redisTemplate.opsForValue().set(cacheKey,viewnum.toString());
    }

    public void setUserTodaynum(String cacheKey, Integer todaynum) {
        Date nowDate = new Date();//当前时间
        Date endDate = DateUtil.getEndDate(nowDate);//24点
        redisTemplate.opsForValue().set(cacheKey, todaynum.toString(),
                DateUtil.getDateBetween(endDate, nowDate),
                TimeUnit.MILLISECONDS);
    }
}
