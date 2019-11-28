package cn.wolfcode.luowowo.comment.service;

import cn.wolfcode.luowowo.comment.domain.CommunityQuestion;
import cn.wolfcode.luowowo.common.query.QueryObject;

import java.util.List;

public interface ICommunityQuestionService {
    /**
     * 保存信息
     * @param communityQuestion
     */
    CommunityQuestion save(CommunityQuestion communityQuestion);

    /**
     * 通过id查询
     * @param id
     * @return
     */
    CommunityQuestion queryById(String id);

    /**
     * 分页查询
     * @param qo
     * @return
     */
    List<CommunityQuestion> query(QueryObject qo);

}
