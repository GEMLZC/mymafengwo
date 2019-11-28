package cn.wolfcode.luowowo.website.advice;

import cn.wolfcode.luowowo.common.util.AjaxResult;
import com.alibaba.fastjson.JSON;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

import javax.servlet.http.HttpServletResponse;

@ControllerAdvice
public class CommonExceptionAdvice {

    @ExceptionHandler(Exception.class)
    public void handleException(Exception e, HttpServletResponse resp) throws Exception {
        resp.setContentType("text/json;charset=UTF-8");
        resp.getWriter().println(JSON.toJSONString(new AjaxResult().mark("系统正在升级,请稍后再试")));
        e.printStackTrace();
    }
}
