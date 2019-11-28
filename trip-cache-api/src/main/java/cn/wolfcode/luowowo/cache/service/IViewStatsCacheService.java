package cn.wolfcode.luowowo.cache.service;

import cn.wolfcode.luowowo.article.domain.View;
import cn.wolfcode.luowowo.common.util.AjaxResult;

import java.util.List;

/**
 * Created by Xhek on 2019/11/24.
 */
public interface IViewStatsCacheService {
    final int VISIT_NUM=1;
    final int FAVOR_NUM=2;


    /**
     * 用户去过某景点(添加足迹
     * @param userId
     * @param viewId
     * return true表示添加足迹
     *        false表示取消
     */
    boolean visit(Long userId,Long viewId);


    /**
     * 用户收藏景点
     * @param userId
     * @param viewId
     * @return
     */
    boolean favor(Long userId, Long viewId);

    /**
     * 点赞景点点评
     * @param commentId
     * @param userId
     * @return
     */
    AjaxResult thumbsUpComment(Long commentId, Long userId);


    /**
     * 获取景点点评的点赞列表
     * @param commentId
     * @return
     */
    AjaxResult getThumbupUser(Long commentId);

    /**
     * 获取用户收藏的景点
     * @param userId
     * @return
     */
    List<Long> getfavor(Long userId);


}
