<div class="tiles tile-lis-${tid}">
    <#list tags as t>
    <div class="item col4">
        <#if tid != 4>
        <a href="/destination/filter?tagId=${(t.id)!}" target="_blank" data-tid="${(t.id)!}"><img src="${t.coverImg!}" width="238" height="220">
            <div class="title">${t.name!}</div>
        </a>
            <#else>
            <a href="/destination/filter?tagTime=${(t.id)!}" target="_blank" data-tid="${(t.id)!}"><img src="${t.coverImg!}" width="238" height="220">
                <div class="title">${t.name!}</div>
            </a>
        </#if>
    </div>
    </#list>
</div>
