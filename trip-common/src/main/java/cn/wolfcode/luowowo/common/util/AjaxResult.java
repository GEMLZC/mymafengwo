package cn.wolfcode.luowowo.common.util;

import lombok.Getter;
import lombok.Setter;

import java.io.Serializable;

@Getter@Setter
public class AjaxResult implements Serializable {
    public static final int NO_LOGIN_CODE = 102;//没有登录的状态码

    private int code;
    private boolean success = true;
    private String msg;
    private Object data;

    public AjaxResult mark(String msg) {
        this.msg = msg;
        success = false;
        return this;
    }

    public AjaxResult addData(Object data) {
        this.data = data;
        return this;
    }
}
