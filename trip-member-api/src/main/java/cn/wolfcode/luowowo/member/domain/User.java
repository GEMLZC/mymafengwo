package cn.wolfcode.luowowo.member.domain;

import cn.wolfcode.luowowo.common.domain.BaseDomain;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;
import java.util.List;

@Setter
@Getter
@ToString
public class User extends BaseDomain {

    //性别常量
    public static final Integer GENDER_NONE = 0; //保密
    public static final Integer GENDER_MALE = 1; //男
    public static final Integer GENDER_FEMALE = 2; //女

    public static final boolean VIP_TRUE =  true; //是
    public static final boolean VIP_FALSE = false; //否
    private String nickname; //昵称

    private String phone; //手机

    private String email; //邮箱

    private String password; //密码

    private Integer level; //等级

    private Integer gender = GENDER_NONE; //性别,默认保密

    private String city; //城市

    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date birthday; //生日

    private String headImgUrl; //头像

    private String info; //签名

    private boolean vip = VIP_FALSE; //vip

    private Integer follownum; //关注数

    private Integer fansnum;//粉丝数


    private Long honey; //蜂蜜
    private Integer viewnum; //访问量
    private Integer todaynum; //今日访问量
    private String address; //地址
}
