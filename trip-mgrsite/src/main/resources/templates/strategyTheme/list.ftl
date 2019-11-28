<html lang="en">
<head>
    <title>攻略主题管理</title>
    <#include "../common/header.ftl">
    <script type="text/javascript">
        $(function () {
            //编辑/添加
            $(".inputBtn").click(function () {
                $("#treeview").html("");
                //数据复原
                $("#editForm").clearForm(true);
                //攻略主题回显数据
                var data = $(this).data("json");
                if(data){
                    $("#editForm input[name='id']").val(data.id);
                    $("#editForm input[name='name']").val(data.name);
                    $("#editForm input[name='sequence']").val(data.sequence);
                    $("#editForm select[name='state']").val(data.state);
                }
                //弹出模态框
                $("#editModal").modal("show");
            });
            
            $(".submitBtn").click(function () {
                //模态框表单提交
                $("#editForm").ajaxSubmit(function (data) {
                    if(data.success){
                        window.location.reload();
                    }else{
                        $.messager.alert("温馨提示", data.msg)
                    }
                });
            });

            //查询
            $(".clickBtn").click(function () {
                var parentId = $(this).data("parentid");
                $("#parentId").val(parentId);
                $("#currentPage").val(1);
                $("#searchForm").submit();
            });

            //修改热门
            $(".hotBtn").click(function () {
                var hot = $(this).data("hot");
                var id = $(this).data("id");
                $.get("/strategyTheme/changeHotValue", {hot:hot, id:id}, function (data) {
                    if(data.success){
                        window.location.reload();
                    }else{
                        $.messager.alert("温馨提示", data.msg);
                    }
                });
            });
        });
    </script>
</head>
<body>
<!--左侧菜单回显变量设置-->
<#assign currentMenu="strategyTheme">

<div class="container-fluid " style="margin-top: 20px">
    <#include "../common/top.ftl">
    <div class="row">
        <div class="col-sm-2">
            <#include "../common/menu.ftl">
        </div>
        <div class="col-sm-10">
            <div class="row">
                <div class="col-sm-12">
                    <h1 class="page-head-line">攻略主题管理</h1>
                </div>
            </div>
            <#setting number_format="#">
            <!--高级查询--->
            <form class="form-inline" id="searchForm" action="/strategyTheme/list" method="post">
                <input type="hidden" name="currentPage" id="currentPage" value="1">
                <a href="JavaScript:;" class="btn btn-success inputBtn"><span class="glyphicon glyphicon-plus"></span>  添加</a>
            </form>

            <table class="table table-striped table-hover" >
                <thead>
                    <tr>
                        <th>序号</th>
                        <th>名称</th>
                        <th>状态</th>
                        <th>操作</th>
                    </tr>
                </thead>
               <#list pageInfo.list as entity>
                   <tr>
                       <td>${entity_index+1}</td>
                       <td>${entity.name!}</td>
                       <td>${entity.stateName!}</td>
                       <td>
                           <a class="btn btn-info btn-xs inputBtn" href="javascript:;" data-json='${entity.json}'>
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
                <h4 class="modal-title">攻略主题添加/编辑</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" action="/strategyTheme/saveOrUpdate" method="post" id="editForm">
                    <input type="hidden" value="" name="id">
                    <div class="form-group">
                        <label  class="col-sm-3 control-label">名称：</label>
                        <div class="col-sm-6">
                            <input type="text" class="form-control" id="name" name="name"  placeholder="请输入攻略主题名称">
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