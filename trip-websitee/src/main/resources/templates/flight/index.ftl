<!DOCTYPE html>
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title></title>
    <link href="/styles/base.css" rel="stylesheet" type="text/css">
    <link href="/styles/flight.css" rel="stylesheet" type="text/css">
    <link href="/js/plugins/jqPaginator/jqPagination.css" rel="stylesheet" type="text/css">
    <link href="/styles/flight/css+hotel+datepicker-range^a1w^1552035728.css" rel="stylesheet" type="text/css">
    <link href="/styles/flight/css+mfw-header.2015^ylvs^1559526017.css" rel="stylesheet" type="text/css">
    <link href="/styles/flight/mfw-footer.css" rel="stylesheet" type="text/css">
    <link href="/styles/flight/mfw-toolbar.css" rel="stylesheet" type="text/css">

    <script type="text/javascript" src="/js/jquery/jquery.min.js"></script>
    <script type="text/javascript" src="/js/plugins/My97DatePicker/WdatePicker.js"></script>
    <script type="text/javascript" src="/js/plugins/jquery-form/jquery.form.js"></script>
    <script type="text/javascript" src="/js/plugins/jqPaginator/jq-paginator.min.js"></script>
    <script type="text/javascript" src="/js/system/index.js"></script>
    <script type="text/javascript" src="/js/plugins/jrender/jrender.min.js"></script>

    <style>
        .arrow {
            width: 78px;
            height: 7px;
            margin-top: 15px;
            display: inline-block;
            background: url('/images/flight/sprites4.png') -50px -150px no-repeat;
            background-size: auto;
            vertical-align: middle;
        }

        .btn_search > a {
            display: block;
            background-color: #ff9d00;

            color: #fff;
            font-size: 18px;
            position: absolute;
            right: 50;
            right: 50px;
            padding: 10px 20px;
            border-radius: 5px;
        }
    </style>

    <script>
        $(function () {
            //出发城市三字码
            var orgCity;
            //到达城市三字码
            var dstCity;


            //出发航班城市的标签点击事件 (为文本框赋值)
            $(".departGroupLayer a").click(function () {
                $("#departCity").val('');
                var flight = $(this).data('name');
                orgCity = $(this).data('code');
                $("#departCity").val(flight);
                $("#departCityLayer").css('display', 'none');
            });

            //航班城市选择框的显示
            $("#departCity").click(function () {
                $("#departCityLayer").css('display', 'block');
            });

            //到达航班城市的标签点击事件 (为文本框赋值)
            $(".destGroupLayer a").click(function () {
                $("#destCity").val('');
                var flight = $(this).data('name');
                dstCity = $(this).data('code');
                $("#destCity").val(flight);
                $("#destCityLayer").css('display', 'none');
            });

            //航班城市选择框的显示
            $("#destCity").click(function () {
                $("#destCityLayer").css('display', 'block');
            });

            var tab = '#hot';

            //城市选择款的nav栏
            $(".hcl-sort").mouseenter(function () {
                $(this).attr('class', 'hcl-sort on');
                $(tab).css('display', 'none');
                tab = '#' + $(this).data('tab');
                $(tab).css('display', 'block');
            });

            //城市选择款nae栏的颜色改变
            $(".hcl-sort").mouseleave(function () {
                $(this).attr('class', 'hcl-sort');
            });

            //' 换'按钮的点击事件
            $("#citySwitc").click(function () {
                //值切换
                var temp = $("#departCity").val();
                var destval = $("#destCity").val();
                $("#departCity").val(destval);
                $("#destCity").val(temp);
                //三字码
                var temp2 = orgCity;
                orgCity = dstCity;
                dstCity = temp2;
            });

            //查询按键点击处理
            $("#search").click(function () {
                console.log(orgCity);
                console.log(dstCity);
                var deptTime = $("#depTime").val();
                $.get('/flight/search', {'orgCity': orgCity, 'dstCity': dstCity, 'depTime': deptTime}, function (data) {
                    $("#airinfo").html(data);
                });
            })
            $("#sort_dep_time").on("click",function () {
                var deptTime = $("#depTime").val();
                $.get('/flight/search', {'orgCity': orgCity, 'dstCity': dstCity, 'depTime': deptTime ,'orderBy': 'f.deptTime desc' }, function (data) {
                    $("#airinfo").html(data);
                });
            })
            $("#sort_arr_time").on("click",function () {
                var deptTime = $("#depTime").val();
                $.get('/flight/search', {'orgCity': orgCity, 'dstCity': dstCity, 'depTime': deptTime ,'orderBy': 'f.arrTime desc' }, function (data) {
                    $("#airinfo").html(data);
                });
            })

        });
    </script>
</head>

<body>
<#assign currentNav="flight">
<#include "../common/navbar.ftl">
<div class="container" ng-controller="indexController">
    <div class="m-title"><i class="icon-flight"></i>国内机票</div>
    <div class="fm flight">
        <div class="book-form">
            <ul class="book-tab">
                <li class="on" id="one_way_btn" ng-click="setOneWay()"><a href="javascript:;"><i class="icon-go"></i>单程</a>
                </li>
                <li class="" id="round_way_btn" ng-click="setRonudWay()"><a href="javascript:;"><i
                        class="icon-round"></i>往返</a></li>
            </ul>
            <div class="book-content">
                <div class="item">
                    <span class="label">出发城市</span>
                    <div class="inp-wrap">
                        <label><input type="text" id="departCity" placeholder="点击输入"
                                      class="ng-pristine ng-valid" data-code=""></label>
                    </div>
                    <div class="hot-city-layer" id="departCityLayer" style="width: 490px; display: none;">
                        <!--航班城市分类导航栏-->
                        <div class="hcl-nav">
                            <a class="hcl-sort on" id="departHotTab" data-tab="hot" href="javascript:;">国内热门</a>
                            <a href="javascript:;" data-tab="ABCDE" class="hcl-sort">ABCDE</a>
                            <a href="javascript:;" data-tab="FGHJ" class="hcl-sort">FGHJ</a>
                            <a href="javascript:;" data-tab="KLMNP" class="hcl-sort">KLMNP</a>
                            <a href="javascript:;" data-tab="QRSTW" class="hcl-sort">QRSTW</a>
                            <a href="javascript:;" data-tab="XYZ" class="hcl-sort">XYZ</a>
                        </div>
                        <!--航班城市列表-->
                        <div class="hcl-list" id="startFlight">
                            <div class="departGroupLayer ng-scope" id="hot" style="display: block;">
                                <dl class="ng-scope">
                                    <dd>
                                    <#list hotFlights! as ele>
                                        <a href="javascript:;" class="ng-binding ng-scope" data-id="${ele.id}"
                                           data-name="${ele.name}" data-code="${ele.aircode}">${ele.name}</a>
                                    </#list>
                                    </dd>
                                </dl>
                            </div>
                            <div class="departGroupLayer ng-scope" id="ABCDE" style="display: none;">
                                <dl class="ng-scope">
                                    <dd>
                                    <#list initialA! as ele>
                                        <a href="javascript:;" class="ng-binding ng-scope" data-id="${ele.id}"
                                           data-name="${ele.name}" data-code="${ele.aircode}">${ele.name}</a>
                                    </#list>
                                    </dd>
                                </dl>
                            </div>
                            <div class="departGroupLayer ng-scope" id="FGHJ" style="display: none;">
                                <dl class="ng-scope">
                                    <dd>
                                    <#list initialF! as ele>
                                        <a href="javascript:;" class="ng-binding ng-scope" data-id="${ele.id}"
                                           data-name="${ele.name}" data-code="${ele.aircode}">${ele.name}</a>
                                    </#list>
                                    </dd>
                                </dl>
                            </div>
                            <div class="departGroupLayer ng-scope" id="KLMNP" style="display: none;">
                                <dl class="ng-scope">
                                    <dd>
                                    <#list initialK! as ele>
                                        <a href="javascript:;" class="ng-binding ng-scope" data-id="${ele.id}"
                                           data-name="${ele.name}" data-code="${ele.aircode}">${ele.name}</a>
                                    </#list>
                                    </dd>
                                </dl>
                            </div>
                            <div class="departGroupLayer ng-scope" id="QRSTW" style="display: none;">
                                <dl class="ng-scope">
                                    <dd>
                                    <#list initialQ! as ele>
                                        <a href="javascript:;" class="ng-binding ng-scope" data-id="${ele.id}"
                                           data-name="${ele.name}" data-code="${ele.aircode}">${ele.name}</a>
                                    </#list>
                                    </dd>
                                </dl>
                            </div>
                            <div class="departGroupLayer ng-scope" id="XYZ" style="display: none;">
                                <dl class="ng-scope">
                                    <dd>
                                    <#list initialX! as ele>
                                        <a href="javascript:;" class="ng-binding ng-scope" data-id="${ele.id}"
                                           data-name="${ele.name}" data-code="${ele.aircode}">${ele.name}</a>
                                    </#list>
                                    </dd>
                                </dl>
                            </div>
                        </div>
                    </div>
                </div>
                <span class="switch"><a href="javascript:;" id="citySwitc">换</a></span>
                <div class="item">
                    <span class="label">到达城市</span>
                    <div class="inp-wrap">
                        <label><input type="text" id="destCity" placeholder="点击输入" ng-model="destCityName"
                                      class="ng-pristine ng-valid" data-code=""></label>
                    </div>
                    <div class="hot-city-layer" id="destCityLayer" style="width: 490px; display: none;">
                        <!--航班城市分类导航栏-->
                        <div class="hcl-nav">
                            <a class="hcl-sort on" id="departHotTab" data-tab="hot2" href="javascript:;">国内热门</a>
                            <a href="javascript:;" data-tab="ABCDE2" class="hcl-sort">ABCDE</a>
                            <a href="javascript:;" data-tab="FGHJ2" class="hcl-sort">FGHJ</a>
                            <a href="javascript:;" data-tab="KLMNP2" class="hcl-sort">KLMNP</a>
                            <a href="javascript:;" data-tab="QRSTW2" class="hcl-sort">QRSTW</a>
                            <a href="javascript:;" data-tab="XYZ2" class="hcl-sort">XYZ</a>
                        </div>
                        <!--航班城市列表-->
                        <div class="hcl-list" id="startFlight">
                            <div class="destGroupLayer ng-scope" id="hot2" style="display: block;">
                                <dl class="ng-scope">
                                    <dd>
                                    <#list hotFlights! as ele>
                                        <a href="javascript:;" class="ng-binding ng-scope" data-id="${ele.id}"
                                           data-name="${ele.name}" data-code="${ele.aircode}">${ele.name}</a>
                                    </#list>
                                    </dd>
                                </dl>
                            </div>
                            <div class="destGroupLayer ng-scope" id="ABCDE2" style="display: none;">
                                <dl class="ng-scope">
                                    <dd>
                                    <#list initialA! as ele>
                                        <a href="javascript:;" class="ng-binding ng-scope" data-id="${ele.id}"
                                           data-name="${ele.name}" data-code="${ele.aircode}">${ele.name}</a>
                                    </#list>
                                    </dd>
                                </dl>
                            </div>
                            <div class="destGroupLayer ng-scope" id="FGHJ2" style="display: none;">
                                <dl class="ng-scope">
                                    <dd>
                                    <#list initialF! as ele>
                                        <a href="javascript:;" class="ng-binding ng-scope" data-id="${ele.id}"
                                           data-name="${ele.name}" data-code="${ele.aircode}">${ele.name}</a>
                                    </#list>
                                    </dd>
                                </dl>
                            </div>

                            <div class="destGroupLayer ng-scope" id="KLMNP2" style="display: none;">
                                <dl class="ng-scope">
                                    <dd>
                                    <#list initialK! as ele>
                                        <a href="javascript:;" class="ng-binding ng-scope" data-id="${ele.id}"
                                           data-name="${ele.name}" data-code="${ele.aircode}">${ele.name}</a>
                                    </#list>
                                    </dd>
                                </dl>
                            </div>
                            <div class="destGroupLayer ng-scope" id="QRSTW2" style="display: none;">
                                <dl class="ng-scope">
                                    <dd>
                                    <#list initialQ! as ele>
                                        <a href="javascript:;" class="ng-binding ng-scope" data-id="${ele.id}"
                                           data-name="${ele.name}" data-code="${ele.aircode}">${ele.name}</a>
                                    </#list>
                                    </dd>
                                </dl>
                            </div>
                            <div class="destGroupLayer ng-scope" id="XYZ2" style="display: none;">
                                <dl class="ng-scope">
                                    <dd>
                                    <#list initialX! as ele>
                                        <a href="javascript:;" class="ng-binding ng-scope" data-id="${ele.id}"
                                           data-name="${ele.name}" data-code="${ele.aircode}">${ele.name}</a>
                                    </#list>
                                    </dd>
                                </dl>
                            </div>
                        </div>
                    </div>
                </div>
                <!--出发时间-->
                <div class="item">
                    <span class="label">出发日期</span>
                    <div class="inp-wrap">
                        <input id="depTime" type="text" onclick="WdatePicker()" placeholder="点击输入">
                    </div>
                </div>
                <div class="item item-btn"><a href="javascript:;" id="search">搜索</a></div>
            </div>
        </div>
        <div class="flight-focus">
            <div class="flight-slide" data-mes-g="0-2" data-mes-t="轮播图区域" data-slide="1"
                 style="position: relative; overflow: hidden;">
                <img id="ad" src="https://file31.mafengwo.net/M00/CB/D6/wKgBs1fs2SyAKJ0hAAAF6t6DzKw318.png" alt="广告图标">
                <ul class="slide-img" style="width:3650px;" data-mes-g="0-2-0" data-mes-t="轮播图">
                    <li style="position: absolute; width: 730px;">
                        <a href="" target="_blank" data-index="0" data-url="" data-param="扫码购机票" data-source="www">
                            <img src="https://b3-q.mafengwo.net/s14/M00/1B/6B/wKgE2l0IoqiADHpKAAItDErw7lk257.png?imageMogr2%2Fthumbnail%2F%21620x350r%2Fgravity%2FCenter%2Fcrop%2F%21620x350%2Fquality%2F100"
                                 height="350" width="620">
                        </a>
                    </li>
                </ul>
                <ul class="slide-nav" data-mes-g="0-2-1" data-mes-t="导航区">
                    <li class="on" data-mes-g="0-2-1-0" data-mes-t="导航0">扫码购机票</li>
                </ul>
                <span class="slide-btn btn-left" data-btn-prev="1" data-mes-g="0-2-2" data-mes-t="控制左"
                      style="display: none;"><i></i></span>
                <span class="slide-btn btn-right" data-btn-next="1" data-mes-g="0-2-3" data-mes-t="控制右"
                      style="display: none;"><i></i></span>
            </div>
        </div> <!--//轮播图-->
        <div class="fm service">
            <ul>
                <li class="s1"><i></i>100%航协认证</li>
                <li class="s2"><i></i>出行保证</li>
                <li class="s3"><i></i><span>7x24小时服务<br><strong>4006345678</strong></span></li>
            </ul>
        </div> <!--保证-->
    </div>

<#-- ----------------------------------------------- -->
    <div class="f-sortbar">
        <div class="loading-bar"><span id="progress_bar" style="width: 100%; display: none;"></span></div>
        <ul class="clearfix">
            <li class="item1">航空信息</li>
            <li class="item2" ng-click="sortByDepTime()"><span class="f-sort" id="sort_dep_time">起飞时间<i
                    class="up"></i><i class="down"></i></span></li>
            <li class="item3" ng-click="sortByArrTime()"><span class="f-sort" id="sort_arr_time">到达时间<i
                    class="up"></i><i class="down"></i></span></li>
        </ul>
    </div>

    <div id="airinfo">

    </div>
<#-- ----------------------------------------------- -->
</div>
<#include "../common/footer.ftl">
</body>

</html>