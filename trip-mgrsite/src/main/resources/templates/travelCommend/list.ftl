<html lang="en">
<head>
    <title>游记推荐管理</title>
    <#include "../common/header.ftl">
</head>
<body>
<!--左侧菜单回显变量设置-->
<#assign currentMenu="travelCommend">

<div class="container-fluid " style="margin-top: 20px">
    <#include "../common/top.ftl">
    <div class="row">
        <div class="col-sm-2">
            <#include "../common/menu.ftl">
        </div>
        <div class="col-sm-10">
            <div class="row">
                <div class="col-sm-12">
                    <h1 class="page-head-line">游记推荐管理</h1>
                </div>
            </div>
            <#setting number_format="#">
            <!--高级查询--->
            <form class="form-inline" id="searchForm" action="/travelCommend/list" method="post">
                <input type="hidden" name="currentPage" id="currentPage" value="1">
            </form>

            <table class="table table-striped table-hover" >
                <thead>
                    <tr>
                        <th>序号</th>
                        <th>封面</th>
                        <th>标题</th>
                        <th>副标题</th>
                        <th>状态</th>
                    </tr>
                </thead>
               <#list pageInfo.list as entity>
                   <tr>
                       <td>${entity_index+1}</td>
                       <td><img src="${entity.coverUrl!}" width="100px"></td>
                       <td>${entity.title!}</td>
                       <td>${entity.subTitle!}</td>
                       <td>${entity.stateName!}</td>
                   </tr>
               </#list>
            </table>
            <#--分页-->
            <#include "../common/page.ftl"/>
        </div>
    </div>
</div>

</body>
</html>