package cn.wolfcode.luowowo.comment.service.impl;

import cn.wolfcode.luowowo.comment.domain.CommunityQuestion;
import cn.wolfcode.luowowo.comment.repository.CommunityQuestionRepository;
import cn.wolfcode.luowowo.comment.service.ICommunityQuestionService;
import cn.wolfcode.luowowo.common.query.QueryObject;
import org.apache.dubbo.config.annotation.Service;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.mongodb.core.MongoTemplate;

import java.util.List;

@Service
public class CommunityQuestionServiceImpl implements ICommunityQuestionService {
    @Autowired
    private CommunityQuestionRepository repository;
    @Autowired
    private MongoTemplate template;

    @Override
    public CommunityQuestion save(CommunityQuestion communityQuestion) {
        if (communityQuestion.getId() != null){
            repository.save(communityQuestion);
            return communityQuestion;
        }
        return template.insert(communityQuestion);
    }

    @Override
    public CommunityQuestion queryById(String id) {
        return repository.findById(id).get();
    }

    @Override
    public List<CommunityQuestion> query(QueryObject qo) {
        Pageable pageable = new PageRequest(qo.getCurrentPage()-1,qo.getPageSize());
        return repository.findAll(pageable).getContent();
    }
}
