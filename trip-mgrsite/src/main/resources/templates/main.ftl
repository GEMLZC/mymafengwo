<html lang="en">
<head>
    <title>部门管理</title>
    <#include "./common/header.ftl">
    <script type="text/javascript">
        //编辑
        $(function () {
           
        })

       
    </script>
</head>
<body>
<!--左侧菜单回显变量设置-->
<#assign currentMenu="department">

<div class="container-fluid " style="margin-top: 20px">
    <#include "./common/top.ftl">
    <div class="row">
        <div class="col-sm-2">
            <#include "./common/menu.ftl">
        </div>
        <div class="col-sm-10">
            <div class="row">
                <div class="col-sm-12">
                    <h1 class="page-head-line">主页</h1>
                </div>
            </div>

            <div>
                welcome
            </div>

        </div>
    </div>
</div>

</body>
</html>