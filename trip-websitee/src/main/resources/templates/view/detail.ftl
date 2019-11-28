<!DOCTYPE html>
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title></title>
    <link href="/styles/base.css" rel="stylesheet" type="text/css">
    <link href="/styles/replyDetail.css" rel="stylesheet" type="text/css">
    <script type="text/javascript" src="/js/jquery/jquery.js"></script>

    <script type="text/javascript" src="/js/plugins/jquery-form/jquery.form.js"></script>
    <script type="text/javascript" src="/js/system/common.js"></script>
    <link href="/js/plugins/jqPaginator/jqPagination.css" rel="stylesheet" type="text/css">
    <script type="text/javascript" src="/js/plugins/jqPaginator/jq-paginator.min.js"></script>
    <script>
        $(function () {

            //去过-按钮
            $('.btn-been').click(function () {
                var viewId = $(this).data("vid");
                console.log("a");
                $.get("/view/addVisit", {viewId: viewId}, function (data) {
                    if (data.success) {
                        $(".row-top .btn-been .icon").removeClass("unvisit");
                        $(".row-top .btn-been .icon").addClass("visit");
                        popup("已添加到[我的足迹]!");
                    } else {
                        if (data.code == 102) {
                            popup(data.msg);
                        } else {
                            $(".row-top .btn-been .icon").removeClass("visit");
                            $(".row-top .btn-been .icon").addClass("unvisit");
                            popup("已从[我的足迹]移除!"); //
                        }
                    }
                })
            })

            //收藏按钮
            $('.btn-collect').click(function () {
                var viewId = $(this).data("vid");
                $.get("/view/favor", {viewId: viewId}, function (data) {

                    if (data.success) {
                        $(".row-top .icon").removeClass("unfavor");
                        $(".row-top .icon").addClass("favor");
                        popup("收藏成功"); //
                    } else {
                        if (data.code == 102) {
//                            $(".collect_icon").removeClass("on-i02")
                            popup(data.msg);
                        } else {
                            $(".row-top .icon").removeClass("favor");
                            $(".row-top .icon").addClass("unfavor");
                            popup("已取消收藏"); //
                        }
                    }

                })
            })

            //提交表单
            $('._j_submit').click(function () {
                $('#commentForm').ajaxSubmit(function (data) {
                    if (data.success) {
                        popup("发布成功");
                    } else {
                        popup(data.msg);
                    }
                })
            })


            //给点评点赞
            $('.useful').click(function () {
                var currentThis = $(this);
                var commentId = $(this).data('cid');
                $.get("/view/thumbsUpComment", {commentId: commentId}, function (data) {

                    if (data.success) {
                        //$(".useful-num").html(data.data);
                        console.log($(this));
                        currentThis.find(".useful-num").html(data.data);
                        currentThis.addClass("on");
                        popup("点赞成功!");
                    } else {
                        if (data.code == 102) {
                            currentThis.removeClass("on")
                            popup(data.msg);
                        } else {
                            currentThis.find(".useful-num").html(data.data);
                            currentThis.removeClass("on");
                            popup("已取消点赞"); //
                        }
                    }
                })
            });

            var img = "";

            //图片上传
            $('.add-place').click(function () {

//                console.log("sd");
                $('#imageFile').click();
            });


            //监听隐藏的图片上传控件的内容改变事件
            $('#imageFile').change(function () {


//                console.log("oo");
                $('#imageForm').ajaxSubmit(function (data) {
                    if (data.success) {

                        console.log(data);
                        img = img + data.data + ",";
                        $('.imgContent').append("<img src=" + data.data + " style=' margin-left: 10px; width: 120px; height: 120px;'></img>");
                        console.log(img);
                        $('#uploadImg').val(img);
                    } else {
                        popup(data.msg);
                    }

                });

            });


            //点评的高级查询

            var viewId = $('#viewId').data("id");

            $.get("/view/listComment", {vid: viewId,conditionId:-1}, function (data) {
                $('._j_commentlist').html(data);
            });


            //高级查询//查询条件放到外面 其他才放嵌套页面==需要改
            $('.commentSelector').click(function () {
                $('.commentSelector').removeClass("on");
                $(this).addClass("on");
                var conditionId = $(this).data("category");
                $('#searchForm').ajaxSubmit( {
                    beforeSubmit: function (arr) {
                        arr.push({name: "conditionId", value: conditionId});
                        arr.push({name:"vid",value:viewId});
                    },
                    success:function (data) {
                        $('._j_commentlist').html(data);
                    }
                })
            })

            //内部景点的分页
//            $.post("/view/innerView",{vid:viewId},function (data) {
//                $('#innerView').append(data);
//            })
//
//            $('.more-subpoi').click(function () {
//                //重复用可以抽取function xx(){}
//                $.post("/view/innerView",{vid:viewId,pagesize:pagesize+1},function (data) {
//                    $('#innerView').append(data);
//                })
//            })

        })
    </script>
</head>
<form method="post" action="/view/comment/imgUpload" enctype="multipart/form-data" id="imageForm" style="display: none">
    <input type="file" name="file" id="imageFile"/>
</form>

<body>

<#assign currentNav="destination">
<#include "../common/navbar.ftl">

<!----------------------------------------->

<br>
<br>
<div class="container" data-cs-t="景点详情页">


    <div class="row row-top">
        <div class="wrapper">
            <div class="extra">
                <!-- 天气 S-->
                <div class="weather" data-cs-p="天气">
                    <a href="/weather/10088.html" target="_blank">
                        <img src="http://images.mafengwo.net/images/mdd_weather/icon/icon34.png" width="25" height="25">
                        <span>中雨 27℃~34℃</span>
                    </a>
                </div>
                <!-- 天气 E-->
                <!-- 收藏去过 S-->
                <div class="action _j_rside want-been">
                    <div class="been-box">
                        <a class="_j_beenpoi btn-been _j_hovergo" href="javascript:void(0);" title="添加至我的足迹"
                           data-cs-p="足迹" data-vid="${(detail.id)!}">
                            <i class="icon"></i>
                            <span class="txt">去过</span>
                        </a>
                        <div class="rate-pop" style="display:none;">
                            <div class="rank-star">
                                <span class="s-star s-star0"></span>
                                <div class="click_star">
                                    <a title="1星" rel="nofollow" data-num="1"></a>
                                    <a title="2星" rel="nofollow" data-num="2"></a>
                                    <a title="3星" rel="nofollow" data-num="3"></a>
                                    <a title="4星" rel="nofollow" data-num="4"></a>
                                    <a title="5星" rel="nofollow" data-num="5"></a>
                                </div>
                            </div>
                            <span class="rank-hint">必去推荐</span>
                        </div>
                    </div>
                    <a class="_j_favpoi btn-collect " href="javascript:void(0);" title="添加收藏"
                       data-cs-p="收藏" data-vid="${(detail.id)!}">
                        <i class="icon"></i>
                        <span class="txt">收藏</span>
                    </a>
                </div>
                <!-- 收藏去过 E-->
            </div>
            <!-- 面包屑 S-->
            <div class="crumb" data-cs-p="面包屑">
                <div class="item"><a href="/mdd/" target="_blank">目的地</a><em>&gt;</em></div>
                <div class="item">
                    <div class="drop">
                        <span class="hd"><a href="/travel-scenic-spot/mafengwo/10088.html">广州<i></i></a></span>
                        <div class="bd">
                            <i class="arrow"><b></b></i>
                            <div class="col">
                                <ul class="clearfix">
                                    <li><a href="/jd/10088/gonglve.html" target="_blank">广州景点</a></li>
                                    <li><a href="/hotel/10088/" target="_blank">广州酒店</a></li>
                                    <li><a href="/cy/10088/gonglve.html" target="_blank">广州美食</a></li>
                                    <li><a href="/gw/10088/gonglve.html" target="_blank">广州购物</a></li>
                                    <li><a href="/yl/10088/gonglve.html" target="_blank">广州娱乐</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <em>&gt;</em>
                </div>
                <div class="item cur">广州景点</div>
            </div>
            <!-- 面包屑 E-->


            <!-- POI名称 S-->
            <div class="title">
                <h1>${(detail.name)!}</h1>
                <div class="en">${(detail.engName)!}</div>
            </div>
            <!-- POI名称 E-->

            <!-- 快捷导航 S-->
            <div style="height: 60px;">
                <div class="r-nav" id="poi-navbar" data-cs-p="快捷导航">
                    <ul class="clearfix">
                        <li data-scroll="overview" class="on">
                            <a title="概况" href="#headSummary">概况</a>
                        </li>
                        <li data-scroll="attractions" style="display: none">
                            <a title="景点亮点">景点亮点</a>
                        </li>
                        <li data-scroll="commentlist" href="#commentlist">
                            <a title="蜂蜂点评" href="#commentlist">蜂蜂点评<span>（${(detail.commentnum)!}条）</span></a>
                        </li>


                        <li data-scroll="comment" class="nav-right" href="#comment">
                            <a class="btn-reviews" href="#comment" title="我要点评">我要点评</a>
                        </li>
                    </ul>
                </div>
            </div>
            <!-- 快捷导航 E-->

        </div>
    </div>

    <script type="text/javascript">
        (function () {
            //面包屑
            $('.drop').hover(function () {
                var target = $(this);
                clearTimeout(target.data('hideTimer'));
                target.addClass('open');
                target.children('bd').fadeIn(200);
            }, function () {
                var target = $(this);
                target.data("hideTimer", setTimeout(function () {
                    target.removeClass('open');
                    target.children('bd').fadeOut(200);
                }, 100));
            });
            //导航
            var $navbar = $('#poi-navbar'),
                    offset_top,
                    $lis = $navbar.find("li").not('.nav-right');
            $('<div/>').insertBefore($navbar).append($navbar).height($navbar.outerHeight(true));
            $(function () {
                offset_top = $navbar.offset().top;
                $(window).bind('scroll.poinav', setFixed).trigger("scroll.poinav");
            });
            $(document).delegate("[data-scroll]", "click", function () {
                scrollTo($(this));
            });
            function setFixed() {
                var $rows = $('body >.container >[data-anchor]'),
                        scrolltop = $(document).scrollTop(),
                        h,
                        _lis = $lis.filter(":visible"),
                        currIndex;
                if (scrolltop > offset_top) {
                    if (!$navbar.hasClass('fixed')) {
                        $navbar.addClass('fixed');
                    }
                    h = $navbar.outerHeight(true);
                    for (var $li, $row, top, i = 0, j = _lis.length; i < j; i++) {
                        $row = $rows.filter("[data-anchor=" + ($li = _lis.eq(i)).attr("data-scroll") + "]");
                        if ($row[0] && (top = $row.offset().top) && ( /*i == (j - 1) ||*/
                                        ((top - h <= scrolltop) && (top + $row.outerHeight() - h > scrolltop)))) {
                            currIndex = i;
                            break;
                        }
                    }
                    if (i == j) {
                        _lis.removeClass("on");
                    } else {
                        _lis.eq(currIndex || 0).addClass("on").siblings().removeClass("on");
                    }
                } else {
                    if ($navbar.hasClass('fixed')) {
                        $navbar.removeClass('fixed');
                    }
                    _lis.eq(0).addClass("on").siblings().removeClass("on");
                }
            }
        })();
    </script>
    <div data-anchor="overview">
        <div class="row row-picture row-bg">
            <div class="wrapper">
                <a class="photo" data-cs-p="相册" href="/photo/poi/25091.html" target="_blank">
                    <div class="bd">
                        <div class="pic-big"><img
                                src="${(detail.imgUrls[0])!}"
                                width="690" height="370"></div>
                        <div class="pic-small"><img
                                src="${(detail.imgUrls[1])!}"
                                width="305" height="183"></div>
                        <div class="pic-small"><img
                                src="${(detail.imgUrls[2])!}"
                                width="305" height="183"></div>
                        <span>44319张图片</span></div>
                </a></div>
        </div>

        <!-- 简介 S -->
        <div class="mod mod-detail" data-cs-p="概况">
            <div class="summary">
            ${(detail.summary)!}
            </div>

            <ul class="baseinfo clearfix">
                <li class="tel">
                    <div class="label">电话</div>
                    <div class="content">${(detail.tel)!}</div>
                </li>
                <li class="item-site">
                    <div class="label">网址</div>
                    <div class="content"><a href="${(detail.link)!}" target="_blank" rel="nofollow">http://www.cantontower.com/</a>
                    </div>
                </li>
                <li class="item-time">
                    <div class="label">用时参考</div>
                    <div class="content">${(detail.takeTime)!}</div>
                </li>
            </ul>

            <div>
            ${(detail.viewContent.content)!}
            </div>

            <br>

            <div style="color:#999;font-size:12px;" data-cs-p="概况-感谢蜂蜂">
                *信息更新时间：${(detail.lastUpdateTime?string('yyyy-MM-dd HH:mm'))!}&nbsp;&nbsp;&nbsp;&nbsp;
                感谢蜂蜂 <a href="/u/79650791.html" target="_blank">一点点的爱</a>
                参与了编辑
            </div>
        </div>
        <!-- 简介 E -->

        <!-- 内部景点 S -->
        <div data-anchor="subPoilist">
            <div id="pagelet-block-bb456ee5b764682811223f9b8d30739e" class="pagelet-block"
                 data-api=":poi:pagelet:poiSubPoiApi" data-params="{&quot;poi_id&quot;:&quot;25091&quot;}"
                 data-async="1"
                 data-controller="/js/poi/ControllerPoiSubPoi">
                <div class="mod mod-innerScenic" data-cs-p="内部景点">
                    <div class="mhd">内部景点</div>
                    <div class="mbd" id="innerView">
                        <ul class="clearfix">
                        <#list detail.children as rfs>
                            <li>
                                <a href="/poi/5174512.html" target="_blank">
                                    <img src="${(rfs.imgUrls[0])!}"
                                         width="235" height="150">
                                    <span class="num num-top">${rfs_index+1}</span>
                                    <div class="info">
                                        <h3>${(rfs.name)!}</h3>
                                        <span><em>${(rfs.visitnum)!}</em>人去过</span>
                                    </div>
                                </a>
                            </li>
                        </#list>

                        </ul>
                    </div>
                    <div class="more more-subpoi">
                        <a class="btn-subpoi" data-page="1">查看更多</a>
                    </div>
                </div>
                <style>
                    .mod-innerScenic .more {
                        margin-top: 20px;
                        text-align: center;
                    }

                    .mod-innerScenic .more a {
                        display: inline-block;
                        width: 160px;
                        height: 50px;
                        background-color: #fff;
                        border: 1px solid #fc9c27;
                        line-height: 50px;
                        color: #ff9d00;
                        font-size: 14px;
                        border-radius: 4px;
                        text-align: center;
                    }

                    .mod-innerScenic .num {
                        width: 40px;
                    }
                </style>
            </div>
        </div>
        <!-- 内部景点 E -->

    </div>

    <!--评论-->
    <div data-anchor="commentlist" id="commentlist">
        <span style="display: none" data-id="${detail.id}" id="viewId"></span>

        <div id="pagelet-block-15f9d6d9ad9f6c363d2d27120e8a6198" class="pagelet-block"
             data-api=":poi:pagelet:poiCommentListApi" data-params="{&quot;poi_id&quot;:&quot;25091&quot;}"
             data-async="1"
             data-controller="/js/poi/ControllerPoiComment">
            <div class="mod mod-reviews" data-cs-p="评论列表">
                <div class="mhd mhd-large">蜂蜂点评<span>（共有<em>${(detail.commentnum)!}</em>条真实评价）</span></div>
                <div class="review-nav">
                    <ul class="clearfix">
                        <li data-type="0" data-category="-1" class="on commentSelector"><span class="divide"></span><a
                                href="javascript:void(0);"><span>全部</span></a></li>
                        <li data-type="0" data-category="1" class="commentSelector">
                            <span class="divide"></span>
                            <a href="javascript:void(0);"><span>有图</span><span class="num"> (1356条)</span></a>
                        </li>
                        <li data-type="1" data-category="2" class="commentSelector">
                            <span class="divide"></span>
                            <a href="javascript:void(0);">
                                <span>好评</span>
                                <span class="num">（4749条）</span>
                            </a>
                        </li>
                        <li data-type="1" data-category="3" class="commentSelector">
                            <span class="divide"></span>
                            <a href="javascript:void(0);">
                                <span>中评</span>
                                <span class="num">（750条）</span>
                            </a>
                        </li>
                        <li data-type="1" data-category="4" class="commentSelector">
                            <span class="divide"></span>
                            <a href="javascript:void(0);">
                                <span>差评</span>
                                <span class="num">（93条）</span>
                            </a>
                        </li>
                        <li data-type="0" data-category="5" class="commentSelector">
                            <span class="divide"></span>
                            <a href="javascript:void(0);"><span>金牌点评</span><span class="num"> (33条)</span></a>
                        </li>
                    </ul>
                </div>


                <div class="_j_commentlist">


                </div>

            </div>
        </div>


    </div>


    <div data-anchor="comment" id="comment">
        <div class="row row-reviewForm" id="comment_20190714202243" data-cs-p="点评">
            <div class="wrapper">

                <div class="mfw-reviews">
                    <div id="_j_commentform_cnt">
                        <h2>
                            <strong>${(detail.name)!}</strong>
                            <em>*</em>为必填选项
                        </h2>
                        <form action="/view/addComment" method="post" class="_j_commentdialogform" data-typeid="3"
                              id="commentForm" enctype="multipart/form-data">
                            <input type="hidden" name="act" value="updateComment">
                            <input type="hidden" name="commentid" value="">
                            <input type="hidden" name="poiid" value="25091">
                            <input type="hidden" name="source" value="2">
                            <input type="hidden" name="view.id" value="${(detail.id)!}">
                            <div class="review-item item-star">
                                <div class="label"><em>*</em>总体评价</div>
                                <div class="review-star _j_rankblock" data-star="" name="starNum">
                                    <input type="hidden" name="starNum" value="" essential="1" data-inputname="总体评价">
                                    <span class="_j_starcount star0"></span>
                                    <div class="click-star _j_starlist">
                                        <a role="button" title="千万别去" rel="nofollow"></a>
                                        <a role="button" title="不推荐" rel="nofollow"></a>
                                        <a role="button" title="一般般" rel="nofollow"></a>
                                        <a role="button" title="值得一去" rel="nofollow"></a>
                                        <a role="button" title="必须推荐" rel="nofollow"></a>
                                    </div>

                                </div>
                                <span class="txt-tips _j_startip">点击星星打分</span>
                            </div>
                            <div class="review-group">
                                <div class="review-item item-rating"
                                     data-conf="{&quot;type&quot;:&quot;select&quot;,&quot;notnull&quot;:&quot;1&quot;,&quot;name&quot;:&quot;\u98ce\u5149&quot;,&quot;conf&quot;:{&quot;options&quot;:[&quot;1&quot;,&quot;2&quot;,&quot;3&quot;,&quot;4&quot;,&quot;5&quot;]},&quot;show&quot;:{&quot;style&quot;:&quot;starRank&quot;}}">
                                    <div class="label"><em>*</em>风光</div>
                                    <div class="review-score _j_rankblock" data-star="" name="sceneNum">
                                        <input type="hidden" name="sceneNum" value="" essential="1"
                                               data-inputname="给风光的评分">
                                        <span class="_j_starcount star0"></span>
                                        <div class="click-star _j_starlist">
                                            <a role="button" title="特别差" rel="nofollow"></a>
                                            <a role="button" title="不太好" rel="nofollow"></a>
                                            <a role="button" title="一般般" rel="nofollow"></a>
                                            <a role="button" title="很棒" rel="nofollow"></a>
                                            <a role="button" title="超出预期" rel="nofollow"></a>
                                        </div>
                                    </div>
                                    <span class="txt-tips _j_startip">给风光打分</span>
                                </div>
                                <div class="review-item item-rating"
                                     data-conf="{&quot;type&quot;:&quot;select&quot;,&quot;notnull&quot;:&quot;1&quot;,&quot;name&quot;:&quot;\u7279\u8272&quot;,&quot;conf&quot;:{&quot;options&quot;:[&quot;1&quot;,&quot;2&quot;,&quot;3&quot;,&quot;4&quot;,&quot;5&quot;]},&quot;show&quot;:{&quot;style&quot;:&quot;starRank&quot;}}">
                                    <div class="label"><em>*</em>特色</div>
                                    <div class="review-score _j_rankblock" data-star="" name="specialNum">
                                        <input type="hidden" name="specialNum" value="" essential="1"
                                               data-inputname="给特色的评分">
                                        <span class="_j_starcount star0"></span>
                                        <div class="click-star _j_starlist">
                                            <a role="button" title="特别差" rel="nofollow"></a>
                                            <a role="button" title="不太好" rel="nofollow"></a>
                                            <a role="button" title="一般般" rel="nofollow"></a>
                                            <a role="button" title="很棒" rel="nofollow"></a>
                                            <a role="button" title="超出预期" rel="nofollow"></a>
                                        </div>

                                    </div>
                                    <span class="txt-tips _j_startip">给特色打分</span>
                                </div>
                                <div class="review-item item-rating"
                                     data-conf="{&quot;type&quot;:&quot;select&quot;,&quot;notnull&quot;:&quot;1&quot;,&quot;name&quot;:&quot;\u670d\u52a1&quot;,&quot;conf&quot;:{&quot;options&quot;:[&quot;1&quot;,&quot;2&quot;,&quot;3&quot;,&quot;4&quot;,&quot;5&quot;]},&quot;show&quot;:{&quot;style&quot;:&quot;starRank&quot;}}">
                                    <div class="label"><em>*</em>服务</div>
                                    <div class="review-score _j_rankblock" data-star="" name="serviceNum">
                                        <input type="hidden" name="serviceNum" value="" essential="1"
                                               data-inputname="给服务的评分">
                                        <span class="_j_starcount star0"></span>
                                        <div class="click-star _j_starlist">
                                            <a role="button" title="特别差" rel="nofollow"></a>
                                            <a role="button" title="不太好" rel="nofollow"></a>
                                            <a role="button" title="一般般" rel="nofollow"></a>
                                            <a role="button" title="很棒" rel="nofollow"></a>
                                            <a role="button" title="超出预期" rel="nofollow"></a>
                                        </div>

                                    </div>
                                    <span class="txt-tips _j_startip">给服务打分</span>
                                </div>
                            </div>
                            <div class="review-item item-comment">
                                <div class="label"><em>*</em>评价</div>
                                <div class="content">
                                <textarea class="_j_commentarea" name="content" essential="1" data-inputname="点评内容"
                                          placeholder="详细、客观、真实，130字以上为佳！上传图片会加分哦！" data-minlen="15"
                                          data-maxlen="1000"></textarea>
                                    <p class="_j_commentcounttip">15-1000个字</p>
                                </div>
                            </div>

                            <div class="review-item item-photo">
                                <div class="label">上传照片</div>
                                <div class="content imgContent">
                                    <dl class="upload-box _j_piclist">
                                        <dd data-commentid="" id="_j_addpicbtns" ids="0" style="position: relative;">
                                            <a class="add-place"><i></i></a>

                                            <div id="xx"
                                                 class="xx"
                                                 style="position: absolute; top: 0px; left: 0px; width: 120px; height: 120px; overflow: hidden; z-index: -1;">
                                                <input class="uploadImg" id="uploadImg"
                                                       style="font-size: 999px; opacity: 0; position: absolute; top: 0px; left: 0px; width: 100%; height: 100%;"
                                                       name="img"
                                                       multiple="" accept="image/jpeg,image/gif,image/png,.JPEG"
                                                >

                                            </div>


                                        </dd>
                                    </dl>
                                </div>
                            </div>
                            <div class="review-item item-action">
                                <a class="btn-large _j_submit" role="button" title="提交点评">提交点评</a>
                            </div>
                        </form>
                    </div>
                </div>
                <script type="text/javascript">

                    //星星滑动评分
                    $(function () {
                        $("._j_starlist a").mouseover(function () {
                            var index = $(this).index() + 1;
                            var text = $(this).attr("title");

                            $(this).closest("div").prev().addClass("star" + index);
                            $(this).closest("div").parent().next().html(text);
                        }).mouseout(function () {
                            var index = $(this).index() + 1;
                            var text = $(this).attr("title");
                            $(this).closest("div").prev().removeClass("star" + index);
                            $(this).closest("div").parent().next().html(text);

                            var x = $(this).closest("div").prev().prev().val();
                            if (x == index) {
                                $(this).closest("div").prev().addClass("star" + x);
                            }


                        }).click(function () {
                            var index = $(this).index() + 1;
                            var text = $(this).attr("title");
                            $(this).closest("div").prev().addClass("star" + index);
                            $(this).closest("div").parent().next().html(text);

                            $(this).closest("div").prev().prev().val(index);

                        })
                    })

                </script>


                <div class="mfw-reviews have-reviews" style="display: none">
                    <h2>
                        <strong>${(detail.name)!}</strong>
                    </h2>
                    <div class="review-item item-star">
                        <div class="label">你已评价为</div>
                        <div class="review-star">
                            <span class="star0"></span>
                        </div>
                        <a class="edit-reviews" data-commentid="" title="修改评论"><i></i>我要修改</a>
                    </div>
                </div>
            </div>
        </div>

    </div>


</div>


<!----------------------------------------->
<#include "../common/footer.ftl">
</body>

</html>