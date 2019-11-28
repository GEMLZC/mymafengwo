package cn.wolfcode.luowowo.comment.service;

import cn.wolfcode.luowowo.comment.domain.TravelComment;

import java.util.List;

public interface ITravelCommentService {
    /**
     * 新增评论
     * @param travelComment
     */
    TravelComment save(TravelComment travelComment);

    /**
     * 通过游记id查询全部游记评论
     * @return
     */
    List<TravelComment> queryByTravelId(Long id);
    /**
     * 根据游记查询出游记最新评论
     * @param travelId
     * @return
     */
    TravelComment getLatestComment(Long travelId);
}
