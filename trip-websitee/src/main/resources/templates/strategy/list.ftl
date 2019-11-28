<!DOCTYPE html>
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title></title>
    <link href="/styles/base.css" rel="stylesheet" type="text/css">
    <link href="/styles/travelguide.css" rel="stylesheet" type="text/css">
    <link href="/js/plugins/jqPaginator/jqPagination.css" rel="stylesheet" type="text/css">
    <script type="text/javascript" src="/js/jquery/jquery.min.js"></script>
    <script type="text/javascript" src="/js/system/travelguide.js"></script>
    <script type="text/javascript" src="/js/plugins/jqPaginator/jq-paginator.min.js"></script>
</head>

<body>
 <#assign currentNav="strategy">
 <#include "../common/navbar.ftl">
 <div class="container">
    <div>
        <div class="crumb">
            <#include "../common/toast.ftl"/>
    </div>
    <div class="main clearfix">
        <div class="content">
            <form id="searchForm" action="/strategy/list" method="get">
                <input type="hidden" name="currentPage" value="1" id="currentPage">
                <input type="hidden" name="destId" value="${dest.id}" id="destId">
                <input type="hidden" name="tagId" value="${qo.tagId!-1}" id="tagId">
            </form>
            <div class="filter">
                <div class="filter-wrapper clearfix">
                    <ul class="filter-tag">
                        <li class="on _j_tag" data-id="-1"><a href="/strategy/list?destId=${dest.id!}" >全部</a></li>
                            <#list tags as t>
                                <li class="_j_tag" data-id="${t.id}"><a href="/strategy/list?tagId=${t.id}&destId=${dest.id!}">${t.name}</a></li>
                            </#list>
                    </ul>
                    <a class="trigger _j_trigger_btn" href="javascript:void(0);">更多</a> </div>

                <script>
                    $("._j_tag").removeClass("on")
                    $("._j_tag[data-id=${qo.tagId!}]").addClass("on")
                </script>

            </div>
            <div class="guide-list">
                <#list pageInfo.list as d>
                    <div class="item clearfix">
                        <a href="/strategy/detail?id=${d.id}" target="_blank" class="_j_item">
                            <div class="img"><img src="${d.coverUrl!}"></div>
                            <div class="detail">
                                <h3>${d.title!}</h3>
                                <ul>
                                    ${d.summary!}
                                </ul>
                                <div class="extra">
                                    <span class="location"><i></i>${(d.dest.name)!}</span>
                                    <span class="view"><i></i>${d.viewnum!}</span>
                                </div>
                            </div>
                        </a>
                    </div>
                </#list>
                <#include "../common/page.ftl">
            </div>
        </div>
        <div class="side-sales">
            <h3>本周热卖</h3>
            <ul>
                <li>
                    <a href="javascript:;" target="_blank">
                            <span class="image"><img
                                    src="/wKgBEFs6E4yAPz00AAhnvJUJ1j8238.gif"></span>
                        <div class="title"
                             title="广州长隆野生动物世界门票    随买随用 ／广州长隆旅游度假区／一票通玩 ／ 快速出票快捷入园 ／ 含空中览车及小火车/亲子乐园/赠送电子导览／自然零距离／广州长隆野生动物园">
                            广州长隆野生动物世界门票 随买随用 ／广州...</div>
                        <span class="price">¥260</span>
                    </a>
                </li>
                <li>
                    <a href="javascript:;" target="_blank">
                            <span class="image"><img
                                    src="/wKgED1wweM2AVCMFAAzr37WPWDI967.gif"></span>
                        <div class="title"
                             title="广州长隆欢乐世界门票   当天可买／广州长隆旅游度假区／快速出票快捷入园／收藏店铺送卷送攻略／广东番禺汉溪长隆/长隆成人票／情侣票／家庭票／双人票／儿童票">
                            广州长隆欢乐世界门票 当天可买／广州长隆旅...</div>
                        <span class="price">¥187</span>
                    </a>
                </li>
                <li>
                    <a href="javascript:;" target="_blank">
                            <span class="image"><img
                                    src="/wKgED1wdwVmAVaZUADon6OL7_xw084.gif"></span>
                        <div class="title" title="当天可订/广州长隆野生动物世界门票/长隆野生动物园/广州长隆旅游度假区/含缆车小火车/南北门均可取票（提前1天规则退）">
                            当天可订/广州长隆野生动物世界门票/长隆野生...</div>
                        <span class="price">¥256</span>
                    </a>
                </li>
                <li>
                    <a href="javascript:;" target="_blank">
                            <span class="image"><img
                                    src="/wKgBEFrEdj-Ac-nXAAOvgGsSLJI85.jpeg"></span>
                        <div class="title" title="广州长隆水上乐园门票 一票通玩（电子票／当地必玩／免预约／超级大喇叭/热浪谷/意想不到的水上乐园）">广州长隆水上乐园门票
                            一票通玩（电子票／当地...</div>
                        <span class="price">¥122</span>
                    </a>
                </li>
                <li>
                    <a href="javascript:;" target="_blank">
                            <span class="image"><img
                                    src="/wKgED1wk2LeAC2NJAAJQtab6Yqw67.jpeg"></span>
                        <div class="title" title="寻味广州1日游（6人小团·探黄埔军校陈家祠·电车看广州塔+沙面·西关美食秘籍·本地人带玩）">
                            寻味广州1日游（6人小团·探黄埔军校陈家祠·...</div>
                        <span class="price">¥288</span>
                    </a>
                </li>
            </ul>
        </div>
    </div>

</div>
 </div>
<#include "../common/footer.ftl">
</body>

</html>