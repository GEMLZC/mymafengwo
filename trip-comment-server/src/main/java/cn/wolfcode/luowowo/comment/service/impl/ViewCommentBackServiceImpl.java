package cn.wolfcode.luowowo.comment.service.impl;

import cn.wolfcode.luowowo.comment.domain.ViewCommentBack;
import cn.wolfcode.luowowo.comment.repository.ViewCommentBackMongoRepository;
import cn.wolfcode.luowowo.comment.service.IViewCommentBackService;
import org.apache.dubbo.config.annotation.Service;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;
import java.util.Optional;

/**
 * Created by Xhek on 2019/11/26.
 */
@Service
public class ViewCommentBackServiceImpl implements IViewCommentBackService {

    @Autowired
    private ViewCommentBackMongoRepository repository;

    @Override
    public ViewCommentBack save(ViewCommentBack commentBack) {
        if (ViewCommentBack.VIEW_BACK_TYPE.equals(commentBack.getType())){
            Optional<ViewCommentBack> optional = repository.findById(commentBack.getRefComment().getId());
            if (optional.isPresent()) {
                ViewCommentBack cb = optional.get();
                System.out.println(cb.toString());
                commentBack.setRefComment(optional.get());
            }
        }

        repository.save(commentBack);
        return commentBack;
    }

    @Override
    public List<ViewCommentBack> findByCommentId(Long commentId) {
        if(commentId!=null){
            List<ViewCommentBack> commentBacks = repository.findByCommentId(commentId);
            return commentBacks;
        }

        return null;
    }
}
