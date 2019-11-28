<html lang="en">
<head>
    <title>攻略编辑</title>
<#include "../common/header.ftl"/>
    <link rel="stylesheet" type="text/css" href="/js/plugins/bootstrap-select/bootstrap-select.css"/>
    <script src="/js/plugins/bootstrap-select/bootstrap-select.js"></script>

    <link type="text/css" rel="stylesheet" href="/js/plugins/uploadifive/uploadifive.css" />
    <script type="text/javascript" src="/js/plugins/uploadifive/jquery.uploadifive.min.js"></script>

    <link type="text/css" rel="stylesheet" href="/js/plugins/bootstrap-tagsinput/bootstrap-tagsinput.css" />
    <script type="text/javascript" src="/js/plugins/bootstrap-tagsinput/bootstrap-tagsinput.js"></script>
    <script src="/js/ckeditor/ckeditor.js"></script>
    <script>
        //表单提交验证
        $(function () {
            //富文本框图片配置
            var ck = CKEDITOR.replace( 'content',{
                filebrowserBrowseUrl: '/图片服务器，假装这里有',
                filebrowserUploadUrl: '/uploadImg_ck'
            });

            //图片上传
            $('.imgBtn').uploadifive({
                'auto' : true,
                'uploadScript' : '/uploadImg',
                buttonClass:"btn-link",
                'fileObjName' : 'pic',
                'buttonText' : '浏览...',
                'fileType' : 'image',
                'multi' : false,
                'fileSizeLimit'   : 5242880,
                'removeCompleted' : true,
                'uploadLimit' : 1,
                'overrideEvents': ['onDialogClose', 'onError'],    //onDialogClose 取消自带的错误提示
                'onUploadComplete' : function(file, data) {
                    $("#imgUrl").attr("src" , "/" + data);
                    $("#coverUrl").val("/" + data);
                },
                onFallback : function() {
                    $.messager.alert("温馨提示","该浏览器无法使用!");
                }
            });

            //保存
            $("#btn_submit").click(function () {
                //异步提交时， 富文本框可能出问题
                $("#content").val(ck.getData());

                $("#editForm").ajaxSubmit(function (data) {
                    console.log(data);
                    if(data.success){
                        window.location.href = "/strategyDetail/list";
                    }else{
                        $.messager.alert("温馨提示", data.msg);
                    }
                });
            });
        });
    </script>
</head>
<body>
<!--设置菜单回显-->
<#assign currentMenu = 'strategyDetail'>
<div class="container-fluid " style="margin-top: 20px">
<#include "../common/top.ftl"/>
    <div class="row">
        <div class="col-sm-2">
        <#include "../common/menu.ftl"/>
        </div>
        <div class="col-sm-10">
            <div class="row">
                <div class="col-sm-12">
                    <h1 class="page-head-line">攻略编辑</h1>
                </div>
            </div>
            <div class="row col-sm-10">
                <form class="form-horizontal" action="/strategyDetail/saveOrUpdate" method="post" id="editForm">
                    <input type="hidden" value="${(entity.id)!}" name="id">
                    <div class="form-group">
                        <label class="col-sm-2 control-label">标题：</label>
                        <div class="col-sm-8">
                            <input type="text" class="form-control" id="title" name="title" value="${(entity.title)!}" placeholder="请输入攻略标题">
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-2 control-label">副标题：</label>
                        <div class="col-sm-8">
                            <input type="text" class="form-control" id="subTitle" name="subTitle"  value="${(entity.subTitle)!}" placeholder="请输入攻略副标题">
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-2 control-label">封面：</label>
                        <div class="col-sm-8">
                            <input type="hidden" class="form-control" id="coverUrl"  name="coverUrl" value="${(entity.coverUrl)!}" >
                            <img src="${(entity.coverUrl)!'/images/default.png'}" width="100px" id="imgUrl">
                            <button type="button" class="imgBtn">浏览</button>
                        </div>

                    </div>

                    <div class="form-group">
                        <label class="col-sm-2 control-label">分类：</label>
                        <div class="col-sm-8">
                            <select class="form-control" id="catalog" name="catalog.id">
                                <#list catalogs as c>
                                    <option value="${c.id}">${c.name}</option>
                                </#list>
                            </select>
                        </div>
                        <script>
                            $("#catalog").val(${(entity.catalog.id)!});
                        </script>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-2 control-label">主题：</label>
                        <div class="col-sm-8">
                            <select class="form-control" id="theme" name="theme.id">
                                <#list themes as t>
                                    <option value="${t.id}">${t.name}</option>
                                </#list>
                            </select>

                            <script>
                                $("#theme").val(${(entity.theme.id)!});
                            </script>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-2 control-label">状态：</label>
                        <div class="col-sm-8">
                            <select class="form-control" id="state" name="state">
                                <option value="0">发布</option>
                                <option value="1">下架</option>
                            </select>
                        </div>

                        <script>
                            $("#state").val(${(entity.state)!});
                        </script>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-2 control-label">标签：</label>
                        <div class="col-sm-8">
                            <input name="tags" id="tagsinputval" class="form-control tagsinput" value="${tags!}"
                                   data-role="tagsinput" placeholder="输完后按回车" />
                        </div>
                    </div>

                    <div class="form-group">
                        <textarea id="content" name="strategyContent.content" class="ckeditor">${(entity.strategyContent.content)!}</textarea>
                    </div>

                    <div class="form-group">
                        <div class="col-sm-offset-1 col-sm-8">
                            <button id="btn_submit" class="btn btn-primary" type="button">保存</button>
                            <button type="reset" class="btn btn-danger">重置</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
</body>
</html>