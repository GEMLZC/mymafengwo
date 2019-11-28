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
            $("#searchType").val($(".nav-list a[class='on _j_search_link']").data("index"));
            $("#currentPage").val(page);
            $("#kwSearchForm").submit();
        }

    }
    })
</script>