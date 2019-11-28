<!DOCTYPE html>
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title></title>
    <link href="/styles/base.css" rel="stylesheet" type="text/css">
    <link href="/styles/gonglve.css" rel="stylesheet" type="text/css">
    <script type="text/javascript" src="/js/jquery/jquery.js"></script>
    <script type="text/javascript" src="/js/plugins/jquery-form/jquery.form.js"></script>
    <link href="/js/plugins/jqPaginator/jqPagination.css" rel="stylesheet" type="text/css">
    <script type="text/javascript" src="/js/plugins/jqPaginator/jq-paginator.min.js"></script>
    <script type="text/javascript" src="/js/system/gonglve.js"></script>
</head>

<script>

    $(function () {
        $("#searchForm").ajaxForm(function (data) {
            $("#strategySearchPageData").html(data);
        })
        $("#searchForm").submit();
    })
</script>


<body>
    <#assign currentNav="strategy">
    <#include "../common/navbar.ftl">
    <div class="wrapper">
        <div class="focus">
            <div class="mdd_nav">
                <div class="gonglve-nav">
                    <div class="nav-item">
                        <div class="nav-title">
                            <h3>攻略飙升排行</h3>
                            <b class="gn-arrow"></b>
                        </div>
                        <div class="nav-panel rank-panel">
                            <ol>
                                <#list upCds as d>
                                    <li class="top3">
                                        <em class="rank-num">${d_index + 1}</em>
                                        <strong>
                                            <a href="/destination/guide?id=${d.destId!}" target="_blank">${d.destName!}</a>
                                        </strong>
                                        <a href="/strategy/detail?id=${d.strategyId}" target="_blank">${d.title!}</a>
                                    </li>
                                </#list>
                            </ol>
                        </div>
                    </div>
                    <div class="nav-item">
                        <div class="nav-title">
                            <h3>攻略热门排行</h3>
                            <b class="gn-arrow"></b>
                        </div>
                        <div class="nav-panel rank-panel">
                            <ol>
                                <#list hotCds as d>
                                    <li class="top3">
                                        <em class="rank-num">${d_index + 1}</em>
                                        <strong>
                                            <a href="/destination/guide?id=${d.destId!}" target="_blank">${d.destName!}</a>
                                        </strong>
                                        <a href="/strategy/detail?id=${d.strategyId}" target="_blank">${d.title!}</a>
                                    </li>
                                </#list>
                            </ol>
                        </div>
                    </div>
                    <div class="nav-item">
                        <div class="nav-title">
                            <h3>主题推荐</h3>
                            <b class="gn-arrow"></b>
                        </div>
                        <div class="nav-panel category-panel">
                           <#list themeCds as tc >
                            <dl class="clearfix">
                                <dt>${(tc.theme.name)!}</dt>
                                <#list tc.dests as d>
                                    <dd><a href="/strategy/list?destId=${(d.id)!}">${(d.name)!}</a></dd>
                                </#list>
                            </dl>
                            </#list>
                        </div>
                    </div>
                </div>
                <div class="input_like">
                    <div>
                        <span></span>
                        <input type="text" placeholder="请输入想去的地方，如:香港" />
                        <div class="clear"></div>
                    </div>
                    <div id="search_result">
                        <strong>此攻略还没有上线，敬请期待</strong>
                        <ul>
                            <li>
                                <em>
                                    <a href="javascript:;" style="color: #666">
                                        <b class="highlight">香</b>港</a>
                                </em>
                            </li>
                            <li>
                                <em>
                                    <a href="javascript:;" style="color: #666">
                                        <b class="highlight">香</b>港</a>
                                </em>
                            </li>
                            <div class="clear"></div>
                        </ul>
                    </div>
                </div>
                <div class="app_d">
                    <h3>
                        <a>
                            <img src="./images/logo_gonglve_v6.png" width="50" height="50" />
                        </a>
                    </h3>
                    <div class="domn_in">
                        <h4>
                            <a href="javascript:;">骡窝窝自由行APP下载</a>
                        </h4>
                        <p>
                            <a style="cursor: auto;">iPhone版</a>
                            <span>|</span>
                            <a style="cursor: auto;">Android版</a>
                            <span>|</span>
                            <a style="cursor: auto;">iPad版</a>
                        </p>
                        <div class="clear"></div>
                    </div>
                    <div class="clear"></div>
                </div>
            </div>
            <div class="slide">
                <ul id="slide_box">

                    <#list commends as c>
                        <li>
                            <a href="/strategy/detail?id=${(c.strategyId)!}">
                                <img src="${(c.coverUrl)!}" />
                            </a>
                        </li>
                    </#list>

                </ul>
                <ol id="thumb_box">
                    <#list commends as c>
                        <li  data-id="${c_index}" class="${(c_index == 0)?string('on', '')}"></li>
                    </#list>
                </ol>
            </div>
        </div>
        <div class="gl_nav">
            <a href="javascript:;">全部旅游攻略导航</a>
            <span>>></span>
            <strong id="currentNav"></strong>
            <div class="clear"></div>
        </div>
        <div class="gl_wrap">
            <h3>
                <a href="javascript:;">国内攻略</a>
            </h3>
            <ol>
                <#list unabroads as p>
                    <li>
                        <a href="javascript:;" class="strategySearch" data-type="1" data-value="${p.id!}">${p.name!}(${p.count!})</a>
                    </li>
                </#list>
            </ol>
            <span class="sp_toggle">
                <a href="javascript:void(0);" class="more_selector">更多</a>
            </span>
            <div class="clear"></div>
        </div>

        <div class="gl_wrap">
            <h3>
                <a href="javascript:;">海外攻略</a>
            </h3>
            <ol>
                <#list abroads as p>
                    <li>
                        <a href="javascript:;" class="strategySearch" data-type="2" data-value="${p.id!}">${p.name!}(${p.count!})</a>
                    </li>
                </#list>
            </ol>
            <span class="sp_toggle">
                <a href="javascript:void(0);" class="more_selector">更多</a>
            </span>
            <div class="clear"></div>
        </div>

        <div class="gl_wrap">
            <h3>
                <a href="javascript:;">主题攻略</a>
            </h3>
            <ol>
                <#list themes as t>
                    <li>
                        <a href="javascript:;" class="strategySearch"  data-type="3" data-value="${t.id!}">${t.name!}(${t.count!})</a>
                    </li>
                </#list>
            </ol>
            <span class="sp_toggle">
                <a href="javascript:void(0);" class="more_selector">更多</a>
            </span>
            <div class="clear"></div>
        </div>
        <div class="p_upw">
            <div class="uptime_p">
                <a href="javascript:;" data-type="orderBy" data-value="viewnum"  class="strategySearch upt_on">最受欢迎</a>
                <span>|</span>
                <a href="javascript:;" data-type="orderBy" data-value="createTime" class="strategySearch " >更新时间</a>
                <div class="clear"></div>
            </div>
            <div class="clear"></div>
        </div>
        <#--数据-->
        <form action="/strategy/searchPage" method="post" id="searchForm">
            <input type="hidden" name="currentPage" id="currentPage" value="1">
            <input type="hidden" name="orderBy" id="orderBy" value="viewnum">
            <input type="hidden" name="type" id="typeId" value="-1">
            <input type="hidden" name="typeValue" id="typeValue" value="-1">
            <div id="strategySearchPageData">

            </div>
        </form>
        <script>
            $(".strategySearch").click(function () {
                var type = $(this).data("type");
                var value = $(this).data("value")
                var cl;
                if(type == 'orderBy'){
                    $("#orderBy").val(value);
                    cl = "upt_on"

                    type = $(".onfs").data("type");
                    value = $(".onfs").data("value");
                }else{
                    cl = "onfs"
                    $("#currentNav").html($(this).text());
                }

                $(".strategySearch").removeClass(cl);
                $(this).addClass(cl);

                if (type && value) {
                    $("#typeId").val(type);
                    $("#typeValue").val(value);
                }

                $("#currentPage").val(1);
                $("#searchForm").submit();
            })
        </script>
    </div>
    <#include "../common/footer.ftl">
</body>
</html>