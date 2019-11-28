<ul class="clearfix" style="display: block;" data-id="0">
<#list hotels as hs>

    <li data-id="84968" data-mddid="11045" data-youyu-id="8062" data-ota-id="5">
        <a  target="_blank" data-type="hotel" data-name="${hs.name}">
            <div class="pic">
                <img src="${hs.coverUrl}" class="img-show">
            </div>
            <div class="bag-opa"></div>
            <div class="fraction">${hs.score}分</div>
            <div class="info">
                <div class="prize"></div>
                <p>${hs.name}</p>
                <p class="eng">${hs.english}</p></div>
        </a>
    </li>
</#list>
</ul>


<#--
<#list hotels as hs>
<ul class="clearfix" style="" data-id="0">
    <li>
        <div class="fc-item"
             style="transform: matrix3d(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1);">
            <a  target="_blank" data-type="mdd" class="theme" data-name="${hs.name}">
                <div class="pic">
                    <img width="318" height="240" style="width:318px;height:240px;"
                         src="${hs.coverUrl}"
                         class="img-show">
                </div>
                <div class="bag-opa"></div>
                <span class="shadow"
                      style="background-image: linear-gradient(45deg, rgba(0, 0, 0, 0.4), transparent 40%);"></span>
                <div class="info">
                    <h2>${hs.name}</h2>
                    <p class="caption">${hs.english}</p>
                </div>
            </a>
        </div>
    </li>
</#list>
</ul>-->
