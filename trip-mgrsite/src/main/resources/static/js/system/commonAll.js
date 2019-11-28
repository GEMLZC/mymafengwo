//公共组件
//数组传值时，不添加[]
$.ajaxSettings.traditional = true;

$(function () {
    //统一全局配置
    $.messager.model = {
        ok: {text: "确定"},
        cancel: {text: "取消"}
    };
});
