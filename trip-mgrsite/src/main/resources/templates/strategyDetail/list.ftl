<html lang="en">
<head>
    <title>攻略明细管理</title>
    <#include "../common/header.ftl">
    <script type="text/javascript">
        $(function () {
            //查询
            $(".clickBtn").click(function () {
                var parentId = $(this).data("parentid");
                $("#currentPage").val(1);
                $("#searchForm").submit();
            })

            //发布： 改状态
            $(".changeStateBtn").click(function () {
                var json = $(this).data("json");

                $.get("/strategyDetail/changeState", json, function (data) {
                    if (data.success) {
                        window.location.reload();
                    } else {
                        $.messager.alert("温馨提示", data.msg);
                    }
                })
            })

            //设为推荐
            $(".commend").click(function () {
                $("#editForm").clearForm(true);

                var id = $(this).data("id");
                $("#editForm input[name='detailId']").val(id);
                $("#editModal").modal("show");
            })
            
            $(".submitBtn").click(function () {
                $("#editForm").ajaxSubmit(function (data) {
                    if (data.success) {
                        window.location.href = "/strategyCommend/list";
                    } else {
                        $.messager.alert("温馨提示", data.msg);
                    }
                });
            });
        })
    </script>
</head>
<body>
<!--左侧菜单回显变量设置-->
<#assign currentMenu="strategyDetail">

<div class="container-fluid " style="margin-top: 20px">
    <#include "../common/top.ftl">
    <div class="row">
        <div class="col-sm-2">
            <#include "../common/menu.ftl">
        </div>
        <div class="col-sm-10">
            <div class="row">
                <div class="col-sm-12">
                    <h1 class="page-head-line">攻略明细管理</h1>
                </div>
            </div>
            <#setting number_format="#">
            <!--高级查询--->
            <form class="form-inline" id="searchForm" action="/strategyDetail/list" method="post">
                <input type="hidden" name="currentPage" id="currentPage" value="1">
                <a href="/strategyDetail/input" class="btn btn-success"><span class="glyphicon glyphicon-plus"></span>
                    添加</a>
            </form>

            <table class="table table-striped table-hover">
                <thead>
                <tr>
                    <th>序号</th>
                    <th>封面</th>
                    <th>名称</th>
                    <th>分类</th>
                    <th>主题</th>
                    <th>状态</th>
                    <th>操作</th>
                </tr>
                </thead>
               <#list pageInfo.list as entity>
                   <tr>
                       <td>${entity_index+1}</td>
                       <td><img src="${entity.coverUrl!}" width="100px"></td>
                       <td>${entity.subTitle!}</td>
                       <td>${(entity.catalog.name)!}</td>
                       <td>${(entity.theme.name)!}</td>
                       <td>${entity.stateName!}</td>
                       <td>
                           <#if entity.state == 0>
                           <a class="btn btn-danger btn-xs commend" href="javascript:;"
                               data-id='${entity.id}'>
                                <span class="glyphicon glyphicon-minus-sign"></span> 设为推荐
                           </a>

                           <a class="btn btn-info btn-xs inputBtn" href="/strategyDetail/input?id=${entity.id}">
                               <span class="glyphicon glyphicon-edit"></span> 下架
                           </a>
                           <#else>
                           <a class="btn btn-default btn-xs changeStateBtn" href="JavaScript:;"
                               data-json='{"id":${entity.id},"state":0}'>
                                <span class="glyphicon glyphicon-tag"></span> 发布
                           </a>
                           </#if>

                            <a class="btn btn-info btn-xs inputBtn" href="/strategyDetail/input?id=${entity.id}">
                               <span class="glyphicon glyphicon-edit"></span> 编辑
                            </a>
                       </td>
                   </tr>
               </#list>
            </table>
            <#--分页-->
            <#include "../common/page.ftl"/>
        </div>
    </div>
</div>
<div class="modal fade" id="editModal">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span> </button>
                <h4 class="modal-title">设为推荐</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" action="/strategyCommend/save" enctype="multipart/form-data"
                      method="post" id="editForm">
                    <input type="hidden" name="detailId" value=""/>
                    <div class="form-group">
                        <label  class="col-sm-3 control-label">包装标题：</label>
                        <div class="col-sm-6">
                            <input type="text" class="form-control" name="title"  placeholder="请输入包装标题">
                        </div>
                    </div>
                    <div class="form-group">
                        <label  class="col-sm-3 control-label">包装副标题：</label>
                        <div class="col-sm-6">
                            <input type="text" class="form-control" name="subTitle"  placeholder="请输入包装副标题">
                        </div>
                    </div>
                    <div class="form-group">
                        <label  class="col-sm-3 control-label">包装封面：</label>
                        <div class="col-sm-6">
                            <input type="file" class="form-control" name="pic">
                        </div>
                    </div>
                    <div class="form-group">
                        <label  class="col-sm-3 control-label">序号：</label>
                        <div class="col-sm-6">
                            <input type="number" class="form-control" name="sequence">
                        </div>
                    </div>
                    <div class="form-group">
                        <label  class="col-sm-3 control-label">状态：</label>
                        <div class="col-sm-6">
                            <select class="form-control" id="state" name="state">
                                <option value="0">启用</option>
                                <option value="1">禁用</option>
                            </select>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary submitBtn" >保存</button>
                <button type="button" class="btn btn-default" data-dismiss="modal" >取消</button>
            </div>
        </div>
    </div>
</div>
</body>
</html>