<html>
<head>
    <link href="/styles/base.css" rel="stylesheet" type="text/css">
    <link href="/styles/homepage.css" rel="stylesheet" type="text/css">
    <script type="text/javascript" src="/js/jquery.js"></script>
    <script type="text/javascript" src="/js/common.js"></script>
    <script type="text/javascript" src="/js/homepage.js"></script>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>设置新密码 - 骆窝窝</title>
    <meta property="mfw:partner-platform" content="">
    <link href="https://css.mafengwo.net/css/cv/css+login+login_v2:mobile+css+omc+login-omc+login-omc^ZlY^1574732649.css"
          rel="stylesheet" type="text/css"/>
    <script language="javascript" src="https://js.mafengwo.net/js/cv/js+global+json2:js+m.statistics^YFQ^1574417533.js"
            type="text/javascript" crossorigin="anonymous"></script>
</head>
<body>

<div class="wrapper form-wrapper">
    <div class="container">
        <a href="http://www.mafengwo.cn" title="返回首页" class="logo">骆窝窝</a>
        <div class="form-box">
            <div class="form-info">
                <div class="form-title">设置新密码</div>
                <div class="form-description">
                    <div class="alert alert-info">短信验证码已下发，请注意查收 <a class="resend-yzm" data-mobile=""
                                                                    id="_js_resendYzm">重新发送验证码</a></div>
                </div>
                <form action="/reset/mobile/" method="post" id="_j_reset_password_form">
                    <div class="form-list" id="_js_resetForm">
                        <div class="form-item form-item-first">
                            <input name="password" type="password" placeholder="请输入密码" autocomplete="off"/>
                            <div class="form-tips" defaultTips="请输入8-20位字母 (区别大小写)、数字或符号">请输入8-20位字母 (区别大小写)、数字或符号</div>
                            <div class="grade">
                                <span class="b1"></span>
                                <span class="b2"></span>
                                <span class="b3"></span>
                            </div>
                        </div>
                        <div class="form-item">
                            <input name="rpassword" type="password" placeholder="请再次输入密码" autocomplete="off"/>
                            <div class="form-tips">密码不一致，请核实后重新输入</div>
                        </div>
                        <div class="form-item">
                            <input name="smscode" type="text" placeholder="请输入短信验证码" autocomplete="off"/>
                            <div class="form-tips" defaultTips="未输入短信验证码">未输入短信验证码</div>
                        </div>
                        <div class="form-submit">
                            <a id="_js_submit">完成</a>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<script language="javascript"
        src="https://js.mafengwo.net/js/cv/js+jquery-1.8.1.min:js+plugins+jquery.placeholder:passport+js+app^ZVA^1537192880.js"
        type="text/javascript" crossorigin="anonymous"></script>
<script type="text/javascript">
    window.isPC = true;
</script>
<script language="javascript" src="https://js.mafengwo.net/passport/js/resetPassword.js?1574714132"
        type="text/javascript" crossorigin="anonymous"></script>

<script type="text/javascript">
    $(function () {
        var resendYzm = $('#_js_resendYzm');
        resendYzm.length && resendYzm.on('click', function () {
            $.post(
                    '/send/code',
                    {mobile: resendYzm.data('mobile')},
                    function (res) {
                        if (res.status) {
                            alert('短信验证码已下发，请注意查收');
                        } else {
                            alert(res.msg || '发送失败');
                        }
                    },
                    'json'
            );
        });
    });
</script>

</body>
</html>
