package cn.wolfcode.luowowo.member.service.impl;

import cn.wolfcode.luowowo.cache.service.IVerifyCodeCacheService;
import cn.wolfcode.luowowo.common.util.AjaxResult;
import cn.wolfcode.luowowo.common.util.Assert;
import cn.wolfcode.luowowo.member.domain.Register;
import cn.wolfcode.luowowo.member.domain.UserInfo;
import cn.wolfcode.luowowo.member.mapper.UserInfoMapper;
import cn.wolfcode.luowowo.member.service.IUserInfoService;
import org.apache.dubbo.config.annotation.Reference;
import org.apache.dubbo.config.annotation.Service;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;
import java.util.UUID;

@Service
public class UserInfoServiceImpl implements IUserInfoService {
    @Autowired
    private UserInfoMapper userInfoMapper;
    @Reference
    private IVerifyCodeCacheService verifyCodeCacheService;

    @Override
    public Object checkPhone(String phone) {
        return userInfoMapper.selectUseInforByPhone(phone) == null;
    }

    @Override
    public Object userRegist(Register register) {
        AjaxResult result = new AjaxResult();
        try {
            //非空校验
            Assert.hasLength(register.getNickname(),"昵称不能为空");
            Assert.hasLength(register.getPassword(),"密码不能为空");
            Assert.hasLength(register.getRpassword(),"确认密码不能为空");
            Assert.hasLength(register.getVerifyCode(),"验证码不能为空");
            //校验两次输入密码的一致性
            Assert.equalsIgnoreCase(register.getRpassword() , register.getRpassword(),"密码输入不一致");
            //校验验证码的正确性
            String verifyCode = verifyCodeCacheService.getVerifyCode(register.getPhone());
            Assert.equalsIgnoreCase(register.getVerifyCode(),verifyCode,"验证码不正确");
            //把数据保存到数据库
            UserInfo user = new UserInfo();
            user.setNickname(register.getNickname());
            user.setPhone(register.getPhone());
            user.setPassword(register.getPassword());
            user.setLevel(1);
            user.setGender(UserInfo.GENDER_NONE);
            userInfoMapper.insert(user);
        }catch (Exception e){
            e.printStackTrace();
            result.mark(e.getMessage());
        }
        return result;
    }

    @Override
    public AjaxResult sendVerifyCode(String phone) {
        AjaxResult result = new AjaxResult();
        if (verifyCodeCacheService.getVerifyCode(phone) != null){
            result.mark("验证码未过期请不要重复发送");
            return result;
        }
        //生成验证码
        String verifyCode = UUID.randomUUID().toString().substring(0, 4);
        verifyCodeCacheService.setVerifyCode(phone, verifyCode);
        System.out.println(verifyCode);
        return result;
    }

    @Override
    public AjaxResult userLogin(String phone, String password) {
        AjaxResult result = new AjaxResult();
        try {
            Assert.hasLength(phone,"手机号不能为空");
            Assert.hasLength(password,"密码不能为空");
        }catch (Exception e){
            result.mark(e.getMessage());
            return result;
        }
        UserInfo userInfo = userInfoMapper.selectUserInfoByPhoneAndPassword(phone,password);

        if (userInfo == null){
            result.mark("帐号与密码不匹配");
        }else {
            result.addData(userInfo);
        }

        return result;
    }

    @Override
    public List<UserInfo> query() {
        return userInfoMapper.selectAll();
    }

    @Override
    public UserInfo queryById(Long userId) {
        return userInfoMapper.selectByPrimaryKey(userId);
    }

    public AjaxResult submitCode(String phone, String cod) {
        AjaxResult result = new AjaxResult();
        try {
            Assert.hasLength(phone,"手机号不能为空");
            Assert.hasLength(cod,"验证码不能为空");
            String verifyCode = verifyCodeCacheService.getVerifyCode(phone);
            Assert.equalsIgnoreCase(cod,verifyCode,"验证码不正确");
        }catch (Exception e){
            result.mark(e.getMessage());
            return result;
        }
        return result;
    }
}
