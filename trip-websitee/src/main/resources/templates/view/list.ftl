<!DOCTYPE html>
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title></title>
    <link href="/styles/base.css" rel="stylesheet" type="text/css">
    <link href="/styles/reply.css" rel="stylesheet" type="text/css">
    <script type="text/javascript" src="/js/jquery/jquery.js"></script>
    <script type="text/javascript" src="/js/plugins/jquery-form/jquery.form.js"></script>
    <script type="text/javascript" src="/js/system/travelfilter.js"></script>
    <script type="text/javascript" src="/js/system/common.js"></script>
    <link href="/js/plugins/jqPaginator/jqPagination.css" rel="stylesheet" type="text/css">
    <script type="text/javascript" src="/js/plugins/jqPaginator/jq-paginator.min.js"></script>
    <script>
        $(function () {
            $.get("/view/allViews", {tagId: -1}, function (data) {
                $('#allViewsByTag').html(data);
            });
        })
    </script>
</head>

<body style="position: relative;">
<#assign currentNav="destination">
<#include "../common/navbar.ftl">

<div class="container">
    <div class="row row-placeTop" data-cs-p="面包屑">
        <div class="wrapper">
            <link href="http://css.mafengwo.net/css/cv/css+mdd+place-crumb:css+mdd+place-navbar^Z1U^1559788120.css"
                  rel="stylesheet" type="text/css">
            <script language="javascript" src="http://js.mafengwo.net/js/hotel/sign/index.js?1552035728"
                    type="text/javascript" crossorigin="anonymous"></script>
            <link href="http://css.mafengwo.net/css/mdd/place-crumb.css?1530619858" rel="stylesheet" type="text/css">

            <div class="crumb">

                <div class="item"><a href="/mdd/" target="_blank">目的地</a><em>&gt;</em></div>

                <div class="item">
                    <div class="drop">
                    <span class="hd"><a href="/travel-scenic-spot/mafengwo/14674.html"
                                        target="_blank">广东<i></i></a></span>
                        <div class="bd">
                            <i class="arrow"><b></b></i>
                            <div class="col">
                                <h3>热门地区</h3>
                                <ul class="clearfix">
                                    <li><a href="/travel-scenic-spot/mafengwo/10088.html" target="_blank">广州</a></li>
                                    <li><a href="/travel-scenic-spot/mafengwo/10198.html" target="_blank">深圳</a></li>
                                    <li><a href="/travel-scenic-spot/mafengwo/10269.html" target="_blank">珠海</a></li>
                                    <li><a href="/travel-scenic-spot/mafengwo/11475.html" target="_blank">惠州</a></li>
                                    <li><a href="/travel-scenic-spot/mafengwo/13394.html" target="_blank">佛山</a></li>
                                </ul>
                            </div>
                            <div class="more"><a href="/travel-scenic-spot/mafengwo/14674.html"
                                                 target="_blank">&gt;&gt;更多地区</a></div>
                        </div>
                    </div>
                    <em>&gt;</em>
                </div>
                <div class="item">
                    <div class="drop">
                        <span class="hd"><a href="/travel-scenic-spot/mafengwo/10088.html">广州<i></i></a></span>
                        <div class="bd">
                            <i class="arrow"><b></b></i>
                            <div class="col">
                                <!--h3>热门国家</h3-->
                                <ul class="clearfix">
                                    <li><a href="/mdd/route/10088.html" target="_blank">广州行程线路</a></li>
                                    <li><a href="/jd/10088/gonglve.html" target="_blank">广州景点</a></li>
                                    <li><a href="/hotel/10088/?sFrom=mdd" target="_blank">广州酒店</a></li>
                                    <li><a href="/cy/10088/gonglve.html" target="_blank">广州餐饮</a></li>
                                    <li><a href="/gw/10088/gonglve.html" target="_blank">广州购物</a></li>
                                    <li><a href="/yl/10088/gonglve.html" target="_blank">广州娱乐</a></li>
                                    <li><a href="/localdeals/0-0-M10088-0-0-0-0-0.html" target="_blank">广州当地玩乐</a></li>
                                    <li><a href="/gonglve/ziyouxing/mdd_10088/" target="_blank">广州自由行攻略</a></li>
                                </ul>
                            </div>
                            <!--div class="more"><a href="#">&gt;&gt;更多国家</a></div-->
                        </div>
                    </div>
                    <em>&gt;</em>
                </div>
                <div class="item cur"><strong>广州景点</strong></div>
            </div>
            <script language="JavaScript" type="text/javascript">
                $(function () {
                    //面包屑
                    $('.drop').mouseenter(function (ev) {
                        var target = $(ev.currentTarget);
                        clearTimeout(target.data('hideTimer'));
                        target.addClass('open');
                        target.children('bd').fadeIn(200);
                    });
                    $('.drop').mouseleave(function (ev) {
                        var target = $(ev.currentTarget);
                        target.data("hideTimer", setTimeout(function () {
                            target.removeClass('open');
                            target.children('bd').fadeOut(200);
                        }, 200));
                    });
                });
            </script>

            <div class="place-navbar" id="_j_mdd_place_nav_bar_warper" style="border-top: 0;" data-cs-t="目的地导航">
                <div class="navbar-con">
                    <ul class="navbar clearfix navbar-first-level-warper">
                        <li class="navbar-overview">
                            <a class="navbar-btn" href="/travel-scenic-spot/mafengwo/10088.html" data-cs-p="首页">
                                <i class="navbar-icon"></i><span>首页</span>

                            </a>
                        </li>
                        <li class="navbar-line">
                            <a class="navbar-btn" href="/mdd/route/10088.html" data-cs-p="行程线路">
                                <i class="navbar-icon"></i><span>行程线路</span>

                            </a>
                        </li>
                        <li class="navbar-scenic">
                            <a class="navbar-btn" href="/jd/10088/gonglve.html" data-cs-p="景点">
                                <i class="navbar-icon"></i><span>景点</span>

                            </a>
                        </li>
                        <li class="navbar-hotels">
                            <a class="navbar-btn" href="/hotel/10088/?sFrom=mdd" data-cs-p="酒店">
                                <i class="navbar-icon"></i><span>酒店</span>

                            </a>
                        </li>
                        <li class="navbar-flight">
                            <a class="navbar-btn" href="/flight/" target="_blank" data-cs-p="机票">
                                <i class="navbar-icon"></i><span>机票</span>

                            </a>
                        </li>

                    </ul>
                </div>
            </div>
            <div id="fill_area" style="height: 75px; display: none;"></div>

        </div>
    </div>
</div>
<div class="row row-summary row-bg">
    <div class="wrapper" style="padding-top: 40px;padding-bottom: 40px;">
        <h2 class="title">景点概况</h2>
        <div>
            <p style="">
            ${dest.summary}
        </div>
    </div>

</div>
<br>
<br>


<div class="row row-top5" data-cs-p="必游景点">
    <div class="wrapper">
        <h2 class="title">必游景点TOP5</h2>
    <#list viewTop5 as top5>
        <div class="item clearfix">
            <div class="info">
                <div class="middle">
                    <h3>
                        <span class="num">${top5_index+1}</span>
                        <a href="/view/detail?id=${(top5.id)!}" target="_blank"
                           title="${(top5.name)!}">${(top5.name)!}
                        </a><a href="/poi/25091.html" target="_blank" title="广州塔">
                        <span class="rev-total"><em>${(top5.commentnum)!}</em> 条点评</span>
                    </a>
                    </h3>
                    <p>${(top5.info)!}</p>
                    <div class="links">这里还包含景点：
                        <#list top5.children as ref>

                            <a href="/view/detail?id=${(ref.id)!}" target="_blank">${(ref.name)!}</a>
                        </#list>
                    </div>
                </div>
            </div>

            <div style="float: inherit;margin-right: 5px;">
                <a href="/view/detail?id=${(top5.id)!}" target="_blank" title="广州塔">

                    <div class="large" style="float: left;margin-left: 10px;">
                        <img src="${(top5.imgUrls[0])!}"
                             width="380" height="270">
                    </div>


                    <div style="float: inherit;float:right;margin-right: 20px;">
                        <img src="${(top5.imgUrls[1])!}"
                             width="185" height="130">
                    </div>
                    <div style="float: inherit;float:right;margin-top: 10px;margin-right: 20px;">
                        <img src="${(top5.imgUrls[2])!}"
                             width="185" height="130">
                    </div>

                </a>
            </div>
        </div>
    </#list>
    </div>


    <br>
</div>
<Br>
<Br>


<div class="row row-hotScenic row-bg" data-cs-p="热门景点">
    <div class="wrapper">
        <h2 class="title">热门景点</h2>
        <div class="bd">
        <#list hotView as hv>

        <#--<#if hv_index==0||hv_index==7>-->
        <#--<div class="grid-two">-->

        <#--<#else>-->
            <div class="grid" style="float: left;margin-right: 5px;width: 242px; height:155px;">
            <#--</#if>-->
                <div class="figure">
                    <a href="/view/detail?id=${(hv.id)!}" target="_blank">
                        <img src="${(hv.imgUrls[0])!}">
                        <h3 class="title">${(hv.name)!}</h3>
                        <div class="mask-container">
                            <div class="mask">
                                <div class="middle">
                                    <h3>${(hv.name)!}</h3>
                                    <p>${(hv.info)!}</p>
                                </div>
                            </div>
                        </div>
                    </a>
                </div>

            </div>
        </#list>
        </div>

    </div>


    <form action="/view/allViews" method="post" id="searchForm">

        <div class="row row-allScenic" data-cs-p="全部景点">
            <div class="wrapper">
                <h2 class="title">
                    广州全部景点
                    <a class="btn-add" href="/view/input"
                       title="推荐新的景点"><i>+</i>推荐新的景点</a>
                </h2>
                <ul class="nav clearfix">
                    <li class="on tagId" data-tagid="-1"><a title="全部景点">全部景点</a></li>
                <#list tags as t>
                    <li data-tagid="${(t.id)!}" class="tagId" id="tagId${t.id}" name="tagId" value="${t.id}">
                        <a>${(t.name)!}</a></li>
                </#list>

                </ul>
                <div id="allViewsByTag">


                </div>
                <br>
            </div>
        </div>

    </form>


</div>
<#include "../common/footer.ftl">
</body>

</html>