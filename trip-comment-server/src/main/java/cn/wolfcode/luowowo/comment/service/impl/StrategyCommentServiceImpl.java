package cn.wolfcode.luowowo.comment.service.impl;

import cn.wolfcode.luowowo.comment.domain.StrategyComment;
import cn.wolfcode.luowowo.comment.domain.TravelComment;
import cn.wolfcode.luowowo.comment.query.StrategyCommentQuery;
import cn.wolfcode.luowowo.comment.repository.StrategyCommentMongoRepository;
import cn.wolfcode.luowowo.comment.service.IStrategyCommentService;
import org.apache.dubbo.config.annotation.Service;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;

import java.util.List;
import java.util.Optional;

@Service
public class StrategyCommentServiceImpl implements IStrategyCommentService {
    @Autowired
    private StrategyCommentMongoRepository repository;

    @Override
    public void save(StrategyComment strategyComment) {
        repository.save(strategyComment);
    }

    @Override
    public Page<StrategyComment> queryByDetailId(StrategyCommentQuery qo) {
        //分页
        Pageable pageable = new PageRequest(qo.getCurrentPage() - 1, qo.getPageSize());
        return repository.findByDetailId(qo.getDetailId(), pageable);
    }

    @Override
    public void commentThumbUp(Long fromId, String toId) {
        //根据id查询评论
        Optional<StrategyComment> op = repository.findById(toId);
        op.ifPresent(commont -> {
            //获取点赞的集合
            List<Long> thumbupList = commont.getThumbuplist();
            if (thumbupList.contains(fromId)) {//集合中存在该id了，说明是取消点赞
                thumbupList.remove(fromId);
            } else {
                thumbupList.add(fromId);
            }
            //设置点赞数
            commont.setThumbupnum(thumbupList.size());
            //再次保存评论
            repository.save(commont);
        });
    }

    @Override
    public StrategyComment getLatestComment(Long detailId) {

        final List<StrategyComment> comments = repository.findByDetailIdOrderByCreateTimeDesc(detailId);
        if(comments.size()!=0){
            StrategyComment strategyComment = comments.get(0);
            return strategyComment;
        }

        return null;
    }
}
