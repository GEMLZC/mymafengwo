package cn.wolfcode.luowowo.comment.repository;

import cn.wolfcode.luowowo.comment.domain.StrategyComment;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.mongodb.repository.MongoRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface StrategyCommentMongoRepository extends MongoRepository<StrategyComment, String> {
    Page<StrategyComment> findByDetailId(Long detailId,Pageable pageable);


    List<StrategyComment> findByDetailIdOrderByCreateTimeDesc(Long detailId);
}
