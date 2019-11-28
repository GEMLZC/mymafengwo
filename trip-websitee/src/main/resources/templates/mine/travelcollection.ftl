<!DOCTYPE html>
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title></title>
    <link href="/styles/base.css" rel="stylesheet" type="text/css">
    <link href="/styles/travelcollection.css" rel="stylesheet" type="text/css">
    <script type="text/javascript" src="/js/jquery.js"></script>
    <script type="text/javascript" src="/js/travelcollection.js"></script>
    <script type="text/javascript" src="/js/common.js"></script>
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
                                    src="http://b2-q.mafengwo.net/s12/M00/35/B7/wKgED1uqIs-AMYTwAAAX-VIKIo0071.png?imageMogr2%2Fthumbnail%2F%2132x32r%2Fgravity%2FCenter%2Fcrop%2F%2132x32%2Fquality%2F90"
                                    width="32" height="32" align="absmiddle"><b></b></a></span>
                        <div class="uSet c">
                            <div class="asset">
                                <a class="coin" href="javascript:;" target="_blank" rel="nofollow">蜂蜜 0</a>
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
                        <span class="MAvaName">${(user.nickname)!}</span>
                        <span class="MAvaLevel">${('LV.'+user.level)!}</span>
                    </div>
                </div>
                <ul class="flt2">
                    <li><a class="tags_link" href="/mine/home" title="我的窝">我的窝</a></li>
                    <li><a class="tags_link" href="/mine/mytravelnotes" title="我的游记">我的游记</a></li>
                    <li><a class="tags_link" href="/mine/review" title="我的点评">我的点评</a></li>
                    <li class="on" id="_j_pathnav"><a class="tags_link" href="/mine/travelcollection" title="我的收藏">我的收藏</a></li>
                    <li><a class="tags_link" href="javascript:;" title="我的订单">我的订单</a></li>
                    <li><a class="tags_link" href="/mine/setting" title="设置">设置</a></li>
                </ul>
            </div>
        </div>
    </div>

</div>
<div class="wrapper">
    <div class="home-extra">
        <div class="s_title">
            <ul>
                <li class="s_curr"><a href="javascript:;" id="collectplace">地点收藏</a></li>
                <li><a href="javascript:;" id="travelplace">游记收藏</a></li>
                <li><a href="javascript:;" id="strategyplace">攻略收藏</a></li>
                <li><a href="javascript:;" id="agencyplace">旅行社收藏</a></li>
            </ul>
        </div>
    <#--地点收藏-->

        <div class="p-country">
            <#if viewandhotels ??>
                <#list viewandhotels as vm>

            <div class="p-hd">
                ${(vm.view.dest.name)}
            </div>
            <div class="p-item">
                <div class="p-item-main clearfix">
                    <div class="p-toggle">
                        <a class="btn-toggle" href="javascript:void(0)" data-mddid="11047"><span>收起</span><i
                                class="arr-up"></i></a>
                    </div>

                    <div class="p-content">
                        <div class="img"><a href="javascript:;" target="_blank"><img
                                src="${(vm.view.imgUrls[0])!}"
                                width="140" height="90"></a></div>
                        <div class="p-title">
                            <a href="javascript:;" target="_blank"><strong>${(vm.view.name)!}</strong></a><span class="en">${(vm.view.engName)!}</span><span class="s-pull"><b>${(vm.view.visitnum)!}</b>人去过</span>
                        </div>
                        <p class="favtip">该目的地收藏了<em>${vm.hotels?size}</em>个POI</p>
                        <p class="summary">${(vm.view.info)!}</p>

                    </div>

                </div>
                <div class="p-item-poi">
                    <div class="p-nav clearfix">
                        <a class="on" href="javascript:void(0)"><i class="p-icon-hotel"></i>住宿<span>${vm.hotels?size}</span></a>
                    </div>
                    <ul class="p-poi clearfix">
                        <#list vm.hotels as h>
                        <li>
                            <a href="javascript:;" target="_blank">
                                <div class="img"><img
                                        src="${h.coverUrl}"
                                        width="162" height="100"></div>
                                <div class="info">
                                    <p class="title">${h.name}</p>
                                    <p><em>${h.commentnum}</em>条评论</p>
                                </div>
                            </a>
                        </li>
                        </#list>
                    </ul>
                </div>
            </div>

                </#list>
            </#if>
        </div>

    <#--游记收藏-->
        <div class="p-country favPost hide">
            <ul id="favlist">
                <form name="favorite" action="" method="post">
                        <#if travelList ??>
                            <#list travelList! as t>
                            <li class="post_item">
                                <a class="delPost hide" href="javascript:void(0)" data-id="6555539" data-type="0"
                                   title="删除"></a>
                                <div class="pic"><a href="javascript:;" target="_blank"><img width="195" height="140"
                                        src="${t.coverUrl!}"></a>
                                </div>
                                <dl class="clearfix">
                                    <dd>
                                        <h2><a href="javascript:;" target="_blank">${t.title!}</a></h2>
                                        <div class="count"><b></b><a href="javascript:void(0);">${t.viewnum!}
                                            /${t.favornum!}</a></div>
                                        <div class="author">
                                            <p class="authorA">
                                                <a href="javascript:;" target="_blank"><img width="20" height="20"
                                                        src="${(t.author.headImgUrl)!}"></a>作者：<a
                                                    href="javascript:;" target="_blank">${(t.author.nickname)!}</a>
                                            </p>

                                            <p class="authorB"><a href="javascript:;" target="_blank">
                                                <#if t.lastComment??>
                                                    <img width="20" height="20" src="${(t.lastComment.headUrl)!}"></a>回复：<a
                                                        href="javascript:;"
                                                        target="_blank">${(t.lastComment.username)!}</a> ${(t.lastComment.createTime?string('yyyy.MM.dd HH:mm:ss'))!}
                                                </#if>
                                            </p>

                                        </div>
                                        <div class="post_info">
                                            <p>${t.summary!}
                                            </p>
                                        </div>
                                    </dd>
                                </dl>
                            </li>
                            </#list>
                        </#if>
                <#--<li class="post_item">
                    <a class="delPost hide" href="javascript:void(0)" data-id="3294240" data-type="0"
                        title="删除"></a>
                    <div class="pic"><a href="javascript:;" target="_blank"><img
                                src="http://n2-q.mafengwo.net/s7/M00/9D/94/wKgB6lTNA8-AMrK2AAlg4GRUhKI23.jpeg?imageMogr2%2Fthumbnail%2F%21196x140r%2Fgravity%2FCenter%2Fcrop%2F%21196x140%2Fquality%2F90"></a>
                    </div>
                    <dl class="clearfix">
                        <dd>
                            <h2><a href="javascript:;" target="_blank">【I‘m Back! 肝裂之作，再战普吉, 以此纪</a></h2>
                            <div class="count"><b></b><a href="javascript:void(0);">965/269228</a></div>
                            <div class="author">
                                <p class="authorA">
                                    <a href="javascript:;" target="_blank"><img
                                            src="http://b2-q.mafengwo.net/s7/M00/03/C5/wKgB6lTHE0KAFzscAAB26z2HT-o32.jpeg?imageMogr2%2Fthumbnail%2F%2116x16r%2Fgravity%2FCenter%2Fcrop%2F%2116x16%2Fquality%2F90"></a>作者：<a
                                        href="javascript:;" target="_blank">馮花,</a>
                                </p>
                                <p class="authorB"><a href="javascript:;" target="_blank"><img
                                            src="http://b2-q.mafengwo.net/s7/M00/03/C5/wKgB6lTHE0KAFzscAAB26z2HT-o32.jpeg?imageMogr2%2Fthumbnail%2F%2116x16r%2Fgravity%2FCenter%2Fcrop%2F%2116x16%2Fquality%2F90"></a>回复：<a
                                        href="javascript:;" target="_blank">馮花.</a> 2015-02-11 02:08:51</p>
                            </div>
                            <div class="post_info">
                                <p> 2015.3.1
                                    我的第一篇，梦寐以求的蜂首终于来了！在此非常感谢蚂蜂窝对此篇游记的肯定！！！收到通知的时候我真的非常激动。游记前前后后写了好几天，希望走过路过的蜂友们，动动鼠标点个顶，我也就心满意足了
                                    原本</p>
                            </div>
                        </dd>
                    </dl>
                </li>
                <li class="post_item">
                    <a class="delPost hide" href="javascript:void(0)" data-id="5470560" data-type="0"
                        title="删除"></a>
                    <div class="pic"><a href="javascript:;" target="_blank"><img
                                src="http://p2-q.mafengwo.net/s9/M00/9F/2F/wKgBs1cnHu6AGijEAAtY2zoulcE88.jpeg?imageMogr2%2Fthumbnail%2F%21196x140r%2Fgravity%2FCenter%2Fcrop%2F%21196x140%2Fquality%2F90"></a>
                    </div>
                    <dl class="clearfix">
                        <dd>
                            <h2><a href="javascript:;" target="_blank">【仙境中的难民】马来西亚九日纪行（吉隆坡</a></h2>
                            <div class="count"><b></b><a href="javascript:void(0);">20/2735</a></div>
                            <div class="author">
                                <p class="authorA">
                                    <a href="javascript:;" target="_blank"><img
                                            src="http://n1-q.mafengwo.net/s11/M00/8A/4B/wKgBEFpTi1-AR9yXAACHQudfnQw25.jpeg?imageMogr2%2Fthumbnail%2F%2116x16r%2Fgravity%2FCenter%2Fcrop%2F%2116x16%2Fquality%2F90"></a>作者：<a
                                        href="javascript:;" target="_blank">唐亮</a>
                                </p>
                                <p class="authorB"><a href="javascript:;" target="_blank"><img
                                            src="http://n4-q.mafengwo.net/s12/M00/D0/E3/wKgED1vL4wmAaDuaAACNfIw66k457.jpeg?imageMogr2%2Fthumbnail%2F%2116x16r%2Fgravity%2FCenter%2Fcrop%2F%2116x16%2Fquality%2F90"></a>回复：<a
                                        href="javascript:;" target="_blank">徐小芮</a> 2016-05-02 19:49:18</p>
                            </div>
                            <div class="post_info">
                                <p> 写在前头
                                    写在前头：在这蚂蜂窝里好多大神和大牛，我只是一名普通大学生，拍的照片或许不够美，毕竟不是专业的，用的也只是入门级的单反。写的文字也没有美感，理工男的文笔不太行。但是我会尽量把游记写详细点，写
                                </p>
                            </div>
                        </dd>
                    </dl>
                </li>-->
                </form>
            </ul>
        </div>
    <#--攻略收藏-->
        <div class="p-country post-list hide">
            <ul>
                    <#if strategyDetailList ??>
                        <#list strategyDetailList! as s>
                    <li class="post-item clearfix">
                        <div class="post-cover">
                            <a href="javascript:;" target="_blank">
                                <img class="lazy" width="215" height="135" alt="${s.title!}"
                                     src="${s.coverUrl!}"
                                     style="display: inline;"></a>
                        </div>

                        <h2 class="post-title yahei ">
                            <a href="javascript:;" class="title-link" target="_blank">${s.title!}</a>
                        </h2>
                        <div class="post-author">
                            <span class="author">
                                <a href="javascript:;" target="_blank" rel="nofollow"><img class="lazy" width="20" height="20"
                                                                                           src="${s.author.headImgUrl}"
                                                                                           style="display: inline;"></a>
                                作者：<a href="javascript:;" target="_blank" rel="nofollow">${s.author.nickname}</a>
                            </span>

                            <span class="last-comment">
                            <#if s.lastComment??>
                                <a href="javascript:;" target="_blank" rel="nofollow"><img width="20" height="20"
                                        src="${(s.lastComment.headUrl)!}"></a>
                                回复：<a href="javascript:;" target="_blank"
                                      rel="nofollow">${(s.lastComment.username)!}</a>
                                <span class="comment-date">${(s.lastComment.createTime?string('yyyy.MM.dd HH:mm:ss'))!}</span>
                            </#if>
                            </span>

                        </div>
                        <div class="post-content">
                            ${s.summary}
                        </div>
                        <span class="status"><i class="icon_view"></i>${s.viewnum}<i
                                class="icon_comment"></i>${s.replynum}</span>
                    </li>
                        </#list>
                    </#if>
            <#--<li class="post-item clearfix">
                <div class="post-cover">
                    <a href="javascript:;" target="_blank">
                        <img class="lazy" width="215" height="135" alt="带着母亲去三亚悠闲的自由行，高性价比的出行方式_游记"
                            src="http://b4-q.mafengwo.net/s13/M00/C5/47/wKgEaVzf-ymAcJFtAAahtY5521o75.jpeg?imageMogr2%2Fthumbnail%2F%21230x142r%2Fgravity%2FCenter%2Fcrop%2F%21230x142%2Fquality%2F90"
                            style="display: inline;"></a>
                </div>

                <h2 class="post-title yahei ">
                    <a href="javascript:;" class="title-link" target="_blank">带着母亲去三亚悠闲的自由行，高性价比的出行方式</a>
                </h2>
                <div class="post-author">
                    <span class="author">
                        <a href="javascript:;" target="_blank" rel="nofollow"><img class="lazy"
                                src="http://n2-q.mafengwo.net/s11/M00/8C/44/wKgBEFrd5bOAGGFYAAAY-AmpOe094.jpeg?imageMogr2%2Fthumbnail%2F%2116x16r%2Fgravity%2FCenter%2Fcrop%2F%2116x16%2Fquality%2F90"
                                style="display: inline;"></a>
                        作者：<a href="javascript:;" target="_blank" rel="nofollow">Serena</a>
                    </span>
                    <span class="last-comment">
                        <a href="javascript:;" target="_blank" rel="nofollow"><img
                                src="http://p3-q.mafengwo.net/s12/M00/35/CD/wKgED1uqIt-AG3w5AAAbM62rsh0384.png?imageMogr2%2Fthumbnail%2F%2116x16r%2Fgravity%2FCenter%2Fcrop%2F%2116x16%2Fquality%2F90"></a>
                        回复：<a href="javascript:;" target="_blank" rel="nofollow">马蜂窝用户</a>
                        <span class="comment-date">19-05-20 23:03</span>
                    </span>
                </div>
                <div class="post-content">
                    想去海边玩，坐飞机最方便快捷也不需要任何签证的非三亚莫属了。
                    此次行程适合仅需在海边享受，放松身心，体验五星级酒店环境和服务，只玩经典景点的玩法哦...
                </div>
                <span class="status"><i class="icon_view"></i>122<i class="icon_comment"></i>0</span>
            </li>-->
            </ul>
        </div>
    <#--旅行社收藏-->
        <div class="p-country hot-list hide">
            <#if travelAgencies ??>
                <#list travelAgencies! as ta>
            <div class="hot-about clearfix _j_hotel" data-id="${ta.id!}">
                <div class="flt1">
                    <a href="javascript:;" target="_blank" class="_j_search_link"><img
                            src="${ta.headimgUrl!}"
                            style="width:150px;height:90px;"></a>
                </div>
                <div class="ct-text">
                    <h3>
                        <a href="javascript:;" target="_blank" class="_j_search_link">${ta.nickname!}<span
                                class="sr-keyword">旅行社</span></a>
                    </h3>
                    <div class="seg-desc">
                        <p>${ta.site!}</p>
                    </div>
                </div>
            </div>
                </#list>
            </#if>
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