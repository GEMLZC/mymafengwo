package cn.wolfcode.luowowo.member.service;

import cn.wolfcode.luowowo.common.util.AjaxResult;
import cn.wolfcode.luowowo.member.domain.Register;
import cn.wolfcode.luowowo.member.domain.UserInfo;

import java.util.List;

public interface IUserInfoService {
    /**
     * 校验手机是否注册过
     * @param phone
     * @return userinfo
     */
    Object checkPhone(String phone);

    /**
     * 注册用户
     * @param register
     * @return AjaxResult
     */
    Object userRegist(Register register);

    /**
     * 发送验证码
     * @param phone
     * @return AjaxResult
     */
    Object sendVerifyCode(String phone);

    /**
     * 登录
     * @param phone
     * @param password
     * @return AjaxResult
     */
    AjaxResult userLogin(String phone, String password);

    /**
     * 查询全部
     * @return
     */
    List<UserInfo> query();

    /**
     * 通过id查询
     * @param userId
     * @return
     */
    UserInfo queryById(Long userId);
    /**
     * 判断验证码是否正确
     * @param phone
     * @param
     * @return
     */
    Object submitCode(String phone, String cod);
}
