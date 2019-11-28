package cn.wolfcode.luowowo.comment.domain;

import lombok.Getter;
import lombok.Setter;
import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;

import java.io.Serializable;
import java.util.Date;

@Getter@Setter
@Document("travel_comment")
public class TravelComment implements Serializable {
    public static final Integer TRAVEL_NOMAL_TYPE = 0; //普通评论
    public static final Integer TRAVEL_COMMENT_TYPE = 1; //回复评论

    @Id
    private String id;

    private Long travelId;

    private String travelTitle;

    private Long userId;

    private String username;

    private Integer level;

    private String city;

    private String headUrl;

    private Integer type = TRAVEL_NOMAL_TYPE;

    private Date createTime;

    private String content;

    private TravelComment refComment;
}
