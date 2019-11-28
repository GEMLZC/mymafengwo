package cn.wolfcode.luowowo.comment.service.impl;

import cn.wolfcode.luowowo.comment.domain.TravelComment;
import cn.wolfcode.luowowo.comment.repository.TravelCommentMongoRepository;
import cn.wolfcode.luowowo.comment.service.ITravelCommentService;
import org.apache.dubbo.config.annotation.Service;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;
import java.util.Optional;

@Service
public class TravelCommentServiceImpl implements ITravelCommentService {
    @Autowired
    private TravelCommentMongoRepository repository;


    @Override
    public TravelComment save(TravelComment travelComment) {
        if (TravelComment.TRAVEL_COMMENT_TYPE.equals(travelComment.getType())) {//判断是回复评论
            //查询出原来的评论
            Optional<TravelComment> op = repository.findById(travelComment.getRefComment().getId());
            if (op.isPresent()) {
                travelComment.setRefComment(op.get());//再设置给回复评论
            }
        }

        repository.save(travelComment);
        return travelComment;
    }

    @Override
    public List<TravelComment> queryByTravelId(Long id) {
        return repository.findByTravelId(id);
    }

    @Override
    public TravelComment getLatestComment(Long travelId) {
        List<TravelComment> comments = repository.findByTravelIdOrderByCreateTimeDesc(travelId);
        if(comments.size()!=0){
            TravelComment travelComment = comments.get(0);
            return travelComment;
        }
        return null;
    }
}
