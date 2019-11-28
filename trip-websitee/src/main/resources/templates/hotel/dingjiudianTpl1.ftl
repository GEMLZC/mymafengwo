<dl class="item-info clearfix _j_area_desc_list" style="height: 105px;">
    <dt style="">攻略:</dt>
    <dd data-id="${a.id}" >
        <div>
            <p>
                <em>${a.choosepercent}%</em>的游客选择&nbsp;&nbsp;&nbsp;&nbsp;共<em>${a.hotelsum}</em>家酒店
                <a class="icon-photos" href="/hotel/area_view/1764.html" target="_blank"></a>
            </p>
            <div>
            ${a.info}
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
    <dd data-id="${a.id}" >
        <ul class="clearfix">
            <li><span class="hotel-rate rate3"></span>￥${a.rate3Price!}</li>
            <li><span class="hotel-rate rate4"></span>￥${a.rate4Price!}</li>
            <li><span class="hotel-rate rate4"></span>￥${a.rate5Price!}</li>
        </ul>
    </dd>
</dl>