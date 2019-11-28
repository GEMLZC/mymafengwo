package cn.wolfcode.luowowo.comment.domain;

import lombok.Getter;
import lombok.Setter;
import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;

import java.io.Serializable;
import java.util.Date;

/**
 * Created by Xhek on 2019/11/26.
 */
@Setter
@Getter
@Document("view_commentBack")
//评论点评及回复
public class ViewCommentBack implements Serializable{

    public static final Integer VIEW_NOMAL_TYPE=0;//普通评论
    public static final Integer VIEW_BACK_TYPE=1;//回复评论

    @Id
    private String id;//该评论的id

    private Long commentId;//评论 的点评文章id

    private Long userId;//发表的用户

    private String username;//用户名字

    private String headUrl;//用户头像

    private Date createTime;//创建时间

    private String content;//内容

    private Integer type = VIEW_NOMAL_TYPE;

    private ViewCommentBack refComment;//引用的评论



}
