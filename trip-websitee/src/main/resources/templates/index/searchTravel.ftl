<!DOCTYPE html>
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title></title>
    <link href="/styles/base.css" rel="stylesheet" type="text/css">
    <link href="/styles/search.css" rel="stylesheet" type="text/css">
    <link href="/js/plugins/jqPaginator/jqPagination.css" rel="stylesheet" type="text/css">
    <script type="text/javascript" src="/js/jquery/jquery.js"></script>
    <script type="text/javascript" src="/js/plugins/jqPaginator/jq-paginator.min.js"></script>
    <script type="text/javascript" src="/js/system/common.js"></script>

    <script>
        $(function () {
            $("#_j_search_button").click(function () {

                $("#searchType").val($(".nav-list a[class='on _j_search_link']").data("index"));
                $("#kwSearchForm").submit();
            })

            $("._j_search_link").click(function () {
                $("#searchType").val($(this).data("index"));
                $("#kwSearchForm").submit();
            })
        })
    </script>
</head>

<body>
    <#include "../common/navbar-search.ftl">
    <div class="mfw-search-main" id="_j_mfw_search_main">

        <div class="s-nav">
            <div class="wid">
                <div class="nav-list clearfix">
                    <a href="javascript:;" class=" _j_search_link" data-index="-1">全部</a>
                    <a href="javascript:;" class=" _j_search_link" data-index="0">目的地</a>
                    <a href="javascript:;" class=" _j_search_link" data-index="1">攻略</a>
                    <a href="javascript:;" class="on _j_search_link" data-index="2">游记</a>
                    <a href="javascript:;" class=" _j_search_link" data-index="3">找人</a>
                </div>
            </div>
        </div>
        <div class="wid clearfix">
            <div class="ser-nums">
                <div class="sr-nums">
                    <p class="ser-result-primary">
                        以下是为您找到的“${qo.keyword!}”相关结果${(page.totalElements)!0}条
                    </p>
                </div>
            </div>
            <div class="flt1 ser-lt" id="_j_search_result_left">

                <#if page.content?size  &gt; 0 >
                <div class="_j_search_section">
                    <div class="att-list">
                        <ul>
                            <li>
                                <div class="clearfix">

                                    <#list page.content as t>
                                    <div class="flt1"><a href="javascript:;" target="_blank" class="_j_search_link"><img
                                                src="${t.coverUrl!}"
                                                style="width:150px;height:90px;"></a></div>
                                    <div class="ct-text ">
                                        <h3>
                                            <a href="javascript:;" target="_blank"
                                                class="_j_search_link">${t.title!}</a>
                                        </h3>
                                        <p class="seg-desc">${t.summary!}</p>
                                        <ul class="seg-info-list clearfix">
                                            <li>
                                                <a href="javascript:;" target="_blank" class="_j_search_link">${t.destName}</a>
                                            </li>
                                            <li>
                                                浏览(${t.viewnum!0})
                                            </li>
                                            <li>
                                                评论(${t.replynum!0})
                                            </li>
                                            <li>
                                                ${(t.createTime?string('yyyy年MM月dd日'))!}
                                            </li>
                                        </ul>
                                    </div>
                                    </#list>
                                </div>
                            </li>
                        </ul>
                    </div>
                </div>
                </#if>
                <#include "../common/pageSearch.ftl">
        </div>
    </div>
    <#include "../common/footer.ftl">
</body>

</html>