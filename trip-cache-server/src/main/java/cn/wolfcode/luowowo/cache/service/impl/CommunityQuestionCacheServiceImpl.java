package cn.wolfcode.luowowo.cache.service.impl;

import cn.wolfcode.luowowo.cache.key.RedisKey;
import cn.wolfcode.luowowo.cache.service.ICommunityQuestionCacheService;
import com.alibaba.fastjson.JSON;
import org.apache.dubbo.config.annotation.Service;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.StringRedisTemplate;

import java.util.List;
import java.util.concurrent.TimeUnit;

@Service
public class CommunityQuestionCacheServiceImpl implements ICommunityQuestionCacheService {
    @Autowired
    private StringRedisTemplate template;

    @Override
    public void setImgUrl(List<String> imgUrl, Long userId) {
        String cacheKey = RedisKey.COMMUNTIY_IMGURL.getCacheKey(userId);
        template.opsForValue().set(cacheKey, JSON.toJSONString(imgUrl),RedisKey.COMMUNTIY_IMGURL.getTimeout(), TimeUnit.MILLISECONDS);
    }


    @Override
    public List<String> getImgUrl(Long userId) {
        String cacheKey = RedisKey.COMMUNTIY_IMGURL.getCacheKey(userId);
        String json = template.opsForValue().get(cacheKey);
        return JSON.parseArray(json,String.class);
    }
}
