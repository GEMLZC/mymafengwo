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
                    <a href="javascript:;" class=" _j_search_link" data-index="2">游记</a>
                    <a href="javascript:;" class="on _j_search_link" data-index="3">找人</a>
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

                <#if page.content?size &gt; 0 >
                <div class="_j_search_section" data-category="user">

                    <ul class="user-list-row">
                        <#list page.content as u>
                        <li>
                            <div class="btns">
                                <a class="btn-follow _j_user_follow" href="javascript:;" data-touid="75081249"
                                    data-has-followed="0"><i></i>关注</a>
                                <a class="btn-msg _j_user_letter" href="javascript:;" data-touid="75081249">私信</a>
                            </div>
                            <span class="avatar"><a href="javascript:;" target="_blank" class="_j_search_link"><img
                                        src="${u.headUrl!}"
                                        title="gzsclf" style="width:45px;height:45px;"></a></span>
                            <div class="base">
                                <span class="name"><a href="javascript:;" target="_blank"
                                        class="_j_search_link">${u.nickname!}-${u.destName!}</a></span>
                                <a class="grade" href="javascript:;">LV.${u.level!1}</a>
                            </div>
                            <div class="nums">
                                <a href="javascript:;" target="_blank" class="_j_search_link">游记：${u.travelnum!0}</a>
                                <a href="javascript:;" target="_blank" class="_j_search_link">粉丝：${u.fansnum!0}</a>
                                <a href="javascript:;" target="_blank" class="_j_search_link">回复：${u.replynum!0}</a>
                            </div>
                        </li>
                        </#list>

                    </ul>
                </div>
                </#if>
                <#include "../common/pageSearch.ftl">
            </div>

        </div>
    </div>
    <#include "../common/footer.ftl">
</body>

</html>