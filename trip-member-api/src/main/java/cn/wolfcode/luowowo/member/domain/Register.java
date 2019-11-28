package cn.wolfcode.luowowo.member.domain;

import lombok.Getter;
import lombok.Setter;

/**
 * 注册字段
 */
@Setter
@Getter
public class Register extends UserInfo{
    private String verifyCode;//验证码
    private String rpassword;//确认密码
}