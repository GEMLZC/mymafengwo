<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title></title>

    <link href="/styles/base.css" rel="stylesheet" type="text/css">
    <link href="/styles/travelspot.css" rel="stylesheet" type="text/css">
    <link href="/styles/select.css" rel="stylesheet" type="text/css">

    <link href="/js/plugins/jqPaginator/jqPagination.css" rel="stylesheet" type="text/css">

    <script type="text/javascript" src="/js/jquery/jquery.min.js"></script>
    <script type="text/javascript" src="/js/plugins/jqPaginator/jq-paginator.min.js"></script>

    <script type="text/javascript" src="/js/plugins/jq uery-form/jquery.form.js"></script>
    <script type="text/javascript" src="/js/system/guide.js"></script>
</head>

<script>
    $(function () {

        //游记分页
        $("#searchForm").ajaxForm(function (data) {
            $("#travelPage").html(data);
        });
        $("#searchForm").submit();

        //游记分页
        $(".com-opt").change(function () {
            $("#currentPage").val(1);
            $("#searchForm").submit();
        })

    })
</script>

<body>
    <#assign currentNav="destination">
    <#include "../common/navbar.ftl">
    <div id="container">
        <div class="row row-placeTop row-bg">
            <div class="wrapper">
                <div class="extra">
                    <div class="action">
                        <a class="btn-collect" href="javascript:void(0)" _iswg="0" _mddid="14674" data-act="want_go" class="icon"></i>收藏</a>
                        <a class="btn-been" href="javascript:void(0)" _ispa="0" _mddid="14674" data-act="set_path"><i
                                class="icon"></i>去过</a>
                    </div>
                </div>
                <#include "../common/toast.ftl"/>
                <div class="title" style="position: relative;">
                    <h1>${dest.name}</h1>
                    <a class="num-photo" href="javascript:;" target="_blank"></a>
                    <br>
                    <div style="position: absolute;top: 3px;right: 220px;"><img src="https://b3-q.mafengwo.net/s12/M00/84/BF/wKgED1v-df2Ab5KFAAFioLPYatQ535.png" style="width: 390px;"></div>
                </div>
                <div class="place-navbar" style="border-top: 0;">
                    <div class="navbar-con">
                        <ul class="navbar clearfix navbar-first-level-warper">
                            <li class="navbar-overview city-guide">
                                <a class="navbar-btn" href="javascript:;">
                                    <i class="navbar-icon"></i><span>概况</span>
                                </a>
                            </li>
                            <li class="navbar-line">
                                <a class="navbar-btn" href="#travel">
                                    <i class="navbar-icon"></i><span>游记</span>
                                </a>
                            </li>
                            <li class="navbar-line">
                                <a class="navbar-btn navbar-local" href="#strategy">
                                    <i class="navbar-icon"></i><span>攻略</span>
                                </a>
                            </li>
                            <li class="navbar-scenic">
                                <a class="navbar-btn navbar-local" href="/view/list?destId=${dest.id}">
                                    <i class="navbar-icon"></i><span>景点</span>
                                </a>
                            </li>
                            <li class="navbar-line">
                                <a class="navbar-btn navbar-sales" href="javascript:;">
                                    <i class="navbar-icon"></i><span>跟团游</span>
                                </a>
                            </li>
                        </ul>
                        <div class="overview-drop hide" style="height: auto; overflow: hidden;">
                            <div class="drop-bd">

                                <#list catalogs as c>
                                <dl class="clearfix">
                                    <dt><a href="/destination/surveyPage?destId=${dest.id!}&catalogId=${c.id}" target="_blank">${c.name!}</a></dt>
                                    <dd>
                                        <#list c.details as d>
                                            <a href="/strategy/detail?id=${d.id!}" target="_blank">${d.title}</a><span>|</span>
                                        </#list>
                                    </dd>
                                </dl>
                                </#list>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="pagelet-block">
            <div class="row row-local row-bg">
                <div class="wrapper">
                    <h2 class="r-title"><a href="javascript:;" name="strategy">${dest.name!}攻略</a></h2>
                    <div class="local-pro">
                        <ul class="clearfix">


                            <#list  strategyDetails as sd>
                            <li>
                                <a class="img"  href="/strategy/detail?id=${sd.id}" target="_blank">
                                    <img src="${sd.coverUrl}" width="320" height="170">
                                </a>
                                <a class="title"  href="/strategy/detail?id=${sd.id}" target="_blank">${sd.title}</a>
                                <p>${sd.summary}</p>
                                <div class="more"><a class="a-link" href="/strategy/detail?id=${sd.id}" target="_blank"><i
                                            class="icon-link"></i>查看详情</a></div>
                            </li>

                            </#list>

                        </ul>
                    </div>
                    <div class="r-more"><a href="/strategy/list?destId=${dest.id!}" target="_blank">查看全部</a></div>
                </div>
            </div>
        </div>
        <div class="pagelet-block">
            <div class="row row-travels">
                
                <form action="/destination/travels" method="post" id="searchForm">
                    <input type="hidden" name="currentPage"  id="currentPage" value="1">
                    <input type="hidden" name="destId"  id="destId" value="${dest.id!}">
                <div class="wrapper">
                    <div class="navbar clearfix">
                        <ul class="tn-nav">
                            <li class="active"><h2 class="r-title"><a href="javascript:;" name="travel">${dest.name!}游记</a></h2></li>
                        </ul>
                    </div>
                    <div class="relcontent yj" style="display: block;">
                        <div class="navbar-sub clearfix">

                            排序：
                            <select class="com-opt" name="orderType">
                                <option value="1">最新</option>
                                <option value="2">最热</option>
                            </select>

                            出发时间：
                            <select class="com-opt" name="travelTimeType">
                                <option value="-1">不限</option>
                                <option value="1">1-2月</option>
                                <option value="2">3-4月</option>
                                <option value="3">5-6月</option>
                                <option value="4">7-8月</option>
                                <option value="5">9-10月</option>
                                <option value="6">11-12月</option>
                            </select>

                            人均花费：
                            <select  class="com-opt" name="perExpendType">
                                <option value="-1">不限</option>
                                <option value="1">1-999</option>
                                <option value="2">1K-6K</option>
                                <option value="3">6K-20K</option>
                                <option value="4">20K以上</option>
                            </select>

                            出行天数：
                            <select  class="com-opt" name="dayType">
                                <option value="-1">不限</option>
                                <option value="1">3天以下</option>
                                <option value="2">4-7天</option>
                                <option value="3">8-14天</option>
                                <option value="4">15天以上</option>
                            </select>

                        </div>
                        <div class="_notelist">
                            <div class="tn-list" id="travelPage">
                                <#--游记-->

                            </div>
                        </div>
                    </div>
                </div>
                </form>
            </div>
        </div>
        <div class="pagelet-block">
            <div class="row row-placeList">
                <div class="wrapper">
                    <h2 class="r-title">${dest.name!}周边【拓展】</h2>
                    <div class="bd">
                        <ul class="clearfix">
                            <li class="item">
                                <div class="img">
                                    <img class="lazy" height="200" width="320" src="/wKgB3FGMgSCAZo0qAAgGckFTqJA54.jpeg" style="display: inline;">
                                    </a>
                                </div>
                                <dl class="caption">
                                    <dt>
                                        <a href="javascript:;"
                                            target="_blank"><strong>香港</strong><br><b>40576</b>人去过</a>
                                    </dt>
                                    <dd>
                                        <a href="javascript:;" target="_blank">香港迪士尼乐园</a>
                                        <span class="divide"></span>
                                        <a href="javascript:;" target="_blank">太平山顶</a>
                                        <span class="divide"></span>
                                        <a href="javascript:;" target="_blank">香港海洋公园</a>
                                    </dd>
                                </dl>
                            </li>

                            <li class="item">
                                <div class="img">
                                    <a href="javascript:;" target="_blank">
                                        <img class="lazy" height="200" width="320" src="/wKgB3FECAVCANTk_AAWNVF8sjYw25.jpeg" style="display: inline;">
                                    </a>
                                </div>
                                <dl class="caption">
                                    <dt>
                                        <a href="javascript:;"
                                            target="_blank"><strong>深圳</strong><br><b>33108</b>人去过</a>
                                    </dt>
                                    <dd>
                                        <a href="javascript:;" target="_blank">东部华侨城</a>
                                        <span class="divide"></span>
                                        <a href="javascript:;" target="_blank">西涌海滩</a>
                                        <span class="divide"></span>
                                        <a href="javascript:;" target="_blank">世界之窗</a>
                                    </dd>
                                </dl>
                            </li>
                            <li class="item">
                                <div class="img">
                                    <a href="javascript:;" target="_blank">
                                        <img class="lazy" height="200" width="320" src="/wKgB6lP0VpCADPDPAAPICO-I-Iw57.jpeg" style="display: inline;">
                                    </a>
                                </div>
                                <dl class="caption">
                                    <dt>
                                        <a href="javascript:;"
                                            target="_blank"><strong>珠海</strong><br><b>17660</b>人去过</a>
                                    </dt>
                                    <dd>
                                        <a href="javascript:;" target="_blank">珠海长隆海洋王国</a>
                                        <span class="divide"></span>
                                        <a href="javascript:;" target="_blank">外伶仃岛</a>
                                        <span class="divide"></span>
                                        <a href="javascript:;" target="_blank">情侣路</a>
                                    </dd>
                                </dl>
                            </li>
                            <li class="item">
                                <div class="img">
                                    <a href="javascript:;" target="_blank">
                                        <img class="lazy" height="200" width="320" src="/wKgB4lIlVk6AIMCDAAStueA6sSU73.jpeg" style="display: inline;">
                                    </a>
                                </div>
                                <dl class="caption">
                                    <dt>
                                        <a href="javascript:;"
                                            target="_blank"><strong>惠州</strong><br><b>7214</b>人去过</a>
                                    </dt>
                                    <dd>
                                        <a href="javascript:;" target="_blank">双月湾</a>
                                        <span class="divide"></span>
                                        <a href="javascript:;" target="_blank">巽寮湾</a>
                                        <span class="divide"></span>
                                        <a href="javascript:;" target="_blank">惠州西湖</a>
                                    </dd>
                                </dl>
                            </li>
                            <li class="item">
                                <div class="img">
                                    <a href="javascript:;" target="_blank">
                                        <img class="lazy" height="200" width="320" src="/wKgB6lRZ5s6ARJzuAAjCwdIPcK865.jpeg" style="display: inline;">
                                    </a>
                                </div>
                                <dl class="caption">
                                    <dt>
                                        <a href="javascript:;"
                                            target="_blank"><strong>佛山</strong><br><b>9649</b>人去过</a>
                                    </dt>
                                    <dd>
                                        <a href="javascript:;" target="_blank">顺德清晖园</a>
                                        <span class="divide"></span>
                                        <a href="javascript:;" target="_blank">佛山祖庙</a>
                                        <span class="divide"></span>
                                        <a href="javascript:;" target="_blank">岭南天地</a>
                                    </dd>
                                </dl>
                            </li>
                            <li class="item">
                                <div class="img">
                                    <a href="javascript:;" target="_blank">
                                        <img class="lazy" height="200" width="320" src="/wKgB3FIMRvaAdrjoAAGCmIetJvQ75.jpeg" style="display: inline;">
                                    </a>
                                </div>
                                <dl class="caption">
                                    <dt>
                                        <a href="javascript:;"
                                            target="_blank"><strong>韶关</strong><br><b>6248</b>人去过</a>
                                    </dt>
                                    <dd>
                                        <a href="javascript:;" target="_blank">丹霞山</a>
                                        <span class="divide"></span>
                                        <a href="javascript:;" target="_blank">广东大峡谷</a>
                                        <span class="divide"></span>
                                        <a href="javascript:;" target="_blank">南华禅寺</a>
                                    </dd>
                                </dl>
                            </li>
                            <li class="item">
                                <div class="img">
                                    <a href="javascript:;" target="_blank">
                                        <img class="lazy" height="200" width="320" src="/wKgB4lMO9uuAbh9fAAKP4vgV8Os70.jpeg" style="display: inline;">
                                    </a>
                                </div>
                                <dl class="caption">
                                    <dt>
                                        <a href="javascript:;"
                                            target="_blank"><strong>东莞</strong><br><b>10353</b>人去过</a>
                                    </dt>
                                    <dd>
                                        <a href="javascript:;" target="_blank">下坝坊</a>
                                        <span class="divide"></span>
                                        <a href="javascript:;" target="_blank">松山湖风景区</a>
                                        <span class="divide"></span>
                                        <a href="javascript:;" target="_blank">可园博物馆</a>
                                    </dd>
                                </dl>
                            </li>
                            <li class="item">
                                <div class="img">
                                    <a href="javascript:;" target="_blank">
                                        <img class="lazy" height="200" width="320" src="/wKgB4lMNziCASS7YAADtzNGSAUU44.jpeg" style="display: inline;">
                                    </a>
                                </div>
                                <dl class="caption">
                                    <dt>
                                        <a href="javascript:;"
                                            target="_blank"><strong>中山</strong><br><b>8276</b>人去过</a>
                                    </dt>
                                    <dd>
                                        <a href="javascript:;" target="_blank">孙中山故居纪念馆</a>
                                        <span class="divide"></span>
                                        <a href="javascript:;" target="_blank">中山城-中山影视城</a>
                                        <span class="divide"></span>
                                        <a href="javascript:;" target="_blank">中山詹园</a>
                                    </dd>
                                </dl>
                            </li>
                            <li class="item">
                                <div class="img">
                                    <a href="javascript:;" target="_blank">
                                        <img class="lazy" height="200" width="320" src="/wKgBEFqTegaAGG-GAAgeDCxhmAQ61.jpeg" style="display: inline;">
                                    </a>
                                </div>
                                <dl class="caption">
                                    <dt>
                                        <a href="javascript:;"
                                           target="_blank"><strong>肇庆</strong><br><b>8276</b>人去过</a>
                                    </dt>
                                    <dd>
                                        <a href="javascript:;" target="_blank">肇庆大山</a>
                                        <span class="divide"></span>
                                        <a href="javascript:;" target="_blank">肇庆影视城</a>
                                        <span class="divide"></span>
                                        <a href="javascript:;" target="_blank">詹园</a>
                                    </dd>
                                </dl>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <#include "../common/footer.ftl">
</body>

</html>