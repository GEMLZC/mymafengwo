package cn.wolfcode.luowowo;

import cn.wolfcode.luowowo.website.interceptor.CheckLoginInterceptor;
import cn.wolfcode.luowowo.website.resolver.UserInfoArgumentResolver;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.web.method.support.HandlerMethodArgumentResolver;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import java.util.List;

@SpringBootApplication
public class Website implements WebMvcConfigurer{
    @Autowired
    private CheckLoginInterceptor checkLoginInterceptor;
    @Autowired
    private UserInfoArgumentResolver userInfoArgumentResolver;

    public static void main(String[] args) {
        SpringApplication.run(Website.class, args);
    }

    /**
     * 添加自定义拦截器
     * @param registry
     */
    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        registry.addInterceptor(checkLoginInterceptor).addPathPatterns("/**")
        .excludePathPatterns("/login.html","/regist.html");

    }

    /**
     * 添加自定义参数解析器
     * @param resolvers
     */
    @Override
    public void addArgumentResolvers(List<HandlerMethodArgumentResolver> resolvers) {
        resolvers.add(userInfoArgumentResolver);
    }


}
