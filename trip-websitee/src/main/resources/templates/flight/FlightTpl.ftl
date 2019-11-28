<script>
    /*订票机票点击事件*/
    $("#btn_search").on("click", function () {
        var r = confirm("确认是否订购该机票？");
        if (r == true)
        {
            alert("预订成功!");
        } else
        {
            alert("取消预订!");
        }
    })
</script>
<#list flights as f>
<div id="flight_list" style="" render-loop="list">
    <div class="f-list ng-scope" ng-repeat="one in result.flights|orderBy:sort.key:sort.type" ng-if="loaded">
        <div class="f-item" ng-attr-id="{{ 'airline-item-' + one.flight_no }}" ng-click="showSubInfo(one)"
             id="airline-item-9C8542">
            <div class="f-item-info ng-scope" ng-if="one.flight_no" style="position: relative">
                <div class="f-line">
                            <span class="airline-logo"><i ng-attr-id="{{ 'logo-item-' + one.flight_no }}"
                                                          id="logo-item-9C8930" class="airline-logo-9C"></i></span>
                    <p class="f-name ng-binding">航班<span class="ng-binding"></span>
                    </p>
                    <p class="sub ng-binding" render-html="list.flightNo">${f.flightno}</p>
                </div>
                <div class="f-time">
                    <div class="time ng-binding" ng-bind="one.dep_time" render-key="list.depTime"
                         render-fun="beginFly">${f.deptTime?string("yyyy-MM-dd HH:mm")}
                    </div>
                    <p class="sub ng-binding" render-html="list.depPort">${f.depport}</p>
                </div>
                <div class="through">
                    <div class="arrow"></div>
                    <p class="duration ng-binding" ng-bind="one.takingTime"></p>
                    <div class="f-pop f-pop-stay">
                        <i class="pop-arrow"></i>
                        <strong>经停</strong>
                        <p>经停城市：<span ng-bind="one.stop_infos.city_name" class="ng-binding"></span></p>
                    </div>
                </div>
                <div class="f-time">
                    <div class="time ng-binding" ng-bind="one.arr_time" render-key="list.arrTime"
                         render-fun="endFly">${f.arrTime?string("yyyy-MM-dd HH:mm")}
                    </div>
                    <p class="sub ng-binding" render-html="list.arrPort">${f.arrport}</p>
                </div>
                <div class="item item-btn btn_search">
                    <a id="btn_search">订购</a>
                </div>
            </div>
        </div>
    </div>
</div>
</#list>