<!DOCTYPE html>
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title></title>
    <link href="/styles/base.css" rel="stylesheet" type="text/css">
    <link href="/styles/index.css" rel="stylesheet" type="text/css">
    <link href="/js/plugins/jqPaginator/jqPagination.css" rel="stylesheet" type="text/css">
    <script type="text/javascript" src="/js/jquery/jquery.js"></script>
    <script type="text/javascript" src="/js/plugins/jquery-form/jquery.form.js"></script>
    <script type="text/javascript" src="/js/plugins/jqPaginator/jq-paginator.min.js"></script>
    <script type="text/javascript" src="/js/system/index.js"></script>
    <script type="text/javascript" charset="utf-8"
            src="/js/system/qc_jssdk.js"
            data-appid="101827350"
            data-redirecturi="http://127.0.0.1:80/destination"
    ></script>

    <script>
        $(function () {
            //查询
            $("#_j_index_search_btn_all").click(function () {
                var type = $(".tab-selected").data("index");
                $("#searchType").val(type);
                $("#kwSearchForm").submit();
            })


            //默认游记list
            $("#searchForm").ajaxForm(function (data) {
                $("#_j_tn_content").html(data);
            });
            $("#searchForm").submit();

            //排序
            $(".orderTypeBtn").click(function () {
                $(this).closest("li").addClass("active");
                var type = $(this).data("type");
                $("#currentPage").val(1);
                $("#orderType").val(type);
                $("#searchForm").submit();
            });

            $("#_j_index_search_tab li").click(function () {
                var val = $(this).data("index");
                $("#searchType").val(val);
            })
        })

    </script>

</head>


<body>
    <#assign currentNav="index">
    <#include "../common/navbar.ftl">
<script>
    function qq_login() {
        $('#QQ').click(function () {
            QC.Login.showPopup({
                appId: "101827350",
                redirectURI: "http://127.0.0.1:80/destination"
            })
        })
    }
</script>

<div class="mfw-focus" id="_j_mfw_focus">
    <div class="show-slider" style="height: 450px;">
        <ul class="show-image">
                <#list tcs as tc>
                    <li class="${(tc_index==0)?string('first','')}">
                        <a href="/travel/detail?id=${tc.travelId!}" class="show-pic">
                            <img src="${tc.coverUrl!}">
                        </a>
                        <a href="javascript:;" class="show-title dark">
                            <div class="date">
                                <span class="day">7</span>/May.2019
                            </div>
                            <h3>${tc.title!}</h3>
                        </a>
                    </li>
                </#list>
        </ul>
        <ul class="show-nav">
                 <#list tcs as tc>
                     <li class="${(tc_index==0)?string('active','')}" data-id="${tc_index}">
                         <a href="javascript:">
                             <img src="${tc.coverUrl!}" height="62" width="110">
                             <span></span>
                         </a>
                     </li>
                 </#list>
        </ul>
        <a class="show-more" target="_blank" href="javascript:;">历历在目</a>
    </div>
    <div class="search-container" id="_j_index_search">

        <div class="search-group">

            <form action="/q" method="get" id="kwSearchForm">
                <input type="hidden" name="type" value="-1" id="searchType">

                <div class="searchtab" id="_j_index_search_tab">
                    <ul class="clearfix">
                        <li class="tab-selected" data-index="-1"><i></i>全部</li>
                        <li data-index="0"><i></i>目的地</li>
                        <li data-index="1"><i></i>攻略</li>
                        <li data-index="2"><i></i>游记</li>
                        <li data-index="3"><i></i>找人</li>
                    </ul>
                </div>
                <div class="searchbar" id="_j_index_search_bar_all">
                    <div class="search-wrapper">
                        <div class="search-input">
                            <input name="keyword" type="text" placeholder="搜目的地/攻略/游记/用户" id="_j_index_search_input_all"
                                   autocomplete="off">
                        </div>
                    </div>
                    <div class="search-button" id="_j_index_search_btn_all">
                        <a role="button" href="javascript:"><i class="icon-search"></i></a>
                    </div>
                </div>

            </form>
        </div>
    </div>
</div>
<div class="mfw-container clearfix">
    <div class="sales-entrys-container clearfix">
        <a class="sales-entrys-item entrys-bg-sales" href="javascript:;">
            <div class="sales-entrys-title">
                自由行
            </div>
            <div class="sales-entrys-subtitle">
                旅行就要freestyle
            </div>
        </a>
        <a class="sales-entrys-item entrys-bg-group" href="javascript:;">
            <div class="sales-entrys-title">
                跟团游
            </div>
            <div class="sales-entrys-subtitle">
                省心省力 行程透明
            </div>
        </a>
        <a class="sales-entrys-item entrys-bg-localdeals" href="javascript:;">
            <div class="sales-entrys-title">
                当地游
            </div>
            <div class="sales-entrys-subtitle">
                最地道的玩法体验
            </div>
        </a>
        <a class="sales-entrys-item entrys-bg-flight" href="javascript:;">
            <div class="sales-entrys-title">
                机票
            </div>
            <div class="sales-entrys-subtitle">
                特惠一折起
            </div>
        </a>
        <a class="sales-entrys-item entrys-bg-visa" href="javascript:;">
            <div class="sales-entrys-title">
                签证
            </div>
            <div class="sales-entrys-subtitle">
                服务优质 出签率高
            </div>
        </a>
        <a class="sales-entrys-item entrys-bg-ship" href="javascript:;">
            <div class="sales-entrys-title">
                邮轮
            </div>
            <div class="sales-entrys-subtitle">
                移动的海上城堡
            </div>
        </a>
    </div>
    <div class="mfw-wrapper">
        <div class="mfw-travelnotes">
            <div class="navbar clearfix">
                <ul class="tn-nav" id="_j_tn_nav">
                    <li class="_j_gs_tab tn-nav-hot active">
                        <a href="javascript:void(0);" class="orderTypeBtn" data-type="2">热门游记</a>
                    </li>
                    <li class="_j_gs_tab tn-nav-new">
                        <a href="javascript:void(0);" class="orderTypeBtn" data-type="1">最新发表</a>
                    </li>
                </ul>
                <div class="tn-write"><a class="btn-add" href="/travel/input" target="_blank" rel="nofollow"><i></i>写游记</a>
                </div>
            </div>
            <div class="pagelet-block">
                <form action="/index/travelPage" method="post" id="searchForm">
                    <input type="hidden" name="currentPage" value="1" id="currentPage">
                    <input type="hidden" name="orderType" value="2" id="orderType">
                    <div id="_j_tn_content">
                        <!--游记-->
                    </div>
                </form>
            </div>
        </div>
    </div>
    <div class="mfw-aside">
        <div class="asidebox safety-prevention">
            <a style="display:block;margin-top:5px;" href="/travel_advise/index" target="_blank">
                <img src="http://images.mafengwo.net/images/safety-prevention/index-link.png" width="218" height="31">
            </a>
        </div>
        <div class="asidebox box-gonglve">
            <div class="asidebox-hd">
                <h2 class="hd-title">旅游攻略推荐</h2>
                <a class="hd-right" href="/strategy/list">更多</a>
            </div>
            <div class="asidebox-bd">

                    <#list scs as sc>
                        <div class="gonglve-item">
                            <div class="img">
                                <a href="javascript:;" target="_blank">
                                    <img src="${sc.coverUrl!}" width="200px"><span class="mark">自由行攻略</span></a>
                            </div>
                            <h3><a href="javascript:;" target="_blank">${sc.subTitle!}</a></h3>
                        </div>
                    </#list>
            </div>

        </div>
        <div class="m-hotsale">
            <h3 class="hd">本周热卖</h3>
            <ul>
                <li>
                    <a href="javascript:;" target="_blank">
                            <span class="image"><img
                                    src="/wKgIC1xOo6iAS0mlABAmBVFn6AA539.gif"
                                    height="70" width="100"></span>
                        <div title="最高立减800·上海飞马尔代夫鲁滨逊努努岛7天蜜月自由行（一价全包+私人泳池+儿童吃住优惠+婚纱摄影+可预订奥静/努努岛/中央格兰宁/康迪玛）"
                             class="title">最高立减800·上海飞马尔代夫鲁滨逊努努...
                        </div>
                        <span class="price">¥11880起</span>
                    </a>
                </li>
                <li>
                    <a href="javascript:;" target="_blank">
                            <span class="image"><img
                                    src="/wKgED1vzqwOAAsFFAAL1lFyHgLg47.jpeg"
                                    height="70" width="100"></span>
                        <div title="【五月美食节】上海出发塞班岛6天5晚自由行(早鸟优惠最高减500元+金卡会员立减500元+赠环岛游+军舰岛+接送机+可升级丛林探险+双重套餐不同选择+含税费1550元+导游小费+中文接送机 )"
                             class="title">【五月美食节】上海出发塞班岛6天5晚自...
                        </div>
                        <span class="price">¥3180起</span>
                    </a>
                </li>
                <li>
                    <a href="javascript:;" target="_blank">
                            <span class="image"><img
                                    src="/wKgBEFsscoCAVoO2AAOWOCBnxfs33.jpeg"
                                    height="70" width="100"></span>
                        <div title="ins网红拍照圣地·上海直飞美娜多5天自由行(网红无边泳池+布纳肯海龟合照+可考潜水证+深潜教学+追海豚+滑翔伞)" class="title">
                            ins网红拍照圣地·上海直飞美娜多5天自...
                        </div>
                        <span class="price">¥3280起</span>
                    </a>
                </li>
                <li>
                    <a href="javascript:;" target="_blank">
                            <span class="image"><img
                                    src="/wKgED1uQ-eOAMAiMAAU0ehvmPqA28.jpeg"
                                    height="70" width="100"></span>
                        <div title="金卡最高立减500+畅享一价全包·上海往返马尔代夫鲁滨逊努努岛7天5晚自由行（水屋带私人泳池+精彩晚会DJ表演+全天托儿服务+锦鲤免费升级房型/水飞上岛+可订库拉玛提岛/阿玛瑞/波杜希蒂岛/神仙珊瑚岛/奥臻岛/芙花芬岛/莫凡彼岛/尼亚玛/奥静岛）"
                             class="title">金卡最高立减500+畅享一价全包·上海往...
                        </div>
                        <span class="price">¥10680起</span>
                    </a>
                </li>
                <li>
                    <a href="javascript:;" target="_blank">
                            <span class="image"><img
                                    src="/wKgED1xFn0SAXJ-1AAKOKgZepzM541.png"
                                    height="70" width="100"></span>
                        <div title="北京直飞普吉岛7天自由行（端午/暑期惊喜优惠+最高立减968元+家庭/蜜月同款+屋顶/星光泳池+网红酒店/轻奢别墅任意搭+可定制曼谷/清迈多地连线+赠电话卡/VIP接送机/旅游保险）"
                             class="title">北京直飞普吉岛7天自由行（端午/暑期惊...
                        </div>
                        <span class="price">¥3250起</span>
                    </a>
                </li>
            </ul>
        </div>
    </div>
</div>
    <#include "../common/footer.ftl">
</body>

</html>