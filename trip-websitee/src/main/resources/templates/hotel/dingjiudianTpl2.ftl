<link href="/js/plugins/jqPaginator/jqPagination.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="/js/system/common.js"></script>
<script type="text/javascript" src="/js/plugins/jqPaginator/jq-paginator.min.js"></script>
<script>
    $(function () {
        var value = $("#num").data("value");
        $("#hotelNum").html(value);
        //收藏
        $(".btn-collect").on("click",function () {
            var id = $(this).data("id");
            console.log("dasga");
            $.get("/hotel/favor", {hotelId:id}, function (data) {
                console.log(data);
                if(data.success){
                    $("._j_del_fav"+id).removeAttr("style","display:none;");
                    $("._j_add_fav"+id).attr("style","display:none;");
                    popup("收藏成功");
                }else{
                    if(data.code == 102){
                        popup(data.msg);
                    }else{
                        $("._j_del_fav"+id).attr("style","display:none;");
                        $("._j_add_fav"+id).removeAttr("style","display:none;");
                        popup("已取消收藏");
                    }
                }
            });
        })
    })
</script>
<#list pageInfo.list as h>

<div class="hotel-item clearfix _j_hotel_item" data-id="9031088" data-is-merge_room="0"
     data-name="${h.name}" data-lat="25.042788" data-lng="121.50931" data-is-airbnb="0"
     data-cs-t="酒店list页点击入口分布">
    <div class="hotel-pic">
        <a  class="_j_hotel_info_link" target="_blank" href="${h.url}"
           data-cs-p="图片">
            <img src="${h.coverUrl}"
                 alt="" style="width: 330px;">
        </a>

    </div>
    <div class="hotel-title">
        <div class="title">
            <h3><a  class="_j_hotel_info_link" target="_blank" href="${h.url}"
                   title="${h.id}" data-cs-p="标题">${h.name}</a></h3>
            <br>
            <span>${h.english}</span>
        </div>
    </div>
    <span id="num" style="display: none" data-value="${hotelNum}"></span>
    <div class="hotel-info ">
        <ul class="nums clearfix">
            <li class="rating rating2">
                <em>${h.score}</em>分
            </li>
            <li><a  class="_j_hotel_info_link" target="_blank"><em>${h.commentnum}条</em><br>蜂蜂评价</a></li>
            <li class="split"></li>
            <li><a  class="_j_hotel_info_link" target="_blank"><em>${h.travelnum}篇</em><br>游记提及</a></li>
        </ul>
        <div class="info" style="font: 200">
            <p class="summary" title=${h.info}>${h.info}</p>
        </div>

        <div class="location">
                            <span><i class="icon-location"></i>详细地址: <a href="javascript:;" data-id="1762"
                                                                        data-type="area">${h.location}</a></span>
        </div>

    </div>
    <div class="hotel-btns">
        <a class="btn-booking _j_booking_btn" href="javascript:" rel="nofollow" style=""
           data-ota="ctrip"
           data-url=""
           data-price="626" data-is-cache-price="0" data-is-sold-out="0" data-pay-type="">
            <div class="ota">
                <div class="name">
                    <strong>骡窝窝</strong>


                </div>
                <p class="tips" style="display:none;"></p>
            </div>
            <div class="price _j_booking_price">
                <strong>￥</strong><strong>${h.price}</strong><strong
                    style="font-size: 12px;color: #666;padding-left: 2px;vertical-align: 1px;">起</strong>
                <i class="arrow"></i>
            </div>
            <div class="price _j_booking_sold_out${h.id}"  ${(h.hasRoom?string('style="display:none;"'','))!}">
                <span>已售罄</span>
            </div>

        </a>
    </div>
    <div class="hotel-other">
                          <div class="collect">
                                <a class="btn-collect btn-addCollect _j_add_fav${h.id}" href="javascript:;" data-id="${h.id}" data-type_id="2"
                                   data-cs-p="收藏" ${(h.favour?string('style="display:none;"',''))!}"


                                   ><i></i>
                              收藏
                              </a>
                                <a class="btn-collect btn-cancelCollect _j_del_fav${h.id}"  href="javascript:;"
                                   data-id="${h.id}" data-type_id="2"
                                    ${(h.favour?string('','style="display:none;"'))!}"><i></i>
                                    取消收藏
                                </a>
                            </div>
                        </div>
</div>
</#list>
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
            $("#queryForm").ajaxSubmit(function (data) {
                $("#_j_hotel_list").html(data);
            })
        }

    }
    })
</script>