package cn.wolfcode.luowowo.cache.service.impl;

import cn.wolfcode.luowowo.article.domain.View;
import cn.wolfcode.luowowo.cache.key.RedisKey;
import cn.wolfcode.luowowo.cache.service.IViewStatsCacheService;
import cn.wolfcode.luowowo.common.util.AjaxResult;
import com.alibaba.fastjson.JSON;
import com.sun.org.apache.regexp.internal.RE;
import org.apache.dubbo.config.annotation.Reference;
import org.apache.dubbo.config.annotation.Service;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.StringRedisTemplate;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by Xhek on 2019/11/24.
 */
@Service
public class ViewStatsCacheServiceImpl implements IViewStatsCacheService {


    @Autowired
    private StringRedisTemplate template;

    @Override
    public boolean visit(Long userId, Long viewId) {
        boolean flag=false;
        int num=0;
        String cacheKey = RedisKey.HAS_BEEN_COLLECT.getCacheKey(userId);
        //将收藏的景点id存入list
        List<Long> idsArr=new ArrayList<>();
        //先将原有的list查到
        String ids = template.opsForValue().get(cacheKey);
        if (ids!=null){
            //不为空的时候转成数组
            idsArr=JSON.parseArray(ids,Long.class);
        }

        //判断该景点id在不在该用户的足迹中
        if (!(idsArr.contains(viewId))) {
            //不包含的时候 就是添加到用户的足迹列表
            idsArr.add(viewId);
            //用户足迹+1
            num=1;
            flag=true;
        }else {
            //包含 表示已经存在 就是取消去过
            idsArr.remove(viewId);
            //给景点的收藏数-1
            num=-1;
        }


        template.opsForValue().set(cacheKey,JSON.toJSONString(idsArr));
        //修改景点统计数据
//        incr(viewId,VISIT_NUM,num);
        return flag;

    }

    @Override
    public boolean favor(Long userId, Long viewId) {
        boolean flag=false;
        int num=0;
        //先拿到该用户的收藏列表
        String cacheKey = RedisKey.VIEW_STATS_FAVOR.getCacheKey(userId);
        List<Long> idsArr=new ArrayList<>();


        String ids = template.opsForValue().get(cacheKey);
        if (ids!=null){
            idsArr = JSON.parseArray(ids, Long.class);
        }

        //判断景点id是否在用户的收藏列表中
        if (!idsArr.contains(viewId)) {
            idsArr.add(viewId);
            //不包含表示收藏
            num=1;
            flag=true;
        }else {
            //包含表示取消收藏
            idsArr.remove(viewId);
            num=-1;
            flag=false;
        }

        //存入收藏数组
        template.opsForValue().set(cacheKey,JSON.toJSONString(idsArr));
        //修改景点数据
        //-----
        return flag;
    }

    @Override
    public AjaxResult thumbsUpComment(Long commentId, Long userId) {
        AjaxResult result = new AjaxResult();

        boolean flag=false;
        int num=0;//偏移量

        //也是先拿到该评论的点赞列表
        List<Long> idsArr=new ArrayList<>();

        String cacheKey = RedisKey.VIEW_COMMENT_THUMBUP.getCacheKey(commentId);
        String ids = template.opsForValue().get(cacheKey);

        if (ids!=null){
            idsArr=JSON.parseArray(ids,Long.class);
        }

        if (!idsArr.contains(userId)){
            //不包含的时候 添加点赞
            idsArr.add(userId);
            flag=true;
            num=1;

        }else {
            //包含的时候取消点赞
            idsArr.remove(userId);
            num=-1;
        }

        //重新保存点赞数据
        template.opsForValue().set(cacheKey,JSON.toJSONString(idsArr));

        //保存该点评的点赞数
        String numKey = RedisKey.VIEW_COMMENT_THUMBUP_NUM.getCacheKey(commentId);
        template.opsForValue().increment(numKey,num);

        result.setSuccess(flag);
        return result;

    }

    @Override
    public AjaxResult getThumbupUser(Long commentId) {
        AjaxResult result = new AjaxResult();
        try {
            String cacheKey = RedisKey.VIEW_COMMENT_THUMBUP.getCacheKey(commentId);
            String ids = template.opsForValue().get(cacheKey);
            System.out.println(ids);
            if (ids!=null&&ids!="[]"){
                List<Long> list = JSON.parseArray(ids, Long.class);
                result.setData(list);
            }
        }catch (Exception e){
            e.printStackTrace();
            result.mark(e.getMessage());
        }

        return result;
    }

    @Override
    public List<Long> getfavor(Long userId) {

        //先拿到该用户的收藏列表
        String cacheKey = RedisKey.VIEW_STATS_FAVOR.getCacheKey(userId);
        List<Long> idsArr=new ArrayList<>();


        String ids = template.opsForValue().get(cacheKey);
        if (ids!=null){
            idsArr = JSON.parseArray(ids, Long.class);
        }



        return idsArr;
    }

}
