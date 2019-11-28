package cn.wolfcode.luowowo.cache.vo;

import lombok.Getter;
import lombok.Setter;

import java.io.Serializable;

/**
 * redis热数据对象
 */
@Setter@Getter
public class StrategyStats implements Serializable {

    private Long destId;
    private String destName;
    private String title;

    private Long strategyId;

    private Integer viewnum = 0;
    private Integer replynum = 0;
    private Integer favornum = 0;
    private Integer sharenum = 0;
    private Integer thumbsupnum = 0;
}
