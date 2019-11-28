package cn.wolfcode.luowowo.cache.service.impl;

import cn.wolfcode.luowowo.cache.key.RedisKey;
import cn.wolfcode.luowowo.cache.service.IQuestionUserCacheService;
import cn.wolfcode.luowowo.cache.vo.QuestionUser;
import cn.wolfcode.luowowo.cache.vo.QuestionsContent;
import cn.wolfcode.luowowo.comment.domain.CommunityQuestion;
import com.alibaba.fastjson.JSON;
import org.apache.dubbo.config.annotation.Service;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.StringRedisTemplate;

import java.util.*;

@Service
public class QuestionUserCacheServiceImpl implements IQuestionUserCacheService {
    @Autowired
    private StringRedisTemplate template;

    @Override
    public void setQuestionUser(Long userId, QuestionUser questionUser, CommunityQuestion communityQuestion) {
        //如果当用户是第一次提问
        String cacheKey = RedisKey.QUESTION_USER.getCacheKey(userId);
        String json = template.opsForValue().get(cacheKey);
        //问题内容
        QuestionsContent content = new QuestionsContent();
        content.setQuestionId(communityQuestion.getId());
        content.setTitle(communityQuestion.getTitle());
        if (json == null) {
            //直接保存就好
            List<QuestionsContent> questions = questionUser.getQuestions();

            questions.add(content);
            questionUser.setQuestions(questions);
            template.opsForValue().set(cacheKey, JSON.toJSONString(questionUser));
        } else {
            QuestionUser qu = JSON.parseObject(json, QuestionUser.class);
            List<QuestionsContent> questions = qu.getQuestions();
            //设置问题内容
            questions.add(content);
            questionUser.setQuestions(questions);

            template.opsForValue().set(cacheKey, JSON.toJSONString(questionUser));
        }
    }

    @Override
    public QuestionUser getQuestionUser(Long userId) {
        String cacheKey = RedisKey.QUESTION_USER.getCacheKey(userId);
        String json = template.opsForValue().get(cacheKey);

        return json == null ? null : JSON.parseObject(json, QuestionUser.class);
    }

    @Override
    public List<QuestionUser> listTop10() {
        List<QuestionUser> list = new ArrayList<>();
        List<QuestionUser> listTop10 = new ArrayList<>();
        String cacheKey = RedisKey.QUESTION_USER.getCacheKey("*");
        Set<String> keys = template.keys(cacheKey);//通配符查询出攻略统计所有对象
        for (String key : keys) {
            String json = template.opsForValue().get(key);
            QuestionUser qu = JSON.parseObject(json, QuestionUser.class);
            list.add(qu);
        }

        Collections.sort(list, new Comparator<QuestionUser>() {
            //返回1说明： 当前对象 > 待比较对象
            //返回-1说明：当前对象 > 待比较对象
            //返回0说明： 当前对象 = 待比较对象
            // o1>o2 返回 1 ，则升序排列
            // o1<o2 返回-1 ，则降序序排列
            @Override
            public int compare(QuestionUser o1, QuestionUser o2) {
                int size1 = o1.getQuestions().size();
                int size2 = o2.getQuestions().size();
                return size1 < size2 ? 1 : (size1 == size2 ? 0 : -1);
            }
        });
        int size = list.size();
        if (size > 10) {
            size = 10;
        }
        //只需要最多10个
        for (int i = 0; i < size; i++) {
            listTop10.add(list.get(i));
        }

        return listTop10;
    }
}
