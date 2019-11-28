package cn.wolfcode.luowowo.website.interceptor;

import cn.wolfcode.luowowo.cache.service.IUserInfoCacheService;
import cn.wolfcode.luowowo.common.util.AjaxResult;
import cn.wolfcode.luowowo.common.util.Consts;
import cn.wolfcode.luowowo.member.domain.UserInfo;
import cn.wolfcode.luowowo.website.annotation.RequiredLogin;
import com.alibaba.fastjson.JSON;
import org.apache.dubbo.config.annotation.Reference;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@Component
public class CheckLoginInterceptor extends HandlerInterceptorAdapter {
    @Reference
    private IUserInfoCacheService userInfoCacheService;

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        //判断是否是动态资源
        if (handler instanceof HandlerMethod){
            //获取session，判断是否有用户信息
            HttpSession session = request.getSession();
            Object userInfo = session.getAttribute(Consts.USER_INFO);
            if (userInfo == null){//为空，根据token去查询redis的用户信息
                //从request中拿到，登录时响应给前端的cookies
                Cookie[] cookies = request.getCookies();
                if (cookies != null) {
                    for (Cookie cookie : cookies) {
                        //如果是用户的token，才去查询
                        if (cookie.getName().equals(Consts.USER_INFO_TOKEN)) {
                            //通过远程的缓存服务获取用户信息
                            String json = userInfoCacheService.getUserInfo(cookie.getValue());
                            if (json != null) {//不为空就存入到session中
                                session.setAttribute(Consts.USER_INFO, JSON.parseObject(json, UserInfo.class));
                                return true;
                            }
                        }
                    }
                }
                //通过扫描RequiredLogin注解判断方法没有该注解时不需要登录
                if (!((HandlerMethod)handler).hasMethodAnnotation(RequiredLogin.class)){
                    return true;
                }

                //判断ajax请求没有登录时，代码执行到此处说明没有登录
                if (((HandlerMethod) handler).hasMethodAnnotation(ResponseBody.class)) {
                    AjaxResult result = new AjaxResult();
                    result.mark("请先登录");//登录错误信息
                    result.setCode(AjaxResult.NO_LOGIN_CODE);//设置转态码
                    //响应给前端
                    response.setContentType("text/json;charset=UTF-8");
                    response.getWriter().print(JSON.toJSONString(result));
                }else {//普通请求
                    response.sendRedirect("/login.html");
                }
                return false;
            }else {
                return true;
            }
        }
        return true;
    }
}
