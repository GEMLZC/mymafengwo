package cn.wolfcode.luowowo.cache.vo;

import lombok.Getter;
import lombok.Setter;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * 用户回答
 */
@Setter
@Getter
public class QuestionUser implements Serializable{
    private Long userId;
    private String nickname; //昵称
    private Integer level; //等级
    private String headImgUrl; //头像
    private Integer goldMedalNum = 0; //金牌数
    private Integer thumpsupnum = 0;//被顶数
    private Date creatTime;//创建时间

    List<QuestionsContent> questions = new ArrayList<>();//问题

    public int  getReplyNum(){
        return questions.size();
    }
}
