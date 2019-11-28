package cn.wolfcode.luowowo.cache.service.impl;

import cn.wolfcode.luowowo.cache.key.RedisKey;
import cn.wolfcode.luowowo.cache.service.IVerifyCodeCacheService;
import org.apache.dubbo.config.annotation.Service;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.data.redis.core.ValueOperations;

import java.util.concurrent.TimeUnit;

@Service
public class VerifyCodeCacheServiceImpl implements IVerifyCodeCacheService{
    @Autowired
    private StringRedisTemplate redisTemplate;

    @Override
    public void setVerifyCode(String phone, String verifyCode) {
        //把验证码存到redis设置过期时间为60秒，最后一个参数为单位
        redisTemplate.opsForValue().set(RedisKey.VERIFY_CODE.getCacheKey(phone),
                verifyCode,RedisKey.VERIFY_CODE.getTimeout(), TimeUnit.MILLISECONDS);
    }

    @Override
    public String getVerifyCode(String phone) {
        return redisTemplate.opsForValue().get(RedisKey.VERIFY_CODE.getCacheKey(phone));
    }
}
