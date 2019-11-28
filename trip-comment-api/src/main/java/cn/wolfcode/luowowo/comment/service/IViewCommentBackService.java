package cn.wolfcode.luowowo.comment.service;

import cn.wolfcode.luowowo.comment.domain.ViewCommentBack;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

/**
 * Created by Xhek on 2019/11/26.
 */
public interface IViewCommentBackService {


    /**
     * 保存景点点评的评论
     * @param commentBack
     * @return
     */
    ViewCommentBack save(ViewCommentBack commentBack);

    /**
     * 根据点评的id查评论
     * @param commentId
     * @return
     */
    List<ViewCommentBack> findByCommentId(Long commentId);
}
