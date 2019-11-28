<#list pageInfo.list as t>
    <div class="tn-item clearfix">
        <div class="tn-image">
            <a href="javascript:;" target="_blank">
                <img class="lazy" width="220" height="150" alt="${t.subTitle!}"
                     src="${t.coverUrl}" style="display: inline;">
            </a>
        </div>
        <div class="tn-wrapper" data-focus="" data-topsort="" data-star="0">
            <dl>
                <dt>
                    <a href="/travel/detail?id=${t.id!}" class="title-link" target="_blank">${t.title}</a>
                </dt>
                <dd><a href="/travel/detail?id=${t.id!}" target="_blank">${t.summary!}</a>
                </dd>
            </dl>
            <div class="tn-extra">
                <span class="tn-ding">
                    <a class="btn-ding" href="/travel/detail?id=${t.id!}" data-japp="articleding"
                       data-iid="12663570" data-vote="5"></a>
                    <em id="topvote12663570">${t.thumbsupnum!0}</em>
                </span>
                <span class="tn-user"><a href="javascript:;" target="_blank"
                                         rel="nofollow"><img src="${(t.author.headImgUrl)!}">${(t.author.nickname)!}</a></span>
                <span class="tn-nums"><i></i>${t.viewnum!0}/${t.favornum!0}</span>
            </div>
        </div>
    </div>
   <br><br>
</#list>
<#include "../common/page.ftl">
