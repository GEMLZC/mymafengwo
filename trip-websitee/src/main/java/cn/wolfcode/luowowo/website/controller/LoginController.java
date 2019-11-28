package cn.wolfcode.luowowo.website.controller;

import cn.wolfcode.luowowo.cache.service.IUserInfoCacheService;
import cn.wolfcode.luowowo.common.util.AjaxResult;
import cn.wolfcode.luowowo.common.util.Consts;
import cn.wolfcode.luowowo.member.domain.Register;
import cn.wolfcode.luowowo.member.service.IUserInfoService;
import com.alibaba.fastjson.JSON;
import org.apache.dubbo.config.annotation.Reference;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.UUID;

@Controller
public class LoginController {
    @Reference
    private IUserInfoService userInfoService;
    @Reference
    private IUserInfoCacheService userInfoCacheService;

    @RequestMapping("checkPhone")
    @ResponseBody
    public Object checkPhone(String phone){
        return userInfoService.checkPhone(phone);
    }

    @RequestMapping("userRegist")
    @ResponseBody
    public Object userRegist(Register register){
        return userInfoService.userRegist(register);
    }


    @RequestMapping("sendVerifyCode")
    @ResponseBody
    public Object sendVerifyCode(String phone){

        return userInfoService.sendVerifyCode(phone);
    }

    @RequestMapping("userLogin")
    @ResponseBody
    public Object userLogin(String phone, String password, HttpSession session, HttpServletResponse response){
        AjaxResult result = userInfoService.userLogin(phone,password);
        if (result.isSuccess()){//当成功查询出userInfo
            //把userInfo储存到session中和redis中
            session.setAttribute(Consts.USER_INFO,result.getData());
            //使用UUID作为redis key的一部分,生成tonken
            String token = UUID.randomUUID().toString().replaceAll("-", "");
            //调用远程服务,保存到redis
            userInfoCacheService.setUserInfo(token, JSON.toJSONString(result.getData()));
            //响应cookie给前端
            Cookie cookie = new Cookie(Consts.USER_INFO_TOKEN,token);
            response.addCookie(cookie);
        }
        return result;
    }
}
