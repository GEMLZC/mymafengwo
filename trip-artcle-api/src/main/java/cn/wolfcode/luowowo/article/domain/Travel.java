package cn.wolfcode.luowowo.article.domain;

import cn.wolfcode.luowowo.comment.domain.TravelComment;
import cn.wolfcode.luowowo.common.domain.BaseDomain;
import cn.wolfcode.luowowo.member.domain.UserInfo;
import lombok.Getter;
import lombok.Setter;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

@Setter@Getter
public class Travel extends BaseDomain {
    public static final Integer STATE_NORMAL = 0; //草稿
    public static final Integer STATE_WAITING = 1; //待发布
    public static final Integer STATE_RELEASE = 2; //发布
    public static final Integer STATE_REJECT = 3; //拒绝

    private Destination dest;

    private UserInfo author;

    private String title;

    private String coverUrl;

    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date travelTime;

    private Integer perExpends;

    private Integer days;

    private Integer person = 1;

    private Date releaseTime;

    private Date createTime;

    private Date lastUpdateTime;

    private Integer overt = 0;

    private Integer viewnum = 0;

    private Integer replynum = 0;

    private Integer sharenum = 0;

    private Integer thumbsupnum = 0;

    private Integer favornum = 0;

    private Integer state = STATE_WAITING;

    private String summary;

    private TravelContent travelContent;

    private TravelComment lastComment;//最后回复的评论


    public String getStateName() {
        String msg = "草稿";
        if (state == STATE_WAITING) {
            msg = "待发布";
        } else if (state == STATE_RELEASE) {
            msg = "发布";
        } else if (state == STATE_REJECT) {
            msg = "拒绝";
        }
        return msg;
    }

    public String getPersonName() {
        String msg = "一个人";
        if (person == 2) {
            msg = "情侣/夫妻";
        } else if (person == 3) {
            msg = "亲子出游";
        } else if (person == 4) {
            msg = "家庭出游";
        } else if (person == 5) {
            msg = "和朋友";
        } else if (person == 6) {
            msg = "和同学";
        } else if (person == 7) {
            msg = "保密";
        }
        return msg;
    }
}