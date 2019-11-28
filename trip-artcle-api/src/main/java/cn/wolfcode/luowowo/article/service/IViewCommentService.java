package cn.wolfcode.luowowo.article.service;

import cn.wolfcode.luowowo.article.domain.ViewComment;
import cn.wolfcode.luowowo.comment.domain.ViewCommentBack;
import cn.wolfcode.luowowo.common.query.QueryObject;
import cn.wolfcode.luowowo.common.util.AjaxResult;
import com.github.pagehelper.PageInfo;

import java.util.List;

/**
 * Created by Xhek on 2019/11/24.
 */
public interface IViewCommentService {

    PageInfo query(QueryObject qo);

    /**
     * 添加景点点评
     * @param comment
     * @return
     */
    AjaxResult save(ViewComment comment);


    /**
     * 查询某条点评数据
     * @param commentId
     */
    ViewComment get(Long commentId);

    /**
     * 更新点赞数
     * @param viewComment
     */
    void update(ViewComment viewComment);

    /**
     * 根据用户id获取其评论
     * @param uid
     * @return
     */
    List<ViewComment> getByUserId(Long uid);
}
