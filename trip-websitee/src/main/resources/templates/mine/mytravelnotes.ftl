<!DOCTYPE html>
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title></title>
    <link href="/styles/base.css" rel="stylesheet" type="text/css">
    <link href="/styles/mytravelnotes.css" rel="stylesheet" type="text/css">
    <script type="text/javascript" src="/js/jquery.js"></script>
    <script type="text/javascript" src="/js/common.js"></script>
<#--分页插件样式-->
    <link href="/js/plugins/jqPaginator/jqPagination.css" rel="stylesheet" type="text/css">
    <script type="text/javascript" src="/js/plugins/jqPaginator/jq-paginator.min.js"></script>
    <script>
        $(function () {
            //点赞功能
            /*$("._j_support_btn").click(function(){
                var that = $(this);
                var tid=that.data("tid");
                console.log(tid);
                $.get("/mine/top",{travelId:tid},function (data) {
                    /!*console.log("data:"+data);
                    console.log("success:"+data.success);
                    console.log("thumbsupnum"+data.data.thumbsupnum);*!/
                    if(data.success){
                        $(".support_num").html(data.data);
                        popup("点赞成功"); //
                    }else{
                        if(data.code == 102){
                            popup(data.msg);
                        }else{
                            popup("今天已顶过"); //
                        }
                    }
                })
            });*/

        });
    </script>

</head>

<body style="position: relative;">
<div class="topBar">
    <div class="topBarC">
        <div class="logo"><a title="马蜂窝自由行" href="/">马蜂窝自由行</a></div>
        <div class="t_nav">
            <ul id="pnl_nav" data-cs-t="headnav_wo">
                <li data-cs-p="index">
                    <strong class="t"><a href="/">首页</a></strong>
                </li>
                <li data-cs-t="wenda" data-cs-p="wenda">
                    <strong class="t"><a data-cs-p="from_wo_nav" href="/community/wenDaList">问答</a></strong>
                </li>
                <li data-cs-t="things" data-cs-p="things">
                    <strong class="t"><a data-cs-p="from_wo_nav" href="javascript:;">马蜂窝周边</a></strong>
                </li>
                <li data-cs-p="together">
                    <strong class="t"><a href="javascript:;">结伴</a></strong>
                </li>
                <li data-cs-p="group">
                    <strong class="t"><a href="javascript:;">小组</a></strong>
                </li>
                <li data-cs-p="mall">
                    <strong class="t"><a href="javascript:;">蜂首俱乐部</a></strong>
                </li>
                <li class="drop" data-cs-p="other">
                    <strong class="t"><a href="javascript:;">更多<b></b></a></strong>
                </li>
            </ul>
        </div>
        <div class="t_search">
            <form method="GET" action="/search/s.php" name="search">
                <input type="text" class="key" value="" name="q" id="word">
                <input type="submit" value="" class="btn">
            </form>
        </div>

        <div class="t_info">
            <div class="pagelet-block">
                <ul class="user_info">
                    <li class="daka">
                            <span class="daka_btn" id="_j_dakabtn" data-japp="daka">
                                <a role="button" title="打卡" class="daka_before">打卡</a>
                                <a role="button" title="打卡推荐" class="daka_after">打卡推荐</a>
                            </span>
                    </li>
                    <li id="pnl_user_msg" data-hoverclass="on" class="msg _j_hoverclass">
                            <span id="oldmsg" class="oldmsg"><a href="javascript:;"
                                                                class="infoItem">消息<b></b></a></span>
                        <ul id="head-msg-box" class="drop-bd">
                            <li><a href="javascript:;" rel="nofollow">私信</a></li>
                            <li><a href="javascript:;" rel="nofollow">小组消息</a></li>
                            <li><a href="javascript:;" rel="nofollow">系统通知</a></li>
                            <li><a href="javascript:;" rel="nofollow">问答消息</a></li>
                            <li><a href="javascript:;" rel="nofollow">回复消息</a></li>
                            <li><a href="javascript:;" rel="nofollow">喜欢与收藏</a></li>
                            <li><a href="javascript:;" rel="nofollow">好友动态</a></li>
                        </ul>
                    </li>
                    <li class="ub-item ub-new-msg" id="head-new-msg">
                    </li>
                    <li class="account _j_hoverclass" data-hoverclass="on" id="pnl_user_set">
                            <span class="t"><a class="infoItem" href="javascript:;"><img
                                    src=${user.headImgUrl!}
                                            width="32" height="32" align="absmiddle"><b></b></a></span>
                        <div class="uSet c">
                            <div class="asset">
                                <a class="coin" href="javascript:;" target="_blank" rel="nofollow">${user.honey}</a>
                                /
                                <a class="coin" href="javascript:;" target="_blank" id="head-my-honey"
                                   rel="nofollow" data-cs-p="coin">金币 579</a>
                            </div>
                            <a href="javascript:;">我的马蜂窝<b class="tb-level">LV.3</b></a>
                            <a href="javascript:;" target="_blank">写游记</a>
                            <a href="javascript:;" target="_blank">预约游记</a>
                            <a href="javascript:;" target="_blank">我的足迹</a>
                            <a href="javascript:;" target="_blank">我的问答</a>
                            <a href="javascript:;" target="_blank">我的好友</a>
                            <a href="javascript:;" target="_blank">我的收藏</a>
                            <a href="javascript:;" target="_blank">我的路线</a>
                            <a href="javascript:;" target="_blank">我的订单</a>
                            <a href="javascript:;" target="_blank">我的优惠券</a>
                            <a href="javascript:;" target="_blank">设置</a>
                            <a href="javascript:;">退出</a>
                        </div>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</div>
<div class="main">
    <div class="banner">
        <div class="banner_img banner_note" id="_j_banner">
        </div>
        <div class="tags_bar second_tags_bar">
            <div class="center clearfix">
                <div class="MAvatar clearfix">
                    <div class="MAvaImg flt1">
                        <img width="120" height="120" alt=""
                             src=${user.headImgUrl!}>
                    </div>
                    <div class="MAvaEasyWord flt1">
                        <span class="MAvaName">${user.nickname}</span>
                        <span class="MAvaLevel">Lv.${user.level}</span>
                    </div>
                </div>
                <ul class="flt2">
                    <li><a class="tags_link" href="/mine/home" title="我的窝">我的窝</a></li>
                    <li class="on"><a class="tags_link" href="/mine/mytravelnotes" title="我的游记">我的游记</a></li>
                    <li><a class="tags_link" href="/mine/review" title="我的点评">我的点评</a></li>
                    <li id="_j_pathnav"><a class="tags_link" href="/mine/travelcollection" title="我的收藏">我的收藏</a></li>
                    <li><a class="tags_link" href="javascript:;" title="我的订单">我的订单</a></li>
                    <li><a class="tags_link" href="/mine/setting" title="设置">设置</a></li>
                </ul>
            </div>
        </div>
    </div>
    <div class="center clearfix">
        <div class="side_bar note_side flt1">
            <div class="MUsers">
                <div class="MUsersTitle">最新访客</div>
                <div class="MUsersDetail">
                    <div class="MUsersAtom">
                        <ul class="clearfix">
                            <style>
                                li {
                                    float: left;
                                    padding-left: 5px;
                                }
                            </style>
                        <#list users! as v>
                            <li>
                                <a href="/mine/homes?userId=${v.id!}" target="_blank">
                                    <img src="${v.headImgUrl!}" height="48" width="48" >
                                </a>
                                <p><a href="/mine/homes?userId=${v.id!}" target="_blank" >${v.nickname!}</a></p>
                            </li>
                        </#list>

                        </ul>
                    </div>
                </div>
                <div class="MUsersBehavior">
                    <span>累计访问<i>${viewnum}</i></span><span>今日<i>${todaynum}</i></span>
                </div>
            </div>
        </div>
        <div class="content flt2">
            <div class="common_block my_notes">
                <div class="common_title clearfix">
                    <div class="MAvaMore clearfix">
                        <div class="MAvaNums">
                            <strong>${travelSize}</strong>
                            <p>游记</p>
                        </div>
                        <div class="MAvaNums">
                            <strong>${travelReplyNum}</strong>
                            <p>回复</p>
                        </div>
                        <di v class="MAvaNums last">
                            <strong>${travelViewNum}</strong>
                            <p>阅读</p>
                        </div>
                    </div>
                </div>

                <div id="article_list">
                    <form action="/mine/mytravelnotes" method="post" id="searchForm">
                        <input type="hidden" name="currentPage" id="currentPage" value="1">
                        <div class="notes_list">
                            <ul>
                            <#list pageInfo.list as t>
                                <li data-order="1" data-top="0">
                                    <dl>
                                        <dt>
                                            <a href="/travel/detail?id=${t.id!}" target="_blank"><img
                                                    src="${t.coverUrl!}"
                                                    height="400" width="680" alt="封面"></a>
                                        <div class="hover_item">
                                            <div class="thumb_description">
                                                <strong>${(t.dest.name)!}/</strong>
                                                <span>${(t.dest.parent.name)!}/</span>
                                            </div>
                                        </div>
                                        </dt>
                                        <dd>
                                            <div class="note_title clearfix">
                                                <div class="MDing">
                                                    <span id="topvote12894894"
                                                          class="support_num">${t.thumbsupnum}</span><a role="button"
                                                                                                        class="_j_support_btn"
                                                                                                        data-japp="articleding"
                                                                                                        rel="nofollow"
                                                                                                        data-iid="12894894"
                                                                                                        data-tid="${t.id!}"
                                                                                                        data-vote="0"
                                                                                                        title="顶一下">顶</a>
                                                </div>
                                                <div class="note_info">
                                                    <h3>
                                                        <a href="javascript:;" target="_blank"
                                                           title="${t.title}">${t.title}</a>
                                                    </h3>
                                                    <div class="note_more">

                                                            <span class="MInfoNum"><i
                                                                    class="MIcoView"></i><em>${t.viewnum}
                                                                /${t.replynum}</em></span>

                                                        <span class="MInfoNum"><i
                                                                class="MIcoStar"></i><em>${t.favornum}</em></span>
                                                        <span class="time">${(t.creatTime?string('yyyy-MM-dd HH:mm'))!}</span>
                                                    </div>

                                                </div>
                                            </div>
                                            <div class="note_word">
                                            ${t.summary!}
                                            </div>
                                        </dd>
                                    </dl>
                                </li>
                            </#list>
                            </ul>
                        </div>
                    </form>
                <#-- <div align="right" class="m-pagination _j_pager_content">
                     <span class="pg-current "">${qo.currentPage!}</span>
                 </div>-->
                <#include "../common/page.ftl">
                </div>
            </div>
        </div>
    </div>
</div>
<div id="footer">
    <div class="ft-content" style="width: 1105px">
        <div class="ft-info clearfix">
            <dl class="ft-info-col ft-info-intro">
                <dt>马蜂窝旅游网</dt>
                <dd>叩丁狼是一家专注于培养高级IT技术人才，为学员提供定制化IT职业规划方案及</dd>
                <dd>意见咨询服务的教育科技公司，为您提供海量优质课程，以及创新的线上线下学</dd>
                <dd>习体验，帮助您获得全新的个人发展和能力提升。</dd>
            </dl>
            <dl class="ft-info-col ft-info-qrcode">
                <dd>
                    <span class="ft-qrcode-tejia"></span>
                </dd>
                <dd>
                    <span class="ft-qrcode-weixin"></span>
                </dd>
                <dd>
                        <span class="ft-qrcode-weixin"
                              style="background-image: url('https://p3-q.mafengwo.net/s10/M00/48/A9/wKgBZ1t_4sSAVJ6uAAAlzJ0PZgU881.png?imageMogr2%2Fthumbnail%2F%2194x90r%2Fgravity%2FCenter%2Fcrop%2F%2194x90%2Fquality%2F90')"></span>
                </dd>
            </dl>
            <dl class="ft-info-social">
                <dt>向崇尚自由的加勒比海盗致敬！</dt>
                <dd>
                    <a class="ft-social-weibo" target="_blank" href="javascript:;" rel="nofollow"><i
                            class="ft-social-icon"></i></a>
                    <a class="ft-social-qqt" target="_blank" href="javascript:;" rel="nofollow"><i
                            class="ft-social-icon"></i></a>
                    <a class="ft-social-qzone" target="_blank" href="javascript:;" rel="nofollow"><i
                            class="ft-social-icon"></i></a>
                </dd>
            </dl>
        </div>
        <div class="ft-links">
            <a target="_blank" href="http://china.makepolo.com/">马可波罗</a><a target="_blank"
                                                                            href="http://www.onlylady.com/">Onlylady女人志</a><a
                target="_blank"
                href="http://trip.elong.com/">艺龙旅游指南</a><a target="_blank" href="http://www.cncn.com">欣欣旅游网</a>
            <a target="_blank" href="http://www.8264.com/">户外运动</a><a target="_blank"
                                                                      href="http://www.yue365.com/">365音乐网</a><a
                target="_blank"
                href="http://ishare.iask.sina.com.cn/">爱问共享资料</a><a target="_blank"
                                                                    href="http://www.uzai.com/">旅游网</a>
            <a target="_blank" href="http://www.zongheng.com/">小说网</a>
            <a target="_blank" href="http://www.xuexila.com/">学习啦</a><a target="_blank"
                                                                        href="http://www.yododo.com">游多多自助游</a><a
                target="_blank" href="http://www.zhcpic.com/">问答</a><a
                target="_blank" href="http://huoche.mafengwo.cn/">火车时刻表</a>
            <a target="_blank" href="http://www.lvmama.com">驴妈妈旅游网</a>
            <a target="_blank" href="http://www.haodou.com/">好豆美食网</a><a target="_blank"
                                                                         href="http://www.taoche.com/">二手车</a><a
                target="_blank" href="http://www.lvye.cn">绿野户外</a><a
                target="_blank" href="http://www.tuniu.com/">途牛旅游网</a>
            <a target="_blank" href="http://www.mapbar.com/">图吧</a>
            <a target="_blank" href="http://www.chnsuv.com">SUV联合越野</a><a target="_blank"
                                                                          href="http://www.uc.cn/">手机浏览器</a><a
                target="_blank" href="http://sh.city8.com/">上海地图</a><a
                target="_blank" href="http://www.tianqi.com/">天气预报查询</a>
            <a target="_blank" href="http://www.ly.com/">同程旅游</a>
            <a target="_blank" href="http://www.tieyou.com/">火车票</a><a target="_blank"
                                                                       href="http://www.yunos.com/">YunOS</a><a
                target="_blank" href="http://you.ctrip.com/">携程旅游</a><a
                target="_blank" href="http://www.jinjiang.com">锦江旅游</a>
            <a target="_blank" href="http://www.huoche.net/">火车时刻表</a>
            <a target="_blank" href="http://www.tripadvisor.cn/">TripAdvisor</a><a target="_blank"
                                                                                   href="http://www.tianxun.com/">天巡网</a><a
                target="_blank" href="http://www.mayi.com/">短租房</a><a
                target="_blank" href="http://www.zuzuche.com">租租车</a>
            <a target="_blank" href="http://www.5fen.com/">五分旅游网</a>
            <a target="_blank" href="http://www.zhuna.cn/">酒店预订</a><a target="_blank"
                                                                      href="http://www.ailvxing.com">爱旅行网</a><a
                target="_blank"
                href="http://360.mafengwo.cn/all.php">旅游</a><a target="_blank"
                                                               href="http://vacations.ctrip.com/">旅游网</a>
            <a target="_blank" href="http://www.wed114.cn">wed114结婚网</a>
            <a target="_blank" href="http://www.chexun.com/">车讯网</a><a target="_blank"
                                                                       href="http://www.aoyou.com/">遨游旅游网</a><a
                target="_blank" href="http://www.91.com/">手机</a>
            <a href="javascript:;" target="_blank">更多友情链接&gt;&gt;</a>
        </div>
    </div>
</div>
<div class="mfw-toolbar" id="_j_mfwtoolbar" style="display: block;">
    <div class="toolbar-item-top" style="display: none;">
        <a role="button" class="btn _j_gotop">
            <i class="icon_top"></i>
            <em>返回顶部</em>
        </a>
    </div>
    <div class="toolbar-item-feedback">
        <a role="button" data-japp="feedback" class="btn">
            <i class="icon_feedback"></i>
            <em>意见反馈</em>
        </a>
    </div>
    <div class="toolbar-item-code">
        <a role="button" class="btn">
            <i class="icon_code"></i>
        </a>
        <a role="button" class="mfw-code _j_code">


                <img src="https://p1-q.mafengwo.net/s1/M00/6C/51/wKgIC1t_6TuASybrAADGUPUHjr021.jpeg?imageMogr2%2Fthumbnail%2F%21450x192r%2Fgravity%2FCenter%2Fcrop%2F%21450x192%2Fquality%2F90"
                    width="450" height="192">
            </a>
            <!--<div class="wx-official-pop"><img src="http://images.mafengwo.net/images/qrcode-weixin.gif"><i class="_j_closeqrcode"></i></div>-->
        </div>

    </div>
</body>

</html>