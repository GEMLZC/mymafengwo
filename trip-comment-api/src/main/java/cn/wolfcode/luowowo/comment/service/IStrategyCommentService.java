package cn.wolfcode.luowowo.comment.service;

import cn.wolfcode.luowowo.comment.domain.StrategyComment;
import cn.wolfcode.luowowo.comment.domain.TravelComment;
import cn.wolfcode.luowowo.comment.query.StrategyCommentQuery;
import org.springframework.data.domain.Page;

public interface IStrategyCommentService {

    /**
     * 新增评论
     * @param strategyComment
     */
    void save(StrategyComment strategyComment);

    /**
     * 根据攻略明细id查询评论
     * @param qo
     * @return
     */
    Page<StrategyComment> queryByDetailId(StrategyCommentQuery qo);

    /**
     * 点赞
     * @param fromId
     * @param toId
     */
    void commentThumbUp(Long fromId, String toId);

    /**
     * 获取最新回复
     * @param detailId
     * @return
     */
    StrategyComment getLatestComment(Long detailId);
}
