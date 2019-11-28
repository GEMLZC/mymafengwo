<div class="lww_header">
    <div class="header_wrap">
        <div class="header_logo">
            <a href="javascript:;" class="lww_logo"></a>
        </div>

        <ul class="header_nav">
            <li name="index"><a href="/">首页</a></li>
            <li name="destination"><a href="/destination">目的地</a></li>
            <li name="strategy"><a href="/strategy">旅游攻略</a></li>
            <li name="travel"><a href="/travel">旅游日记</a></li>

            <li name=""><a href="javascript:;">去旅行<i class="icon_caret_down"></i></a></li>
            <li name="flight"><a href="/flight">机票<i class="icon_caret_down"></i></a></li>
            <li name="hotel"><a href="/hotel">订酒店<i class="icon_caret_down"></i></a></li>
            <li style="width: 90px;z-index,999;" name="" id="communityAnswer"><a href="/community/wenDaList">社区<i
                    class="icon_caret_down"></i></a>

            </li>

        </ul>

        <#if userInfo??>
            <div class="login_info">
                <div class="head_user">
                    <a href="/mine/home">
                        <img src="${(userInfo.headImgUrl)!'/images/default.jpg'}"/>
                        <i class="icon_caret_down"></i>
                    </a>
                </div>
                <div class="header_msg">
                    消息<i class="ic on_caret_down"></i>
                </div>
                <div class="header_daka">
                    <a href="javascript:;">打卡</a>
                </div>
            </div>
        <#else>
            <div class="login-out">
                <a class="weibo-login" href="/login-sian-weibo" title="微博登录" rel="nofollow"></a>

            <#--<span id="qqLoginBtn"><a class="qq-login" href="#" title="QQ登录" rel="nofollow"></a></span>-->
                <a class="qq-login" href="javascript:qq_login();" title="QQ登录" rel="nofollow" id="QQ"></a>
                <a class="weixin-login" href="#" title="微信登录" rel="nofollow"></a>
                <a id="_j_showlogin" title="登录骡窝窝" href="/login.html" rel="nofollow">登录</a>
                <span class="split">|</span>
                <a href="/regist.html" title="注册帐号" rel="nofollow">注册</a>
            </div>
        </#if>

        <br>
    </div>
    <div class="shadow"></div>

</div>

<script>
    $("li[name=${currentNav}]").addClass("header_nav_active");
</script>

<script>
    $(function () {
        $("#communityAnswer").click(
                function () {
                    $("#_j_community_panel").slideToggle();
                });
    })
</script>