<link href="/js/plugins/jqPaginator/jqPagination.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="/js/plugins/jqPaginator/jq-paginator.min.js"></script>


<form action="/view/listComment" method="post" id="searchForm">
    <input type="hidden"  id="conditionId" value="${qo.conditionId!}">
    <input type="hidden" name="vid" id="vid" value="${viewId}" data-vid="${viewId}">
    <div class="rev-list">
        <ul>
        <#list pageInfo.list as cs>
            <li class="rev-item comment-item clearfix">
                <div class="user"><a class="avatar" href="/mine/home" target="_blank"><img
                        src="${(cs.user.headImgUrl)!}"
                        width="48" height="48"></a><span class="level">LV.${(cs.user.level)!}</span>
                </div>
                <a class="useful ${(cs.flag?string('on',''))!}" data-id="191407415"
                   data-cid="${(cs.id)!}" title="点赞">
                    <i></i><span class="useful-num">${(cs.thumbsupnum)!}</span>
                </a>
                <a class="name" href="/mine/home" target="_blank">${(cs.user.nickname)!}</a>
                <span class="s-star s-star${cs.starNum!}"></span>

                <div>
                ${(cs.content)!}
                </div>
                <br>

                <div class="rev-img">
                    <#list (cs.imgUrls)! as img>

                        <a href="#"><img src="${(img)!}"
                                         width="200" height="120"></a>
                    </#list>
                </div>

                <div class="info clearfix">
                    <a class="btn-comment _j_comment" title="添加评论"
                       data-touser="${(cs.user.nickname)!}">评论</a>
                    <span class="time">${(cs.creatTime?string('yyyy-MM-dd HH:mm'))!}</span>
                    <span class="from">
                                此条点评来自游记<a href="/i/12601474.html" target="_blank">《南国花城正月中 ——2019年春节广州记（含长...》</a>
                            </span>
                </div>

                <div class="comment add-reply ">
                    <ul class="more_reply_box">
                        <#list cs.commentBacks as cbs>




                            <li>
                                <#if cbs.type == 0>
                                    <a href="javascript:void(0);">
                                        <img src="${(cbs.headUrl)!}" width="16"
                                             height="16">${(cbs.username)!}
                                    </a>
                                    :${(cbs.content)!}
                                    <a class="_j_reply re_reply"
                                       data-toid="${(cbs.userId)!}"
                                       data-touser="${(cbs.username)!}"
                                       data-cbid='${cbs.id}'
                                       data-id="${cs.id}"
                                       title="添加回复">回复</a>
                                    <br><span
                                        class="time">${(cbs.creatTime?string('yyyy-MM-dd HH:mm'))!}</span>

                                <#else>

                                    <a href="javascript:void(0);">
                                        <img src="${(cbs.headUrl)!}" width="16"
                                             height="16">${(cbs.username)!}
                                    </a>
                                    回复${(cbs.refComment.username)!}
                                    :${(cbs.refComment.content)!}
                                    <a class="_j_reply re_reply"
                                       data-toid="${(cbs.userId)!}"
                                       data-touser="${(cbs.username)!}"
                                       data-cbid="${cbs.id}"
                                       data-id="${cs.id}"
                                       title="添加回复">回复</a>
                                    <br><span
                                        class="time">${(cbs.creatTime?string('yyyy-MM-dd HH:mm'))!}</span>
                                </#if>
                            </li>
                        </#list>
                    </ul>


                </div>


                <div id="comment_list${cs.id!}">

                </div>
                <dd>
                    <div class="add-comment hide reply-form">

                        <form action="/view/commentBack" method="post" id="commentForm${cs.id}">
                            <input type="hidden" name="commentId" value="${cs.id!}">
                            <input type="hidden" name="type" value="0" id="commentType${cs.id!}">
                            <input type="hidden" name="refComment.id" id="refCommentId${cs.id!}">
                            <input type="hidden" name="floor" value="0" id="floor${cs.id!}" }">


                            <textarea class="_j_replyarea" cols="30" rows="10"
                                      id="commentContent${cs.id!}"
                                      placeholder=""></textarea>
                            <span id="reply_submit">
                                                <a class="btn btn_submit_reply" id="reply_submit"
                                                   data-id="${cs.id}">回复</a>
                                                </span>
                        </form>
                    </div>

                </dd>
            </li>
        </#list>

        </ul>
    </div>
    <input type="hidden" name="currentPage" id="currentPage" value="${qo.currentPage}">
</form>

<div style="float: right">
    <div style="float: left;" ><span style="line-height:30px"> 共${pageInfo.pages}页 / ${pageInfo.total}条&nbsp;&nbsp;&nbsp;</span></div>
    <div id="pagination" class="jq-pagination" style="display: inline;"></div>
</div>


<script>
    $(function(){

        var tmp = $("#commentForm input[name='floor']");
        var index = tmp.val();
        //回复
        $(".rev-list").on("click", ".re_reply", function () {
            var id = $(this).data("id");
            var touser = $(this).data("touser");
            var toid = $(this).data("toid");
            var cbid = $(this).data("cbid");
            console.log(cbid);
            console.log(toid);
            console.log(touser);


            $("#commentContent" + id).focus();
            $("#commentContent" + id).attr("placeholder", "回复：" + touser);

            $("#commentType" + id).val(1);
            $("#refCommentId" + id).val(cbid);
        })

        //发表回复
        $(".btn_submit_reply").click(function () {
            var id = $(this).data("id");
            console.log("add");
            if (!($("#commentContent" + id).val())) {
                popup("评论不能为空");
                return;
            }

            $("#commentForm" + id).ajaxSubmit({

                beforeSubmit: function (arr) {
                    arr.push({name: "content", value: $('#commentContent' + id).val()});

                },
                success: function (data) {
                    $("#commentContent" + id).val("");
                    $("#commentType" + id).val(0);
                    $("#refCommentId" + id).val("");
                    $("#commentContent" + id).attr("placeholder", "");
                    $("#comment_list" + id).append(data);
                    tmp.val(++index);
                }
            });

        });

    })





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
            var cid = $('#conditionId').val();
            $("#searchForm").ajaxSubmit({
                beforeSubmit: function (arr) {
                    arr.push({name: "conditionId", value: cid});
                    arr.push({name:"currentPage",value:page});
                },
                success:function (data) {
                    $('._j_commentlist').html(data);
                }
            })
        }

    }
    })
</script>