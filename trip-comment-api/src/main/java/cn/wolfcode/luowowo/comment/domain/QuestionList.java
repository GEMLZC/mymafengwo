package cn.wolfcode.luowowo.comment.domain;

import cn.wolfcode.luowowo.member.domain.UserInfo;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class QuestionList extends CommunityQuestion{
    //展示列表的单个图片和文字内容、单个用户信息
    private String imgUrl;
    private String txt;
    private UserInfo user;
    private int replynum;//回答数
}
