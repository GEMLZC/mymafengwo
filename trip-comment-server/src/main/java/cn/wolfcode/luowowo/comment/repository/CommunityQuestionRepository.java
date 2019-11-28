package cn.wolfcode.luowowo.comment.repository;

import cn.wolfcode.luowowo.comment.domain.CommunityQuestion;
import org.springframework.data.mongodb.repository.MongoRepository;
import org.springframework.stereotype.Repository;

/**
 * 问答crud
 */
@Repository
public interface CommunityQuestionRepository extends MongoRepository<CommunityQuestion, String> {
}
