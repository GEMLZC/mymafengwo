package cn.wolfcode.luowowo.cache.vo;

import lombok.*;

import java.io.Serializable;
import java.util.Date;

@Setter@Getter
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class UserStats implements Serializable {
    public static  final int USE_STATS = 0;
    public static  final int USE_STATS_VISIT = 1;
    public static  final int USE_STATS_DAY_VISIT = 2;
    public static final int USER_VISITOR=3;

    private Long userId;
    private String nickName;
    private String headImgUrl;
    private Integer level;
    private Date creationtime;

    private Integer viewnum = 0;//被访问总量
    private Integer todaynum = 0;//每天被访问量


}
