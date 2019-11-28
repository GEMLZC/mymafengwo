<div class="crumb">
    <div class="item"><a href="/destination">目的地</a><em>&gt;</em></div>
                    <#list toasts as t>
                        <div class="item">
                            <div class="drop">
                                <span class="hd"><a href="javascript:;" target="_blank">${(t.name)!}<i></i></a></span>
                                <div class="bd">
                                    <i class="arrow"><b></b></i>
                                    <div class="col">
                                        <h3>热门地区</h3>
                                        <ul class="clearfix">
                                            <#list t.children as tc>
                                                <#if tc_index lt 5 >
                                                <li><a href="/destination/guide?id=${tc.id!}" target="_blank">${tc.name}</a> </li>
                                                </#if>
                                            </#list>

                                        </ul>
                                    </div>
                                    <div class="more"><a href="/destination/guide?id=${t.id}" target="_blank">&gt;&gt;更多地区</a></div>
                                </div>
                            </div>
                            <em>&gt;</em>
                        </div>
                    </#list>
    <div class="item">
        <div class="drop">
            <span class="hd"><a href="javascript:;">${dest.name}<i></i></a></span>
            <div class="bd">
                <i class="arrow"><b></b></i>
                <div class="col">
                    <!--h3>热门国家</h3-->
                    <ul class="clearfix">
                        <li><a href="/destination/surveyPage?destId=${dest.id}" target="_blank">${dest.name}概括</a></li>
                        <li><a href="#travel" target="_blank">${dest.name}游记</a></li>
                        <li><a href="#strategy" target="_blank">${dest.name}攻略</a></li>
                        <li><a href="javascript:;" target="_blank">${dest.name}跟团游</a></li>
                    </ul>
                </div>
                <!--div class="more"><a href="#">&gt;&gt;更多国家</a></div-->
            </div>
        </div>
        <em>&gt;</em>
    </div>
    <div class="item cur"><strong>${dest.name}概览</strong></div>
</div>