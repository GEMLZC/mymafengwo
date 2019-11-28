package cn.wolfcode.luowowo.comment.repository;

import cn.wolfcode.luowowo.comment.domain.ViewCommentBack;
import org.springframework.data.mongodb.repository.MongoRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by Xhek on 2019/11/26.
 */

@Repository
public interface ViewCommentBackMongoRepository extends MongoRepository<ViewCommentBack,String>{

    List<ViewCommentBack> findByCommentId(Long commentId);
}
