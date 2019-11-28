<div style="float: right">
    <div style="float: left;" ><span style="line-height:30px"> 共${pageInfo.pages}页 / ${pageInfo.total}条&nbsp;&nbsp;&nbsp;</span></div>
    <div id="pagination" class="jq-pagination" style="display: inline;"></div>
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
                    $("#currentPage").val(page);
                    $("#searchForm").submit();
                }

            }
    })
</script>