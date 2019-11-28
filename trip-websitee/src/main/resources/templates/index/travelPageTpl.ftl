<div class="tn-list">
    <#list pageInfo.list as t >
        <div class="tn-item clearfix">
            <div class="tn-image">
                <a href="javascript:;" target="_blank">
                    <img src="${t.coverUrl!}" style="display: inline;">
                </a>
            </div>
            <div class="tn-wrapper">
                <dl>
                    <dt>
                        <a href="/travel/detail?id=${t.id!}" target="_blank">${t.title!}</a>
                    </dt>
                    <dd>
                        <a href="/travel/detail?id=${t.id!}"  target="_blank">
                            <#if t.summary?length <100>
                                ${t.summary!}
                            <#else>
                                ${(t.summary?substring(0,100))!}...
                            </#if>
                        </a>
                    </dd>
                </dl>
                <div class="tn-extra">
                    <span class="tn-ding">
                        <a class="btn-ding" href="javascript:;" data-japp="articleding"
                           data-iid="12451790" data-vote="2157" rel="nofollow"></a>
                        <em id="topvote12451790">${t.thumbsupnum!0}</em>
                    </span>
                    <span class="tn-place">
                        <a href="javascript:void(0);" class="_j_gs_item"
                             rel="nofollow" data-name="昆明" data-objid="10807"
                             data-type="2">${(t.dest.name)!"中国"}</a>，by</span>
                    <span class="tn-user">
                        <a href="javascript:;" target="_blank" rel="nofollow">
                            <img src="${(t.author.coverUrl)!}">
                            ${(t.author.nickname)!'佚名'}
                        </a>
                    </span>
                    <span class="tn-nums"><i></i>${t.viewnum!0}/${t.starnum!0}</span>
                </div>
            </div>
        </div>
    </#list>
</div>
<#include "../common/page.ftl">