package cn.wolfcode.luowowo.article.domain;

import cn.wolfcode.luowowo.comment.domain.StrategyComment;
import cn.wolfcode.luowowo.comment.domain.TravelComment;
import cn.wolfcode.luowowo.common.domain.BaseDomain;
import cn.wolfcode.luowowo.member.domain.User;
import lombok.Getter;
import lombok.Setter;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Setter@Getter
public class StrategyDetail extends BaseDomain {
    public static final Integer STATE_DISPLAY = 0; //发布
    public static final Integer STATE_UNDISPLAY = 1; //下架

    private String title;

    private String subTitle;

    private String summary;

    private User author;//该攻略的作者

    private String coverUrl;

    private Date createTime;

    private Integer viewnum = 0;

    private Integer replynum = 0;

    private Integer favornum = 0;

    private Integer sharenum = 0;

    private Integer thumbsupnum = 0;

    private Integer state = STATE_DISPLAY;

    private Destination dest;

    private StrategyTheme theme;

    private StrategyCatalog catalog;

    private StrategyContent strategyContent;

    private StrategyComment lastComment;//最后回复的评论

    public String getStateName() {
        return state == STATE_DISPLAY ? "发布" : "下架";
    }
}