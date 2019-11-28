<div class="hot-list clearfix hot-list-${regionId}" >
<div class="col">
    <#list leftDests as d>
        <dl>
            <dt><a href="/destination/guide?id=${d.id}" target="_blank">${d.name}</a></dt>
            <dd>
                <#list d.children as sub>
                    <#if sub_index lt 10>
                    <a href="/destination/guide?id=${sub.id}" target="_blank">${sub.name}</a>
                    </#if>
                </#list>
            </dd>
        </dl>
    </#list>
</div>

<div class="col" style="margin-left: 50px">
    <#list rightDests as d>
        <dl>
            <dt><a href="/destination/guide?id=${d.id}" target="_blank">${d.name}</a></dt>
            <dd>
                <#list d.children as sub>
                    <#if sub_index lt 10>
                    <a href="/destination/guide?id=${sub.id}" target="_blank">${sub.name}</a>
                    </#if>
                </#list>
            </dd>
        </dl>
    </#list>
</div>
</div>