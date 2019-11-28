﻿<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>叩丁狼客户管理系统</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link href="/css/error_css.css" rel="stylesheet" type="text/css" />
	<#include "header.ftl">
</head>
<body>
<!--左侧菜单回显变量设置-->
<#assign currentMenu="error">
<div class="container " style="margin-top: 20px">
	<#include "top.ftl">
	<div class="row">
		<div class="col-sm-2">
			<#include "menu.ftl">
		</div>
		<div class="col-sm-10">
			<div class="row">
				<div class="col-sm-12">
					<h1 class="page-head-line">错误操作</h1>
				</div>
				<div class="row col-sm-10" >
					<div id="login_center">
						<div id="login_area">
							<div id="login_box">
								<div id="login_form">
									<H2>出错啦！</H2>
									<span>执行过程中发生了异常：</span>
									<span class="error">${ex.message}</span>
									<span>请联系管理员解决！</span>
									<span>联系电话：020-85628002</span>
									<span>叩丁狼教育</span>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
</body>
</html>
