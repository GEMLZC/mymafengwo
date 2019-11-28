<div class="bd">
    <ul class="scenic-list clearfix">
    <#list pageInfo.list as list>
    <div>
        <li>
            <a href="/view/detail?id=${(list.id)!}" target="_blank" title="红专厂创意园">
                <div class="img"><img
                        src="${(list.imgUrls[0])!}"
                        width="192" height="130"></div>
                <h3>${(list.name)!}</h3>
            </a>
        </li>
    </div>
    </#list>
        <input type="hidden" id="currentPage" name="currentPage" value="${qo.currentPage}"
        <div style="float: inherit;">
            <div style="float: left;" ><span style="line-height:30px"> 共${pageInfo.pages}页 / ${pageInfo.total}条&nbsp;&nbsp;&nbsp;</span></div>
            <div id="pagination" class="jq-pagination" style="display: inline;"></div>
        </div>
    </ul>
</div>

<script>
    $("#pagination").jqPaginator({
                totalPages: ${pageInfo.pages}||1,
            visiblePages: 5,
            currentPage: ${pageInfo.pageNum}||1,
            prev: '<a class="prev" href="javascript:void(0);">上一页<\/a>',
            next: '<a class="next" href="javascript:void(0);">下一页<\/a>',
            page: '<a href="javascript:void(0);">{{page}}<\/a>',
            last: '<a class="last" href="javascript:void(0);" >尾页<\/a>',
            onPageChange: function(page, type) {
        if(type == 'change'){
            var tagId = $('.tagId.on').data("tagid");
            $("#currentPage").val(page);
            $("#searchForm").ajaxSubmit({
                beforeSubmit: function (arr) {
                    arr.push({name: "tagId", value: tagId});
                },
                success:function (data) {
                    $('#allViewsByTag').html(data);
                }
            })
        }

    }
    })
</script>
<script>
    //根据标签id查询地点
    $(function () {
        $('.tagId').click(function () {
            $('.tagId').removeClass("on");
            $(this).addClass("on");
            var tagId = $(this).data("tagid");
            $('#searchForm').ajaxSubmit({
                beforeSubmit: function (arr) {
                    arr.push({name: "tagId", value: tagId});
                },
                success:function (data) {
                    $('#allViewsByTag').html(data);
                }
            })
        })
    })
</script>