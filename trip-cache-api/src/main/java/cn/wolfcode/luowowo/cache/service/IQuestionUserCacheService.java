package cn.wolfcode.luowowo.cache.service;

import cn.wolfcode.luowowo.cache.vo.QuestionUser;
import cn.wolfcode.luowowo.comment.domain.CommunityQuestion;

import java.util.List;

public interface IQuestionUserCacheService {
    /**
     * 设置用户的回答的问题,保存在redis
     * @param userId
     * @param questionUser
     */
    void setQuestionUser(Long userId, QuestionUser questionUser, CommunityQuestion communityQuestion);

    /**
     * 获取用户回答的问题信息
     * @param userId
     * @return
     */
    QuestionUser getQuestionUser(Long userId);

    /**
     * 查询前十的回答
     * @return
     */
    List<QuestionUser> listTop10();

}
