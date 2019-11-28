<div class="container">
            <div class="wrapper wiki-wrapper clearfix">
                <div class="wiki-aside">
                    <ul class="wiki-nav">
                        <#list catalogs as c>
                            <li>
                                <a href="javascript:;" data-id="${c.id}" class="catalog">${c.name}</a>
                            </li>
                        </#list>

                        <script>
                            $(".catalog[data-id='${catalog.id!}']").closest("li").addClass("on");
                        </script>
                    </ul>
                </div>
                <div class="wiki-cont">
                    <div class="wiki-title clearfix">
                        <h1 class="h1">${catalog.name!}</h1>
                    </div>
                    <div >
                        <#if catalog??>
                        <#list catalog.details as d>
                            <a href="/strategy/detail?id=${d.id}" >${d.title}</a>
                            &nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
                        </#list>
                        </#if>
                    </div>
                    <Br>
                    <div><h2>${(detail.title)!}</h2></div>
                    <div class="wiki-cont">
                    ${(detail.strategyContent.content)!}
                    </div>
                </div>
            </div>
        </div>

<script>
    $(".catalog").click(function () {
        var catalogId = $(this).data("id");
        $.get("/destination/survey", {destId:${qo.destId}, catalogId:catalogId}, function (data) {
            $("#catalogContent").html(data);
        })
    })
</script>