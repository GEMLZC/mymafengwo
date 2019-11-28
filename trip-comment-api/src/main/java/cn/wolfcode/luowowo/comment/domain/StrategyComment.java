package cn.wolfcode.luowowo.comment.domain;

import lombok.Getter;
import lombok.Setter;
import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Setter@Getter
@Document("strategy_comment")
public class StrategyComment implements Serializable {
    @Id
    private String id;

    private Long detailId;

    private String detailTitle;

    private Long userId;

    private String username;

    private Integer level;

    private String headUrl;

    private Date createTime;

    private String content;

    private Integer thumbupnum = 0;

    private List<Long> thumbuplist = new ArrayList<>();
}
