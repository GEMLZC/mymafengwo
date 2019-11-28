<!DOCTYPE html>
<html>
<head>
    <link href="/styles/base.css" rel="stylesheet" type="text/css">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <title>骡窝窝酒店预订,网上预订酒店,国内外酒店价格查询预订平台</title>
    <meta name="Keywords" content=骡窝窝酒店预订,酒店价格查询"/>
    <meta name="Description"
          content="骡窝窝酒店预订,提供国内外60万家酒店网上预订,酒店价格查询服务,包括优质酒店住宿推荐,详细酒店地址和酒店图片,真实用户酒店点评等信息,减少酒店预订查询步骤,骡窝窝酒店是你快捷旅游出行的最佳选择."/>





<#--<script type="text/javascript">
    window.Env = {
        "hotel_activity_type": 0,
        "WWW_HOST": "www.mafengwo.cn",
        "IMG_HOST": "images.mafengwo.net",
        "W_HTTP": "http:\/\/w.mafengwo.cn",
        "P_HOST": "passport.mafengwo.cn",
        "P_HTTP": "https:\/\/passport.mafengwo.cn",
        "PAGELET_HTTP": "http:\/\/pagelet.mafengwo.cn",
        "JS_HOST": "js.mafengwo.net",
        "TONGJI_HOST": "tongji.mafengwo.cn",
        "UID": 48119980,
        "CSTK": "6f36caaaf74bd361f5e45ce8e836944c_7deaf87e62bab4d3aefefab7bdd42804",
        "GOOGLE_MAP_KEY": "AIzaSyD-Su0x_rPy1xehlMBcMyTqWkU49Bk53nQ",
        "MOBILE_BINDED": true
    };
</script>-->

    <link href="http://css.mafengwo.net/css/cv/css+base:css+jquery.suggest:css+plugins:css+plugins+jquery.jgrowl:css+other+popup:css+mfw-header.2015^YlVS^1559526017.css"
          rel="stylesheet" type="text/css"/>


    <link href="http://css.mafengwo.net/css/cv/css+hotel+hotel_index:css+jquery-ui-1.11.0.min:css+hotel+datepicker-range:css+hotel+number_guests_picker^YlVX^1552035728.css"
          rel="stylesheet" type="text/css"/>


    <script language="javascript"
            src="http://js.mafengwo.net/js/cv/js+jquery-1.8.1.min:js+global+json2:js+M+Module:js+M+M:js+M+Log:js+m.statistics:js+advert+inspector:js+corelib+underscore-1.6.0:js+corelib+backbone-1.1.2^YlBQ^1562232559.js"
            type="text/javascript" crossorigin="anonymous"></script>

    <script>
        $(function () {
            $.get("/hotel/theme", {id: 1}, function (data) {
                $("#clearfixMessages").html(data);
            })
            $.get("/hotel/hotHotel", {id: 3261}, function (data) {
                $("#clearfixMessage").html(data);
            })
        })
    </script>
</head>
<body>
<#assign currentNav="hotel">
<#include "../common/navbar.ftl">

<div class="hotel-main">
    <div class="h-title">订酒店</div>
    <form class="form-hotel" action="/hotel/dingjiudian" method="get" id="editForm">
        <div class="clearfix date-warp">
            <div class="add-travle">
                <input type="text" placeholder="出行目的地" id="_j_search_input" autocomplete="off" name="destName">
                <div class="not-cont" id="_j_search_shortcut_mdds" style="display:none;">
                    <ul>
                        <li class="clearfix">

                            <h2>国内</h2>
                            <p>
                            <#list dest as d >
                                <a href="javascript:;" data-id="${d.id}" data-name="${d.name}">${d.name}</a>
                            </#list>
                            </p>
                        </li>
                        <#list hotRegions as hr>
                            <li class="clearfix"><h2>${hr.regionName}</h2>
                                <p>
                                   <#list hr.citys as c>
                                        <a href="javascript:;" data-id="${(c.id)!}" data-name="${(c.name)!}">${(c.name)!}</a>
                                    </#list>
                                </p>
                            </li>
                        </#list>
                    </ul>
                </div>
            <#--<div class="search-suggest-panel search-suggest-hotel" style="display:none;" id="_j_search_suggest"></div>-->
            </div>
            <div class="stay-time _j_booking_date_item" id="_j_check_in_date">
                <span></span>
                <input type="text" placeholder="入住日期" readonly name="checkIn">
                <i></i>
            </div>
            <div class="leave-time _j_booking_date_item" id="_j_check_out_date">
                <span></span>
                <input type="text" placeholder="离店日期" readonly name="checkOut">
                <i></i>
            </div>
            <div class="hs-item hs-item-people" id="_j_booking_number_guests">
                <span>人数</span>
                <i class="icon-person"></i>
            </div>


            <div class="btn-search" id="_A_search_btn">
                <a role="button" href="javascript:" class="btn-sss"><i class=""></i></a>
            </div>
        </div>
    </form>
    <div class="h-notice clearfix">
        <ul>
            <li>
                <i class="notice01"></i>
                <div class="flt1">
                    <h2>住宿攻略</h2>
                    <p>区域攻略到特色主题，应有尽有</p>
                </div>
            </li>
            <li>
                <i class="notice02"></i>
                <div class="flt1">
                    <h2>专享价格</h2>
                    <p>多平台价格对比，天天专享特惠</p>
                </div>
            </li>
            <li>
                <i class="notice03"></i>
                <div class="flt1">
                    <h2>真实点评</h2>
                    <p>超过100万真实用户点评和游记</p>
                </div>
            </li>
        </ul>
    </div>

    <div class="h-theme" id="_j_features">
        <div class="h-title" style="margin-top: 50px;">主题住宿</div>
        <div class="tab-theme">
            <div class="themeList clearfix _j_tab_trigger">
            <#list destinationTheme as theme>
            <#--<a href="javascript:void(0);" data-id="${theme_index}" id="type-theme${theme_index}"
               data-value="${theme.content}" onclick="c${theme_index}();">${theme.content}</a>-->
                <a href="javascript:void(0);" id="type-theme${theme_index}" data-id="${theme_index}"
                   data-value="${theme.id}"
                   onclick="t${theme_index}();">${theme.name}</a>
                <script>
                    t${theme_index} = function () {
                        var id = $("#type-theme${theme_index}").data('value');
                        if (!id) { // 防止没有获取到值
                            return;
                        }
                        $(this).addClass("on");
                        // 发送请求
                        $.get("/hotel/theme", {id: id}, function (data) {
                            $("#clearfixMessages").html(data);
                        })
                    }
                </script>
            </#list>
            </div>


            <div class="_j_tab_content" id="clearfixMessages">

            </div>
        </div>
    </div>


    <div class="h-favorablle" id="_j_sales">
        <div class="h-title">特价酒店</div>
        <div class="tab-fav">
            <div class="favList clearfix _j_tab_trigger">
            <#list hotCity as city>
                <a href="javascript:void(0);" name="c" id="lucky${city.id}" data-id="${city_index}"
                   data-value="${city.id}" onclick="test${city.id}();">${city.name}</a>
                <script>
                    test${city.id} = function () {
                        var id = $("#lucky${city.id}").data('value');
                        if (!id) { // 防止没有获取到值
                            return;
                        }
                        // 发送请求
                        $.get("/hotel/hotHotel", {id: id}, function (data) {
                            $("#clearfixMessage").html(data);
                        })
                    }
                </script>
            </#list>
            </div>
            <div class="tab-con _j_tab_content" id="clearfixMessage">
            </div>
        </div>
    </div>
</div>
</div>

    <script language="javascript" src="http://js.mafengwo.net/js/hotel/sign/index.js?1552035728"
            type="text/javascript"
            crossorigin="anonymous"></script>


    <link href="http://css.mafengwo.net/css/mfw-footer.css?1558532347" rel="stylesheet" type="text/css"/>

    <div id="footer">
        <div class="ft-content" style="width: 1105px">
            <div class="ft-info clearfix">
                <dl class="ft-info-col ft-info-intro">
                    <dt>骡窝窝旅游网</dt>
                    <dd>中国年轻一代用得更多的旅游网站</dd>
                    <dd>上亿旅行者共同打造的<strong>"旅行神器"</strong></dd>
                    <dd><strong>60,000</strong> 多个全球旅游目的地</dd>
                    <dd><strong>600,000</strong> 个细分目的地新玩法</dd>
                    <dd><strong>760,000,000</strong> 次攻略下载</dd>
                    <dd><strong>38,000</strong> 家旅游产品供应商</dd>
                </dl>
                <dl class="ft-info-col ft-info-about">
                    <dt>关于我们</dt>
                    <dd><a href="javascript:;" rel="nofollow">关于骡窝窝</a><a
                            href="javascript:;" class="m_l_10" rel="nofollow">联系我们</a></dd>
                    <dd><a href="javascript:;" rel="nofollow">隐私政策</a><a
                            href="javascript:;" rel="nofollow" class="m_l_10">商标声明</a></dd>
                    <dd><a href="javascript:;" rel="nofollow">服务协议</a><a
                            href="javascript:;" rel="nofollow" class="m_l_10">游记协议</a></dd>
                    <dd><a href="javascript:;" rel="nofollow">商城平台服务协议</a></dd>
                    <dd><a href="javascript:;" rel="nofollow">网络信息侵权通知指引</a></dd>
                    <dd style="white-space: nowrap;"><a href="javascript:;" rel="nofollow">骡窝窝旅游网服务监督员</a>
                    </dd>
                    <dd><a href="javascript:;" target="_blank">网站地图</a><a
                            class="joinus highlight m_l_10" title="骡窝窝团队招聘" target="_blank"
                            href="javascript:;" rel="nofollow">加入骡窝窝</a>
                    </dd>
                </dl>
                <dl class="ft-info-col ft-info-service">
                    <dt>旅行服务</dt>
                    <dd>
                        <ul class="clearfix">
                            <li><a target="_blank" href="javascript:;">旅游攻略</a></li>
                            <li><a target="_blank" href="javascript:;">酒店预订</a></li>
                            <li><a target="_blank" href="javascript:;">旅游特价</a></li>
                            <li><a target="_blank" href="javascript:;">国际租车</a></li>
                            <li><a target="_blank" href="javascript:;">旅游问答</a></li>
                            <li><a target="_blank" href="javascript:;">旅游保险</a></li>
                            <li><a target="_blank" href="javascript:;">旅游指南</a></li>
                            <li><a target="_blank" href="javascript:;">订火车票</a></li>
                            <li><a target="_blank" href="javascript:;">旅游资讯</a></li>
                            <li><a target="_blank" href="javascript:;">APP下载</a></li>
                            <li style="width: 120px;"><a target="_blank" href="javascript:;"
                                                         class="highlight">旅行商城全球商家入驻</a></li>
                        </ul>
                    </dd>
                </dl>
                <dl class="ft-info-col ft-info-qrcode">
                    <dd>
                        <span class="ft-qrcode-tejia"></span>
                        <p>骡窝窝良品<br>官方服务号</p>
                    </dd>
                    <dd>
                        <span class="ft-qrcode-weixin"></span>
                        <p>骡窝窝旅游<br>订阅号</p>
                    </dd>
                    <dd>
                    <span class="ft-qrcode-weixin"
                          style="background-image: url('https://p3-q.mafengwo.net/s10/M00/48/A9/wKgBZ1t_4sSAVJ6uAAAlzJ0PZgU881.png?imageMogr2%2Fthumbnail%2F%2194x90r%2Fgravity%2FCenter%2Fcrop%2F%2194x90%2Fquality%2F90')"></span>
                        <p>骡窝窝APP<br>扫描立即下载</p>
                    </dd>
                </dl>
                <dl class="ft-info-social">
                    <dt>旅游之前，先上骡窝窝！</dt>
                    <dd>
                        <a class="ft-social-weibo" target="_blank" href="javascript:;" rel="nofollow"><i
                                class="ft-social-icon"></i></a>
                        <a class="ft-social-qqt" target="_blank" href="javascript:;" rel="nofollow"><i
                                class="ft-social-icon"></i></a>
                        <a class="ft-social-qzone" target="_blank" href="javascript:;" rel="nofollow"><i
                                class="ft-social-icon"></i></a>
                    </dd>
                </dl>
            </div>

            <div class="ft-copyright">
                <a href="javascript:;"><i class="ft-mfw-logo"></i></a>
                <p>© 2019 Mafengwo.cn <a href="javascript:;" target="_blank"
                                         rel="nofollow">京ICP备11015476号</a> <a
                        href="javascript:;"
                        target="_blank"><img src="http://images.mafengwo.net/images/footer/police_record.png"
                                             width="12"
                                             style="margin:0 2px 4px 0;">京公网安备11010502013401号</a> <a
                        href="javascript:;" target="_blank"
                        rel="nofollow">京ICP证110318号</a><span class="m_l_10">违法和不良信息举报电话: 010-59222790 举报邮箱: mfwjubao@mafengwo.com</span>
                </p>
                <p>网络出版服务许可证：(总)网出证(京)字第161号<span class="m_l_10">增值电信业务经营许可证：京B2-20180228</span> <a
                        href="javascript:;" target="_blank"
                        rel="nofollow" class="m_l_10">营业执照</a><a href="/sales/uhelp/doc" target="_blank"
                                                                 rel="nofollow"
                                                                 class="m_l_10">帮助中心</a><span
                        class="m_l_10">骡窝窝客服：国内</span><span
                        class="highlight">4006-345-678</span><span class="m_l_10">海外</span> <span
                        class="highlight">+86-10-5922-2799</span>
                </p>
            </div>
            <div class="ft-safety">
                <a class="s-a" target="_blank" href="javascript:;"
                   id="___szfw_logo___"></a>
                <a class="s-b" href="javascript:;"
                   target="_blank" rel="nofollow"></a>
                <a class="s-c" href="javascript:;" target="_blank"
                   rel="nofollow"></a>
                <a class="s-d" href="javascript:;"
                   target="_blank" rel="nofollow"></a>
            </div>

        </div>
    </div>
    <style>
        #banner-con-gloable {
            display: block;
            position: fixed;
            bottom: 0;
            left: -100%;
            z-index: 110;
            width: 100%;
            height: 179px;
            overflow-x: hidden;
        }

        #banner-con-gloable .banner-btn-con {
            width: 100%;
            height: 162px;
            background: rgba(30, 15, 8, 0.95);
            position: absolute;
            bottom: 0;
        }

        #banner-con-gloable .banner-btn-con .close-btn {
            position: absolute;
            right: 35px;
            top: 24px;
            z-index: 120;
            height: 24px;
            width: 24px;
            cursor: pointer;
        }

        #banner-con-gloable .banner-image-con {
            position: absolute;
            right: 50%;
            bottom: 0;
            width: 1000px;
            margin-right: -500px;
        }

        #float-pannel-gloable {
            padding-left: 28px;
            padding-bottom: 20px;
            display: block;
            position: fixed;
            bottom: 0;
            z-index: 110;
            left: -230px;
        }

        #float-pannel-gloable .float-btn {
            width: 24 pxpx;
            height: 24px;
            position: absolute;
            right: 0;
            top: 0;
            z-index: 100;
        }

        #closed {
            height: 24px;
            width: 24px;
            vertical-algin: top;
            border: none;
            cursor: pointer;
        }
    </style>

    <div id="float-pannel-gloable">
        <img class="float-image"
             src="https://p4-q.mafengwo.net/s14/M00/BB/8C/wKgE2l0r2W-ALHaeAACAt6lqXyA464.png"
             style="width:178px;">
        <div class="float-btn">
            <img id="closed" src="https://n4-q.mafengwo.net/s13/M00/46/AC/wKgEaVy2xHeAZJhRAAADGY-wozY871.png">
        </div>
    </div>


    <script>
        $(function () {

            var flag_page = location.href.match(/^(https|http):\/\/www\.mafengwo\.cn\/?$/g) ||
                    location.href.match(/^(https|http):\/\/www\.mafengwo\.cn(\/\?\S*)/g) ||
                    location.href.match(/(cn\/gonglve|cn\/yj\/|cn\/i\/|cn\/jd\/|cn\/xc\/|cn\/schedule\/|cn\/baike\/|cn\/poi\/|mdd|travel-scenic-spot)/g)

            if (!!flag_page && getCookie('ad_hide') != '1' && getCookie('ad_close_num') < 2) {
                handleBannerShow();
            }
        });

        // 浮标关闭按钮点击
        $("#float-pannel-gloable .float-btn").click(function () {
            $("#float-pannel-gloable").animate({left: -230,}, 800, 'swing');
            add_cookie('ad_hide', '1', 1);
            if (!getCookie('ad_close_num')) {
                add_cookie('ad_close_num', 1, 9999)
            } else if (!!getCookie('ad_close_num')) {
                add_cookie('ad_close_num', getCookie('ad_close_num') * 1 + 1, 9999)
            }
        });

        function add_cookie(name, value, n) {
            var exp = new Date();
            exp.setTime(exp.getTime() + 24 * 60 * 1000 * 60 * n);
            document.cookie = name + '=' + value + ';expires=' + exp.toGMTString() + ';path=/';
        }

        function getCookie(cname) {
            var name = cname + "=";
            var ca = document.cookie.split(';');

            for (var i = 0; i < ca.length; i++) {
                var c = ca[i];
                while (c.charAt(0) == ' ') c = c.substring(1);
                if (c.indexOf(name) != -1) return c.substring(name.length, c.length);
            }

            return "";
        }

        function delCookie(name) {
            var exp = new Date();
            exp.setTime(exp.getTime() - 1);
            var cval = getCookie(name);
            if (cval != null)
                document.cookie = name + "=" + cval + ";expires=" + exp.toGMTString();
        }

        function handleBannerShow() {
            $("#float-pannel-gloable").animate({left: 0,}, 500, 'swing');
        }

    </script>


    <link href="http://css.mafengwo.net/css/mfw-toolbar.css?1537192876" rel="stylesheet" type="text/css"/>

    <div class="mfw-toolbar" id="_j_mfwtoolbar">
        <div class="toolbar-item-top">
            <a role="button" class="btn _j_gotop">
                <i class="icon_top"></i>
                <em>返回顶部</em>
            </a>
        </div>
        <div class="toolbar-item-feedback">
            <a role="button" data-japp="feedback" class="btn">
                <i class="icon_feedback"></i>
                <em>意见反馈</em>
            </a>
        </div>
        <div class="toolbar-item-code">
            <a role="button" class="mfw-code _j_code">


                <img src="https://p1-q.mafengwo.net/s1/M00/6C/51/wKgIC1t_6TuASybrAADGUPUHjr021.jpeg"
                     width="450" height="192">
            </a>
        </div>
        <div class="toolbar-item-down">
            <a role="button" class="btn _j_gobottom">
                <i class="icon_down"></i>
                <em>页面底部</em>
            </a>
        </div>
    </div>


    <script language="javascript" type="text/javascript">
        if (typeof M !== "undefined" && typeof M.loadResource === "function") {
            M.loadResource("http://js.mafengwo.net/js/cv/js+Dropdown:js+pageletcommon+pageHeadUserInfoWWWNormal:js+jquery.tmpl:js+M+module+InputListener:js+M+module+SuggestionXHR:js+M+module+DropList:js+M+module+Suggestion:js+M+module+MesSearchEvent:js+SiteSearch:js+AHeader:js+M+module+PageAdmin:js+M+module+Storage:js+M+module+Cookie:js+M+module+ResourceKeeper:js+jquery.jgrowl.min:js+AMessage:js+M+module+dialog+Layer:js+M+module+dialog+DialogBase:js+M+module+dialog+Dialog:js+M+module+dialog+alert:js+M+module+FrequencyVerifyControl:js+M+module+FrequencySystemVerify:js+ALogin:js+M+module+ScrollObserver:js+M+module+QRCode:js+AToolbar:js+ACnzzGaLog:js+ARecruit:js+ALazyLoad:js+plugins+dynamics:js+hotel+module+Log:js+hotel+module+Search_v2:js+xdate:js+hotel+module+FestivalDateConfig:js+jquery-ui-core:js+jquery-ui-datepicker:js+hotel+module+DateRangePicker:js+hotel+module+ModuleProvider:js+hotel+module+BookingDate:js+hotel+module+BookingGuests:js+hotel+module+NumberGuestsPicker:js+hotel+module+ImageLoader:js+hotel+index_v5:js+hotel+pc_app_guide^alxV^1562127144.js")
        }

        $(function () {
            $(".btn-sss").click(function () {
                $("#editForm").submit()
            })
        })
    </script>

</body>
</html>

