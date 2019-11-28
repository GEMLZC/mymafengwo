package cn.wolfcode.luowowo.website.resolver;

import cn.wolfcode.luowowo.cache.service.IUserInfoCacheService;
import cn.wolfcode.luowowo.common.util.Consts;
import cn.wolfcode.luowowo.member.domain.UserInfo;
import cn.wolfcode.luowowo.website.annotation.LoginUser;
import com.alibaba.fastjson.JSON;
import org.apache.dubbo.config.annotation.Reference;
import org.springframework.core.MethodParameter;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.support.WebDataBinderFactory;
import org.springframework.web.context.request.NativeWebRequest;
import org.springframework.web.method.support.HandlerMethodArgumentResolver;
import org.springframework.web.method.support.ModelAndViewContainer;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 * 自定义参数解析器，给参数赋值一个userinfo对象
 */
@Component
public class UserInfoArgumentResolver implements HandlerMethodArgumentResolver {
    @Reference
    private IUserInfoCacheService userInfoCacheService;

    /**
     * 当该方法返回true时才会执行，resolveArgument给形参赋值
     *
     * @param methodParameter
     * @return
     */
    @Override
    public boolean supportsParameter(MethodParameter methodParameter) {
        //判断参数上有无LoginUser注解和该参数是否是UserInfo对象
        return methodParameter.hasParameterAnnotation(LoginUser.class)
                && methodParameter.getParameterType().equals(UserInfo.class);
    }

    /**
     * 参数解析器给形参赋值的方法，返回什么就会赋值给形参什么数据
     *
     * @param methodParameter
     * @param modelAndViewContainer
     * @param nativeWebRequest
     * @param webDataBinderFactory
     * @return
     * @throws Exception
     */
    @Override
    public Object resolveArgument(MethodParameter methodParameter
            , ModelAndViewContainer modelAndViewContainer
            , NativeWebRequest nativeWebRequest
            , WebDataBinderFactory webDataBinderFactory) throws Exception {
        //拿到HttpServletRequest对象
        HttpServletRequest request = nativeWebRequest.getNativeRequest(HttpServletRequest.class);
        //获取session，拿到用户信息
        HttpSession session = request.getSession();
        Object userInfo = session.getAttribute(Consts.USER_INFO);
        if (userInfo != null) {
            return userInfo;
        }
        //如果没有从session拿到用户信息，那么就去redis拿
        //从request中拿到，登录时响应给前端的cookie
        Cookie[] cookies = request.getCookies();
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                //如果是用户的token，才去查询
                if (cookie.getName().equals(Consts.USER_INFO_TOKEN)) {
                    //通过远程的缓存服务获取用户信息
                    String json = userInfoCacheService.getUserInfo(cookie.getValue());
                    if (json != null) {
                        UserInfo info = JSON.parseObject(json, UserInfo.class);
                        session.setAttribute(Consts.USER_INFO, info);
                        return info;
                    }
                    break;
                }
            }
        }
        return null;
    }
}
