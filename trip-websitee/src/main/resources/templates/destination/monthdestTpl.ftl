<div class="tiles tile-list-${mid}">
                            <#list topDests as top>
                            <div class="item col3">
                                <a href="/destination/guide?id=${(top.id)!}" data-id="${(top.id)!}" target="_blank"><img
                                        src="${(top.coverUrl)!}" width="323" height="220">
                                    <div class="title">${(top.name)!}</div>
                                </a>
                            </div>
                            </#list>
                            <#list underDests as under>
                            <div class="item col4">
                                <#if under_index+1 == size>
                                    <a href="/destination/filter" target="_blank"><img src="${(under.coverUrl)!}" width="238" height="220">
                                    <div class="more"><span>更多<i></i></span></div>
                                <#else>
                                     <a href="/destination/guide?id=${under.id!}" target="_blank"><img src="${(under.coverUrl)!}" width="238" height="220">
                                    <div class="title">${(under.name)!}</div>
                                </#if>
                            </div>

                            </#list>
</div>