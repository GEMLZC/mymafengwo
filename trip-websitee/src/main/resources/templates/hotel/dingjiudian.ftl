<html class=" hasFontSmoothing-true" xmlns="http://www.w3.org/1999/html">
<head>
    <#--<script type="text/javascript" async="" charset="utf-8"
            src="http://c.cnzz.com/core.php?web_id=30065558&amp;t=q"></script>
    <script type="text/javascript" async="" charset="utf-8"
            src="http://w.cnzz.com/c.php?id=30065558&amp;async=1"></script>-->
     <link href="/styles/base.css" rel="stylesheet" type="text/css">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
     <link href="/styles/dingjiudian.css" rel="stylesheet" type="text/css">
    <title>【酒店预订】台北酒店价格查询，台北酒店推荐 - 骡窝窝</title>
    <meta name="Description"
          content="骡窝窝酒店预订，为您搜索台北各区域酒店价格查询及预订信息。通过对酒店价格、位置、设施、品牌、星级及用户真实点评为你推荐高性价比酒店，在线预订酒店，价格优惠实时折扣.">
    <meta name="Keywords" content="台北酒店预订，台北酒店价格查询，台北酒店推荐">


    <script src="https://hm.baidu.com/hm.js?8288b2ed37e5bc9b4c9f7008798d2de0"></script>


    <link href="http://css.mafengwo.net/css/cv/css+base:css+jquery.suggest:css+plugins:css+plugins+jquery.jgrowl:css+other+popup:css+mfw-header.2015^YlVS^1559526017.css"
          rel="stylesheet" type="text/css">


    <script language="javascript"
            src="http://js.mafengwo.net/js/cv/js+jquery-1.8.1.min:js+global+json2:js+M+Module:js+M+M:js+M+Log:js+m.statistics:js+advert+inspector^alw^1563531411.js"
            type="text/javascript" crossorigin="anonymous"></script>
    <script type="text/javascript">
        var __mfw_uid = parseInt('32085284');
        function areaDetail(id){
            $("._j_area_name").removeClass("on");
            $("#_j_area_name"+id).addClass("on");
            $.get("/hotel/areaDeatil",{id:id},function (data) {
                $("#areaDeatil").html(data);
            })
            $("#area").val(id)
            $("#queryForm").ajaxSubmit(function (data) {
                $("#_j_hotel_list").html(data);
            })
        }
        function search() {
            $("#editForm").submit();
        }
        function getHotel() {
            $("#queryForm").ajaxSubmit(function (data) {
                $("#_j_hotel_list").html(data);
            })
        }
        function changeOrderBy(id) {
            $(".orderBy").removeClass("on");
            $("#orderby"+id).addClass("on");
            var orderBy = $("#orderby"+id).data("value");
            $("#orderBy").val(orderBy);
            $("#queryForm").ajaxSubmit(function (data) {
                $("#_j_hotel_list").html(data);
            })
        }
        $(function () {
            $("#queryForm").ajaxSubmit(function (data) {
                $("#_j_hotel_list").html(data);
            })
            $(".btn-sss").click(function () {
                $("#editForm").submit()
            })
        })
        function changeTag(id) {
            $(".tags").removeClass("on");
            $("#tag"+id).addClass("on");
            $("#hoteltag").val(id);
            $("#queryForm").ajaxSubmit(function (data) {
                $("#_j_hotel_list").html(data);
            })
        }
    </script>

    <script language="javascript"
            src="http://js.mafengwo.net/js/cv/js+common+jquery.plugins:js+common+widgets:js+mfw.storage^ZlI^1537192880.js"
            type="text/javascript" crossorigin="anonymous"></script>
    <link href="http://css.mafengwo.net/css/cv/css+hotel+new_hotel_v6.2:css+mdd+map-mark.v2:css+hotel+datepicker-range:css+hotel+number_guests_picker:css+mdd+hotel_fav:css+sales+m-toolbar:css+jquery-ui-1.9.1.custom.min^YlJS^1552035728.css"
          rel="stylesheet" type="text/css">

    <script async=""
            src="http://js.mafengwo.net/js/cv/js+Dropdown:js+pageletcommon+pageHeadUserInfoWWWNormal:js+jquery.tmpl:js+M+module+InputListener:js+M+module+SuggestionXHR:js+M+module+DropList:js+M+module+Suggestion:js+M+module+MesSearchEvent:js+SiteSearch:js+AHeader:js+jquery.jgrowl.min:js+hotel+mfwmap+mfwmap-util:js+hotel+mfwmap+mfwmap-event:js+hotel+mfwmap+mfwmap-runtime-google:js+hotel+mfwmap+mfwmap-runtime-amap:js+hotel+mfwmap+mfwmap-runtime-leaflet:js+hotel+mfwmap+mfwmap:js+hotel+mfwmap+mfwmap-overlays:js+hotel+module+ListTips:js+M+module+Storage:js+hotel+module+Log:js+hotel+module+Search:js+hotel+module+ModuleProvider:js+hotel+module+Captcha:js+hotel+module+Dialog:js+hotel+module+Hash:js+xdate:js+hotel+module+BookingDate:js+hotel+module+BookingGuests:js+hotel+list_mvc_model:js+corelib+handlebars-2.0.0:js+hotel+module+FestivalDateConfig:js+jquery-ui-core:js+jquery-ui-datepicker:js+hotel+module+DateRangePicker:js+hotel+module+NumberGuestsPicker:js+hotel+list_mvc_filter_view:js+jquery.scrollTo:js+M+module+dialog+Layer:js+M+module+dialog+DialogBase:js+M+module+dialog+Dialog:js+M+module+dialog+alert:js+hotel+module+FavDialog:js+hotel+list_mvc_data_view:js+hotel+list_v6:js+hotel+pc_app_guide:js+M+module+PageAdmin:js+M+module+Cookie:js+M+module+ResourceKeeper:js+AMessage:js+M+module+FrequencyVerifyControl:js+M+module+FrequencySystemVerify:js+ALogin:js+M+module+ScrollObserver:js+M+module+QRCode:js+AToolbar:js+ACnzzGaLog:js+ARecruit:js+ALazyLoad^YlFSRQ^1562127144.js"
            crossorigin="anonymous"></script>
    <link rel="stylesheet" href="http://css.mafengwo.net/css/plugins/leaflet/leaflet.css?1537192876">
    <script async="" src="http://js.mafengwo.net/js/plugins/leaflet.js?1537192880" crossorigin="anonymous"></script>
    <script async="" src="http://js.mafengwo.net/js/BrowserState.js?1542357400" crossorigin="anonymous"></script>
     <script src="/js/jquery/jquery-form/jquery.form.js" type="text/javascript"></script>
</head>
<body style="position: relative;">
<#assign currentNav="hotel">
<#include "../common/navbar.ftl">
<div class="wrapper">
    <div class="top-info clearfix">
        <div class="crumb">
            <span class="tit">您在这里：</span>
            <div class="item">
                <div class="drop">
                    <span class="hd"><a href="/hotel/hotel" target="_blank">酒店<i></i></a></span>
                </div>
                <em>&gt;</em>
            </div>
        <#list toast! as t>
            <div class="item">
                <div class="drop">
                    <span class="hd"><a href="javascript:;" target="_blank">${(t.name)!}酒店<i></i></a></span>
                    <div class="bd">
                        <i class="arrow"><b></b></i>
                        <div class="col">
                            <h3>热门地区</h3>
                            <ul class="clearfix">
                                <#list t.children as tc>
                                    <#if tc_index lt 5 >
                                        <li><a href="/destination/guide?id=${tc.id!}" target="_blank">${tc.name!}</a> </li>
                                    </#if>
                                </#list>
                            </ul>
                        </div>
                        <div class="more"><a href="/destination/guide?id=${t.id!}" target="_blank">&gt;&gt;更多地区</a></div>
                    </div>
                </div>
                <em>&gt;</em>
            </div>
        </#list>
            <div class="item">
                <div class="drop">
                    <span class="hd"><a href="/hotel/hotel" target="_blank">${dest.name!}酒店<i></i></a></span>
                </div>
            </div>
        </div>
        <div class="weather-wrapper">
            <link href="http://css.mafengwo.net/weather/littleWeather.css?1530619858" rel="stylesheet" type="text/css">
        </div>
    </div>
    <form class="form-hotel" action="/hotel/dingjiudian" method="get" id="editForm">
        <div class="hotel-searchbar clearfix">
            <div class="hs-item hs-item-search" id="_j_hotel_search">
                <input type="text" value="${destName!}" id="_j_search_input" autocomplete="off" name="destName" >
                <div class="hotel-suggest simsun" id="_j_search_suggest" style="display:none;"></div>
                <a class="hs-icon hs-icon-search" href="javascript:search();" id="_j_search_btn"></a>
            </div>
            <div class="hs-item hs-item-date-wrapper" id="_j_booking_date">
                <div class="hs-item hs-item-date" id="_j_check_in_date">
                    <span></span>
                    <input type="text" placeholder="入住日期" readonly="" id="dp1563708930698" class="hasDatepicker"
                           name="checkIn">
                    <i class="hs-icon hs-icon-date"></i>
                </div>
                <div class="hs-item hs-item-date" id="_j_check_out_date">
                    <span></span>
                    <input type="text" placeholder="离店日期" readonly="" id="dp1563708930699" class="hasDatepicker"
                           name="checkOut">
                    <i class="hs-icon hs-icon-date"></i>
                </div>
            </div>
            <div class="hs-item hs-item-people number-guests-picker" id="_j_booking_number_guests">
                <span></span>
                <i class="icon-person"></i>
                <div class="ngp-dropdown _j_ngp_dropdown" style="display:none;">
                    <div class="item _j_ngp_room_item">
                        <div class="row-guests clearfix _j_ngp_row_guests"><span class="label"></span>
                            <div class="ngp-select">
                                <div class="select-trigger _j_ngp_select_trigger"><span></span>
                                    <div class="caret"><i></i></div>
                                </div>
                                <ul style="display:none;">
                                    <li data-value="1">1</li>
                                    <li data-value="2">2</li>
                                    <li data-value="3">3</li>
                                    <li data-value="4">4</li>
                                    <li data-value="5">5</li>
                                    <li data-value="6">6</li>
                                    <li data-value="7">7</li>
                                </ul>
                            </div>
                            <div class="ngp-select">
                                <div class="select-trigger _j_ngp_select_trigger"><span>0 儿童</span>
                                    <div class="caret"><i></i></div>
                                </div>
                                <ul style="display:none;">
                                    <li data-value="0">0</li>
                                    <li data-value="1">1</li>
                                    <li data-value="2">2</li>
                                    <li data-value="3">3</li>
                                    <li data-value="4">4</li>
                                </ul>
                            </div>
                        </div>
                        <div class="row-children clearfix _j_ngp_row_children" style="display:none;"><span
                                class="label">儿童年龄</span>
                        </div>
                    </div>
                    <div class="item item-action clearfix _j_ngp_action_item"><span class="tips"></span><a
                            class="btn-action" href="javascript:;">确 认</a></div>
                </div>
            </div>
            <div class="hs-item hs-item-action btn-search" id="_j_price_btn">
                <a class="hs-btn" href="javascript:search();" class="btn-sss">查看价格</a>
            </div>
        </div>
    </form>
    <div class="area-main clearfix">
        <div class="area-wrapper" id="_j_area_wrapper" style="">
            <dl class="item-area clearfix _j_area_list">
                <dt>区域:</dt>
                <dd>
                    <ul class="area-nav clearfix restrictheight" style="height: 84px;">
                        <li><a href="/hotel/dingjiudian?destId=${dest.id!}" class="_j_area_name on" data-id="-1">全部</a></li>

                    <#list areas! as a>
                        <li>
                            <a id="_j_area_name${a.id!}" href="javascript:areaDetail(${a.id!});" class="_j_area_name" data-id="${a.id!}" >${a.name!}</a>
                        </li>
                    </#list>

                    </ul>
                    <a class="toggle" href="javascript:;" style=""
                       data-count="15"><i></i>展开共<#--${areas.length}-->个区域</a>
                </dd>
                <dt>周边:</dt>
                <dd>
                    <ul class="area-nav clearfix">
                    <#list destinations! as d>
                        <li>
                            <a href="/hotel/dingjiudian?destId=${d.id}" target="_blank">${d.name}</a>
                        </li>
                    </#list>
                    </ul>
                </dd>
            </dl>
            <div id="areaDeatil">
                <dl class="item-info clearfix _j_area_desc_list" style="height: 105px;">
                    <dt style="">攻略:</dt>
                    <dd data-id="${dest.id!}" >
                        <div>
                            <div>
                            ${dest.info!}
                            </div>
                        </div>
                    </dd>
                </dl>
                <dl class="item-price clearfix _j_area_price_list">
                    <dt data-id="" style="" class="anim-show">均价
                        <sup class="warn-mark">
                            <span class="warn-mark-icon"></span>
                            <span class="warn-tips">等级均价由平日价格计算得出，节假日价格会有上浮。<i></i></span>
                        </sup>:
                    </dt>
                    <dd data-id="${dest.id}" >
                        <ul class="clearfix">
                            <li><span class="hotel-rate rate3"></span>￥262</li>
                            <li><span class="hotel-rate rate4"></span>￥425</li>
                            <li><span class="hotel-rate rate4"></span>￥798</li>
                        </ul>
                    </dd>
                </dl>
            </div>
            </dl>
        </div>
        <div class="area-wrapper" id="_j_region_wrapper" style="display:none;">
            <dl class="item-info clearfix _j_region_desc_list">
                <dt style="">攻略:</dt>
                <dd data-id="-1" style="">
                    <div>
                    ${dest.info!}
                      <#--  <p>台湾最大城市，初見看似陈旧，三线城市的外表下有着一线城市的丰富内涵。</p>
                        <p>交通最便利的是台北车站及西门町，青年旅馆和平价商旅选择很多。</p>
                        <p>喜爱购物的可住在信义商圈及台北东区，这里还有很多时尚的夜店。</p>-->
                    </div>
                </dd>
            </dl>
        </div>
        <div class="area-maps" id="_j_map">
            <a class="map-link" href="/hotel/list_map?mddid=10819" target="_blank">通过地图查找酒店</a>
            <div class="map-container leaflet-container leaflet-fade-anim" tabindex="0" style="position: relative;">
                <div class="leaflet-map-pane" style="transform: translate3d(0px, 0px, 0px);">
                    <div class="leaflet-tile-pane">
                        <div class="leaflet-layer">
                            <div class="leaflet-tile-container"></div>
                            <div class="leaflet-tile-container leaflet-zoom-animated"><img
                                    class="leaflet-tile leaflet-tile-loaded"
                                    src="https://maps.google.cn/maps/vt/pb=!1m5!1m4!1i12!2i3430!3i1753!4i256!2m3!1e0!2sm!3i258145710!5m1!5f2!3m2!2szh-CN!3sCN"
                                    style="height: 256px; width: 256px; left: -119px; top: -44px;"><img
                                    class="leaflet-tile leaflet-tile-loaded"
                                    src="https://maps.google.cn/maps/vt/pb=!1m5!1m4!1i12!2i3431!3i1753!4i256!2m3!1e0!2sm!3i258145710!5m1!5f2!3m2!2szh-CN!3sCN"
                                    style="height: 256px; width: 256px; left: 137px; top: -44px;"><img
                                    class="leaflet-tile leaflet-tile-loaded"
                                    src="https://maps.google.cn/maps/vt/pb=!1m5!1m4!1i12!2i3430!3i1754!4i256!2m3!1e0!2sm!3i258145710!5m1!5f2!3m2!2szh-CN!3sCN"
                                    style="height: 256px; width: 256px; left: -119px; top: 212px;"><img
                                    class="leaflet-tile leaflet-tile-loaded"
                                    src="https://maps.google.cn/maps/vt/pb=!1m5!1m4!1i12!2i3431!3i1754!4i256!2m3!1e0!2sm!3i258145710!5m1!5f2!3m2!2szh-CN!3sCN"
                                    style="height: 256px; width: 256px; left: 137px; top: 212px;"></div>
                        </div>
                    </div>
                    <div class="leaflet-objects-pane">
                        <div class="leaflet-shadow-pane"></div>
                        <div class="leaflet-overlay-pane">
                            <svg class="leaflet-zoom-animated" width="354" height="229" viewBox="-7 -5 354 229"
                                 style="transform: translate3d(-7px, -5px, 0px);">
                                <g>
                                    <path stroke-linejoin="round" stroke-linecap="round" fill-rule="evenodd"
                                          stroke="#0a89e4" stroke-opacity="0.7" stroke-width="2" fill="#0a89e4"
                                          fill-opacity="0" class="leaflet-clickable"
                                          d="M5 56L4 65L0 74L14 77L16 80L17 88L25 90L24 103L51 108L94 108L93 100L90 93L90 87L85 87L73 83L74 81L68 74L64 64L47 63L26 57L14 58L6 56z"></path>
                                </g>
                                <g>
                                    <path stroke-linejoin="round" stroke-linecap="round" fill-rule="evenodd"
                                          stroke="#0a89e4" stroke-opacity="0.7" stroke-width="2" fill="#0a89e4"
                                          fill-opacity="0" class="leaflet-clickable"
                                          d="M0 74L-7 82L-7 118L-5 118L3 112L8 96L15 99L24 99L25 90L17 89L16 79L1 74z"></path>
                                </g>
                                <g>
                                    <path stroke-linejoin="round" stroke-linecap="round" fill-rule="evenodd"
                                          stroke="#0a89e4" stroke-opacity="0.7" stroke-width="2" fill="#0a89e4"
                                          fill-opacity="0" class="leaflet-clickable"
                                          d="M15 10L40 11L40 28L44 38L43 62L26 57L14 58L6 56L8 49L10 11L15 10z"></path>
                                </g>
                                <g>
                                    <path stroke-linejoin="round" stroke-linecap="round" fill-rule="evenodd"
                                          stroke="#0a89e4" stroke-opacity="0.7" stroke-width="2" fill="#0a89e4"
                                          fill-opacity="0" class="leaflet-clickable"
                                          d="M152 66L151 135L145 144L148 147L161 148L174 136L175 126L196 126L210 115L214 115L226 110L231 100L234 97L239 97L236 92L236 88L239 85L239 81L235 81L229 74L225 67L225 61L200 68L194 68L190 66L154 66z"></path>
                                </g>
                                <g>
                                    <path stroke-linejoin="round" stroke-linecap="round" fill-rule="evenodd"
                                          stroke="#0a89e4" stroke-opacity="0.7" stroke-width="2" fill="#0a89e4"
                                          fill-opacity="0" class="leaflet-clickable"
                                          d="M46 11L80 12L91 22L90 86L86 87L75 84L68 74L63 63L59 64L43 62L44 38L40 29L40 18L41 11L45 11z"></path>
                                </g>
                                <g>
                                    <path stroke-linejoin="round" stroke-linecap="round" fill-rule="evenodd"
                                          stroke="#0a89e4" stroke-opacity="0.7" stroke-width="2" fill="#0a89e4"
                                          fill-opacity="0" class="leaflet-clickable"
                                          d="M92 64L90 93L94 103L94 123L151 125L152 67L143 65L94 64z"></path>
                                </g>
                                <g>
                                    <path stroke-linejoin="round" stroke-linecap="round" fill-rule="evenodd"
                                          stroke="#0a89e4" stroke-opacity="0.7" stroke-width="2" fill="#0a89e4"
                                          fill-opacity="0" class="leaflet-clickable" d="M0 0"></path>
                                </g>
                                <g>
                                    <path stroke-linejoin="round" stroke-linecap="round" fill-rule="evenodd"
                                          stroke="#0a89e4" stroke-opacity="0.7" stroke-width="2" fill="#0a89e4"
                                          fill-opacity="0" class="leaflet-clickable"
                                          d="M111 129L110 150L119 152L120 162L123 165L149 140L151 135L151 126L149 125L111 124L111 128z"></path>
                                </g>
                                <g>
                                    <path stroke-linejoin="round" stroke-linecap="round" fill-rule="evenodd"
                                          stroke="#0a89e4" stroke-opacity="0.7" stroke-width="2" fill="#0a89e4"
                                          fill-opacity="0" class="leaflet-clickable" d="M0 0"></path>
                                </g>
                                <g>
                                    <path stroke-linejoin="round" stroke-linecap="round" fill-rule="evenodd"
                                          stroke="#0a89e4" stroke-opacity="0.7" stroke-width="2" fill="#0a89e4"
                                          fill-opacity="0" class="leaflet-clickable"
                                          d="M106 5L98 5L97 6L99 8L99 12L81 13L91 22L91 64L126 65L127 44L131 35L135 33L141 33L142 28L145 26L145 24L160 20L161 21L171 19L168 15L166 15L176 10L181 10L181 8L107 5z"></path>
                                </g>
                                <g>
                                    <path stroke-linejoin="round" stroke-linecap="round" fill-rule="evenodd"
                                          stroke="#0a89e4" stroke-opacity="0.7" stroke-width="2" fill="#0a89e4"
                                          fill-opacity="0" class="leaflet-clickable"
                                          d="M31 127L41 142L55 154L68 168L77 159L84 158L85 145L82 135L80 133L71 136L48 132L36 125L32 127z"></path>
                                </g>
                                <g>
                                    <path stroke-linejoin="round" stroke-linecap="round" fill-rule="evenodd"
                                          stroke="#0a89e4" stroke-opacity="0.7" stroke-width="2" fill="#0a89e4"
                                          fill-opacity="0" class="leaflet-clickable"
                                          d="M54 117L63 122L61 133L64 135L73 136L81 133L78 124L79 123L93 124L94 108L57 108L55 116z"></path>
                                </g>
                                <g>
                                    <path stroke-linejoin="round" stroke-linecap="round" fill-rule="evenodd"
                                          stroke="#0a89e4" stroke-opacity="0.7" stroke-width="2" fill="#0a89e4"
                                          fill-opacity="0" class="leaflet-clickable" d="M0 0"></path>
                                </g>
                            </svg>
                        </div>
                        <div class="leaflet-marker-pane">
                            <div class="map-mark mark-hotel  _j_map_overlay _j_hotel_marker"
                                 style="transform: translate3d(7.5px, 90.5px, 0px);"><span class="m-icon clickstat"
                                                                                           data-cs-p="酒店map标记"
                                                                                           data-cs-d="酒店map标记"></span>
                            </div>
                            <div class="map-mark mark-hotel  _j_map_overlay _j_hotel_marker"
                                 style="transform: translate3d(27.5px, 79.5px, 0px);"><span class="m-icon clickstat"
                                                                                            data-cs-p="酒店map标记"
                                                                                            data-cs-d="酒店map标记"></span>
                            </div>
                            <div class="map-mark mark-hotel  _j_map_overlay _j_hotel_marker"
                                 style="transform: translate3d(33.5px, 70.5px, 0px);"><span class="m-icon clickstat"
                                                                                            data-cs-p="酒店map标记"
                                                                                            data-cs-d="酒店map标记"></span>
                            </div>
                            <div class="map-mark mark-hotel  _j_map_overlay _j_hotel_marker"
                                 style="transform: translate3d(58.5px, -26.5px, 0px);"><span class="m-icon clickstat"
                                                                                             data-cs-p="酒店map标记"
                                                                                             data-cs-d="酒店map标记"></span>
                            </div>
                            <div class="map-mark mark-hotel  _j_map_overlay _j_hotel_marker"
                                 style="transform: translate3d(-8.5px, 85.5px, 0px);"><span class="m-icon clickstat"
                                                                                            data-cs-p="酒店map标记"
                                                                                            data-cs-d="酒店map标记"></span>
                            </div>
                            <div class="map-mark mark-hotel  _j_map_overlay _j_hotel_marker"
                                 style="transform: translate3d(22.5px, 80.5px, 0px);"><span class="m-icon clickstat"
                                                                                            data-cs-p="酒店map标记"
                                                                                            data-cs-d="酒店map标记"></span>
                            </div>
                            <div class="map-mark mark-hotel  _j_map_overlay _j_hotel_marker"
                                 style="transform: translate3d(189.5px, 102.5px, 0px);"><span class="m-icon clickstat"
                                                                                              data-cs-p="酒店map标记"
                                                                                              data-cs-d="酒店map标记"></span>
                            </div>
                            <div class="map-mark mark-hotel  _j_map_overlay _j_hotel_marker"
                                 style="transform: translate3d(24.5px, 66.5px, 0px);"><span class="m-icon clickstat"
                                                                                            data-cs-p="酒店map标记"
                                                                                            data-cs-d="酒店map标记"></span>
                            </div>
                            <div class="map-mark mark-hotel  _j_map_overlay _j_hotel_marker"
                                 style="transform: translate3d(7.5px, 83.5px, 0px);"><span class="m-icon clickstat"
                                                                                           data-cs-p="酒店map标记"
                                                                                           data-cs-d="酒店map标记"></span>
                            </div>
                            <div class="map-mark mark-hotel  _j_map_overlay _j_hotel_marker"
                                 style="transform: translate3d(16.5px, 82.5px, 0px);"><span class="m-icon clickstat"
                                                                                            data-cs-p="酒店map标记"
                                                                                            data-cs-d="酒店map标记"></span>
                            </div>
                            <div class="map-mark mark-hotel  _j_map_overlay _j_hotel_marker"
                                 style="transform: translate3d(26.5px, 72.5px, 0px);"><span class="m-icon clickstat"
                                                                                            data-cs-p="酒店map标记"
                                                                                            data-cs-d="酒店map标记"></span>
                            </div>
                            <div class="map-mark mark-hotel  _j_map_overlay _j_hotel_marker"
                                 style="transform: translate3d(37.5px, 130.5px, 0px);"><span class="m-icon clickstat"
                                                                                             data-cs-p="酒店map标记"
                                                                                             data-cs-d="酒店map标记"></span>
                            </div>
                            <div class="map-mark mark-hotel  _j_map_overlay _j_hotel_marker"
                                 style="transform: translate3d(28.5px, 62.5px, 0px);"><span class="m-icon clickstat"
                                                                                            data-cs-p="酒店map标记"
                                                                                            data-cs-d="酒店map标记"></span>
                            </div>
                            <div class="map-mark mark-hotel  _j_map_overlay _j_hotel_marker"
                                 style="transform: translate3d(17.5px, 89.5px, 0px);"><span class="m-icon clickstat"
                                                                                            data-cs-p="酒店map标记"
                                                                                            data-cs-d="酒店map标记"></span>
                            </div>
                            <div class="map-mark mark-hotel  _j_map_overlay _j_hotel_marker"
                                 style="transform: translate3d(60.5px, 110.5px, 0px);"><span class="m-icon clickstat"
                                                                                             data-cs-p="酒店map标记"
                                                                                             data-cs-d="酒店map标记"></span>
                            </div>
                            <div class="map-mark mark-hotel  _j_map_overlay _j_hotel_marker"
                                 style="transform: translate3d(121.5px, 57.5px, 0px);"><span class="m-icon clickstat"
                                                                                             data-cs-p="酒店map标记"
                                                                                             data-cs-d="酒店map标记"></span>
                            </div>
                            <div class="map-mark mark-hotel  _j_map_overlay _j_hotel_marker"
                                 style="transform: translate3d(17.5px, 54.5px, 0px);"><span class="m-icon clickstat"
                                                                                            data-cs-p="酒店map标记"
                                                                                            data-cs-d="酒店map标记"></span>
                            </div>
                            <div class="map-mark mark-hotel  _j_map_overlay _j_hotel_marker"
                                 style="transform: translate3d(128.5px, 95.5px, 0px);"><span class="m-icon clickstat"
                                                                                             data-cs-p="酒店map标记"
                                                                                             data-cs-d="酒店map标记"></span>
                            </div>
                            <div class="map-mark mark-hotel  _j_map_overlay _j_hotel_marker"
                                 style="transform: translate3d(13.5px, 37.5px, 0px);"><span class="m-icon clickstat"
                                                                                            data-cs-p="酒店map标记"
                                                                                            data-cs-d="酒店map标记"></span>
                            </div>
                            <div class="map-mark mark-hotel  _j_map_overlay _j_hotel_marker"
                                 style="transform: translate3d(-0.5px, 82.5px, 0px);"><span class="m-icon clickstat"
                                                                                            data-cs-p="酒店map标记"
                                                                                            data-cs-d="酒店map标记"></span>
                            </div>
                        </div>
                        <div class="leaflet-popup-pane"></div>
                    </div>
                </div>
                <div class="leaflet-control-container">
                    <div class="leaflet-top leaflet-left"></div>
                    <div class="leaflet-top leaflet-right">
                        <div class="leaflet-control-zoom leaflet-bar leaflet-control"><a class="leaflet-control-zoom-in"
                                                                                         href="#"
                                                                                         title="Zoom in">+</a><a
                                class="leaflet-control-zoom-out" href="#" title="Zoom out">-</a></div>
                    </div>
                    <div class="leaflet-bottom leaflet-left">
                        <div class="leaflet-control-scale leaflet-control">
                            <div class="leaflet-control-scale-line" style="width: 77px;">3 km</div>
                        </div>
                    </div>
                    <div class="leaflet-bottom leaflet-right">
                        <div class="leaflet-control-attribution leaflet-control">Map data ©Google</div>
                    </div>
                </div>
            </div>
        </div>
    </div>


    <div class="container">
        <form id="queryForm" method="post" action="/hotel/queryForHotel">
            <input type="hidden" name="currentPage" id="currentPage" value="1">
            <input type="hidden" name="orderBy" id="orderBy" value="">
            <input type="hidden" name="destId" id="orderBy" value="${dest.id!}">
        <div class="h-tab" id="_j_feature_tab">
            <input type="hidden" name="hoteltag" id="hoteltag" value="-1">
            <ul class="ul-tab">
                <li>
                    <a id="tag-1" href="javascript:changeTag(-1);"   data-id="-1" class="tags on">
                        全部
                    </a>
                </li>
            <#list tags as t>
                <li>
                    <a id="tag${t.id}" href="javascript:changeTag(${t.id});" class="tags" data-id="${t.id}">
                    ${t.name}
                    </a>
                </li>
            </#list>
            </ul>
        </div>
        <div class="hotel-toolbar clearfix">
            <div class="htb-item htb-item-price" id="_j_price_slider">
                <div class="htb-title"><span>¥0 - 4000</span>最低价格</div>
               <input id="price" name="price" type="number" onchange="getHotel()">
                <input id="area" name="area" type="hidden" value="-1">
            </div>
            <div class="htb-item htb-item-dropdown" id="_j_star_filter">
                <div class="htb-title">住宿等级</div>
                <select id="star" name="star" onchange="getHotel()">
                    <option value="-1">不限</option>
                    <option value="5">
                       5
                    </option>
                    <option value="4">
                        4
                    </option>

                    <option value="3">
                        3
                    </option>
                    <option value="2">
                        2
                    </option>
                    <option value="1">
                        1
                    </option>
                </select>
            </div>
            <div class="htb-item htb-item-dropdown" id="_j_type_filter">
                <div class="htb-title">住宿类型</div>
                <div class="htb-select">
                    <select id="type" name="type" onchange="getHotel()">
                        <option value="-1">不限</option>
                        <option value="1">酒店</option>
                        <option value="2">度假村</option>
                        <option value="3">民宿</option>
                    </select>
                </div>
            </div>
            <div class="htb-item htb-item-dropdown" id="_j_facility_filter">
                <div class="htb-title">设施</div>
                <div class="htb-select">
                    <select id="facilities" name="facilities" onchange="getHotel()">
                        <option value="-1">不限</option>
                        <#list facilities! as f>
                            <option value="${f.id}">${f.name}</option>
                        </#list>
                    </select>
                </div>
            </div>
            <div class="htb-item htb-item-dropdown" id="_j_brand_filter">
                <div class="htb-title">品牌</div>
                <div class="htb-select">
                    <select id="brand" name="brand" class="form-control" onchange="getHotel()">
                        <option value="">不限</option>
                        <#list brand! as b>
                            <option value="${b}">${b}</option>
                        </#list>
                    </select>
                </div>
            </div>
        </div>

        <div class="hotel-sortbar clearfix">
            <div class="sortbar-info">
                <div class="total" id="_j_total_text"><span id="hotelNum">567</span> 家酒店</div>


                <span class="hotel-switch" id="_j_available_switch">
                <input type="checkbox" name="hasroom" value="1" onclick="getHotel()">有房</input></span>

                <div class="checkbox-list clearfix" id="_j_checkbox_list"><a class="mui-checkbox" href="javascript:;"
                                                                             data-id="19455">
                    <input type="checkbox" name="closeSub" value="1" onchange="getHotel()">临地铁</input></span></a><a class="mui-checkbox" href="javascript:;" data-id="hasFaved">
                    <input type="checkbox" name="favour" value="1" onchange="getHotel()">收藏</input></span></a><a class="mui-checkbox" href="javascript:;" data-id="hasFaved">
                    </div>


                <div class="htb-search" id="_j_keyword_filter">
                    <div class="htb-searchbar">
                        <input type="text" placeholder="搜索关键词" name="keyword" onchange="getHotel()">
                        <a class="htb-icon-search" ></a>
                    </div>
                </div>

            </div>
            <div class="sortbar-nav" id="_j_sorter">
                <a id="orderby0" href="javascript:changeOrderBy(0);" data-type="comment" class="orderBy on" data-value="">综合排序</a>
                <a id="orderby1" href="javascript:changeOrderBy(1);" data-type="hot" class="sales-sort orderBy" data-value="h.sellnum" >销量</a>
                <a id="orderby2" class="price-sort orderBy" href="javascript:changeOrderBy(2);" data-type="price" data-value="h.price" ><i></i>价格</a>
            </div>
        </div>
        </form>

        <div class="n-content">
            <div class="hotel-loading" id="_j_hotel_list_loading" style="display: none;"><i class="loading-m"></i></div>
            <div class="hotel-list" id="_j_hotel_list">

            </div>

            <div style="margin-bottom: 24px;padding-left: 12px;">
                <a style="color: #666;font-weight: bold;text-decoration: none;cursor: default;" target="_blank"
                   href="/hotel/license">骡窝窝酒店平台合作伙伴</a>
            </div>

        </div>


        <script language="javascript" src="http://js.mafengwo.net/js/hotel/sign/index.js?1552035728"
                type="text/javascript"
                crossorigin="anonymous"></script>


        <link href="http://css.mafengwo.net/css/hotel/captcha.css?1552035728" rel="stylesheet" type="text/css">

        <link href="http://css.mafengwo.net/css/hotel/dialog.css?1552035728" rel="stylesheet" type="text/css">


        <script language="javascript" src="http://js.mafengwo.net/js/corelib/underscore-1.6.0.js?1537192880"
                type="text/javascript" crossorigin="anonymous"></script>

        <script language="javascript"
                src="http://js.mafengwo.net/js/cv/js+underscore1.3.3:js+corelib+backbone-1.1.2^Z1E^1537192880.js"
                type="text/javascript" crossorigin="anonymous"></script>

        <script language="javascript" src="http://js.mafengwo.net/js/jquery-ui-1.11.0.min.js?1537192880"
                type="text/javascript" crossorigin="anonymous"></script>

        <script language="javascript" src="http://js.mafengwo.net/js/MouseTip.js?1537192880" type="text/javascript"
                crossorigin="anonymous"></script>


        <link href="http://css.mafengwo.net/css/mfw-footer.css?1558532347" rel="stylesheet" type="text/css">


        <style>
            #banner-con-gloable {
                display: block;
                position: fixed;
                bottom: 0;
                left: -100%;
                z-index: 110;
                width: 100%;
                height: 179px;
                overflow-x: hidden;
            }

            #banner-con-gloable .banner-btn-con {
                width: 100%;
                height: 162px;
                background: rgba(30, 15, 8, 0.95);
                position: absolute;
                bottom: 0;
            }

            #banner-con-gloable .banner-btn-con .close-btn {
                position: absolute;
                right: 35px;
                top: 24px;
                z-index: 120;
                height: 24px;
                width: 24px;
                cursor: pointer;
            }

            #banner-con-gloable .banner-image-con {
                position: absolute;
                right: 50%;
                bottom: 0;
                width: 1000px;
                margin-right: -500px;
            }

            #float-pannel-gloable {
                padding-left: 28px;
                padding-bottom: 20px;
                display: block;
                position: fixed;
                bottom: 0;
                z-index: 110;
                left: -230px;
            }

            #float-pannel-gloable .float-btn {
                width: 24 pxpx;
                height: 24px;
                position: absolute;
                right: 0;
                top: 0;
                z-index: 100;
            }

            #closed {
                height: 24px;
                width: 24px;
                vertical-algin: top;
                border: none;
                cursor: pointer;
            }
        </style>

        <div id="float-pannel-gloable">
            <img class="float-image" src="https://p4-q.mafengwo.net/s14/M00/BB/8C/wKgE2l0r2W-ALHaeAACAt6lqXyA464.png"
                 style="width:178px;">
            <div class="float-btn">
                <img id="closed" src="https://n4-q.mafengwo.net/s13/M00/46/AC/wKgEaVy2xHeAZJhRAAADGY-wozY871.png"></div>
        </div>


        <script>
            $(function () {

                var flag_page = location.href.match(/^(https|http):\/\/www\.mafengwo\.cn\/?$/g) ||
                        location.href.match(/^(https|http):\/\/www\.mafengwo\.cn(\/\?\S*)/g) ||
                        location.href.match(/(cn\/gonglve|cn\/yj\/|cn\/i\/|cn\/jd\/|cn\/xc\/|cn\/schedule\/|cn\/baike\/|cn\/poi\/|mdd|travel-scenic-spot)/g)

                if (!!flag_page && getCookie('ad_hide') != '1' && getCookie('ad_close_num') < 2) {
                    handleBannerShow();
                }
            });

            // 浮标关闭按钮点击
            $("#float-pannel-gloable .float-btn").click(function () {
                $("#float-pannel-gloable").animate({left: -230,}, 800, 'swing');
                add_cookie('ad_hide', '1', 1);
                if (!getCookie('ad_close_num')) {
                    add_cookie('ad_close_num', 1, 9999)
                } else if (!!getCookie('ad_close_num')) {
                    add_cookie('ad_close_num', getCookie('ad_close_num') * 1 + 1, 9999)
                }
            });

            function add_cookie(name, value, n) {
                var exp = new Date();
                exp.setTime(exp.getTime() + 24 * 60 * 1000 * 60 * n);
                document.cookie = name + '=' + value + ';expires=' + exp.toGMTString() + ';path=/';
            }

            function getCookie(cname) {
                var name = cname + "=";
                var ca = document.cookie.split(';');

                for (var i = 0; i < ca.length; i++) {
                    var c = ca[i];
                    while (c.charAt(0) == ' ') c = c.substring(1);
                    if (c.indexOf(name) != -1) return c.substring(name.length, c.length);
                }

                return "";
            }

            function delCookie(name) {
                var exp = new Date();
                exp.setTime(exp.getTime() - 1);
                var cval = getCookie(name);
                if (cval != null)
                    document.cookie = name + "=" + cval + ";expires=" + exp.toGMTString();
            }

            function handleBannerShow() {
                $("#float-pannel-gloable").animate({left: 0,}, 500, 'swing');
            }


            $(".sales-sort").click(function (data) {

            })

        </script>


        <link href="http://css.mafengwo.net/css/mfw-toolbar.css?1537192876" rel="stylesheet" type="text/css">

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


    </div>

</body>
</html>