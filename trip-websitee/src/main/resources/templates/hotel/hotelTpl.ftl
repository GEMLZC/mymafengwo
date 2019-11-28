<#--<div class="_j_tab_content">-->
<#list list as h>
<ul class="clearfix" style="" data-id="0">
    <li>
        <div class="fc-item"
             style="transform: matrix3d(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1);">
            <a href="/hotel/dingjiudian?destId=${h.id}" target="_blank" data-type="mdd" class="theme" data-name="${h.name}">
                <div class="pic">
                    <img width="318" height="240" style="width:318px;height:240px;"
                         src="${h.coverUrl}"
                         class="img-show">
                </div>
                <div class="bag-opa"></div>
                <span class="shadow"
                      style="background-image: linear-gradient(45deg, rgba(0, 0, 0, 0.4), transparent 40%);"></span>
                <div class="info">
                    <h2>${h.parent.name}</h2>
                    <p class="caption">${h.name}</p>
                </div>
            </a>
        </div>
    </li>
</#list>
</ul>
