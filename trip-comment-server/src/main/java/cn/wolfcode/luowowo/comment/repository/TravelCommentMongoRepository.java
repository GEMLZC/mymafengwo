package cn.wolfcode.luowowo.comment.repository;

import cn.wolfcode.luowowo.comment.domain.TravelComment;
import org.springframework.data.mongodb.repository.MongoRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface TravelCommentMongoRepository extends MongoRepository<TravelComment, String> {
    List<TravelComment> findByTravelId(Long id);

    List<TravelComment> findByTravelIdOrderByCreateTimeDesc(Long travelId);
}
