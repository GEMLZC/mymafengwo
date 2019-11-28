

<div class="gonglve_wrap">
    <#list page.content as c>
        <div class="tn-item clearfix">

            <div class="tn-image">
                <a href="javascript:;">
                    <img src="${c.coverUrl!}" />
                </a>
            </div>
            <div class="tn-wrapper">
                <dl>
                    <dt>
                        <a href="/strategy/detail?id=${c.id}">${c.title!}</a>
                    </dt>
                    <dd>
                        <#if c.summary?length lt 50>
                            ${c.summary!}
                        <#else>
                            ${(c.summary[0..50])!}...
                        </#if>
                    </dd>
                </dl>
                <div class="tn-extra">
                    <span>${c.provinceName!0} ${c.destName!0}</span>
                    <span>浏览（${c.viewnum!0}）</span>
                    <span>${(c.createTime?string('yyyy-MM-dd'))!}</span>
                </div>
            </div>
        </div>
    </#list>
    <div style="float: right">
        <div style="float: left;" ><span style="line-height:30px"> 共${page.totalPages!}页 / ${page.totalElements}条&nbsp;&nbsp;&nbsp;</span></div>
        <div id="pagination" class="jq-pagination" style="display: inline;"></div>
    </div>
    <script>
        $("#pagination").jqPaginator({
            totalPages: ${page.totalPages!0},
            visiblePages: 5,
            currentPage: ${page.number+1}||1,
                prev: '<a class="prev" href="javascript:void(0);">上一页<\/a>',
                next: '<a class="next" href="javascript:void(0);">下一页<\/a>',
                page: '<a href="javascript:void(0);">{{page}}<\/a>',
                last: '<a class="last" href="javascript:void(0);" >尾页<\/a>',
                onPageChange: function(page, type) {
                    if(type == 'change'){
                        $("#currentPage").val(page);
                        $("#searchForm").submit();
                    }

                 }
        })
    </script>
</div>

