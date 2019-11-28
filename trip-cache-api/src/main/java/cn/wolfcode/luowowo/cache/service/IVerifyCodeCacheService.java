package cn.wolfcode.luowowo.cache.service;

public interface IVerifyCodeCacheService {
    /**
     * 设置验证码到redis
     * @param phone
     * @param verifyCode
     */
    void setVerifyCode(String phone,String verifyCode);

    /**
     * 从redis获取验证码
     * @param phone
     * @return
     */
    String getVerifyCode(String phone);
}
