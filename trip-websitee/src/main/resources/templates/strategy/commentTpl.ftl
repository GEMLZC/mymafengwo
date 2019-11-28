<h2>评论（<span class="_comment_num">${page.totalElements!0}</span>）</h2>
<ul id="comments" data-page="1" data-id="0">
<#list page.content as c>
    <li class="clearfix comment_item item_997306">
        <div class="img"><img
                src="${c.headUrl!}">
        </div>
        <div class="info">
            <h3>${c.username!}</h3>
            <h4>${c.createTime?string('yyyy-MM-dd HH:mm')}</h4>
            <div class="com-cont">${c.content!}</div>
            <div class="rep-del hide" style="display: none;">
                <i></i>
                <a role="button" class="reply-report">举报
                </a>
                <i></i>
                <a href="javascript:;" class="btn-comment-like _j_like_comment_btn
                     ${c.thumbuplist?seq_contains((userInfo.id)!-1)?string("liked", "like")}
                " data-toid="${c.id}" data-fromid="${(userInfo.id)!-1}">
                    <span class="_j_comment_like_num">${c.thumbupnum!}</span>
                </a>
            </div>
        </div>
    </li>
</#list>
    <div style="float: right">
        <div style="float: left;" ><span style="line-height:30px"> 共${page.totalPages!}页 / ${page.totalElements}条&nbsp;&nbsp;&nbsp;</span></div>
        <div id="pagination" class="jq-pagination" style="display: inline;"></div>
    </div>
    <script>
        $("#pagination").jqPaginator({
            totalPages: ${page.totalPages!1},
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
<script>
    $('.info').on("mouseout", function () {
        $(this).find(".rep-del").css("display", "none");
    }).on("mouseover", function () {
        $(this).find(".rep-del").css("display", "block");
    })

    //点赞
    $("._j_like_comment_btn").click(function () {
        var _this = $(this);

        var toid = $(this).data("toid");
        var fromid = $(this).data("fromid");
        $.get("/strategy/commentThumbUp", {toId:toid, fromId:fromid}, function (data) {
            $("#searchForm").submit();
        })
    })
</script>
</ul>