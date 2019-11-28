

<#list detail as d>
    <li class="item clearfix _j_question_item" data-qid="793682">
    <div class="title">
        <a href="javascript:;" target="_blank">${d.title!}</a> </div>
    <div class="container">
        <div class="avatar"><a href="javascript:;" target="_blank" class="_j_filter_click"><img
                class="_j_filter_click"
                src="${(d.users.headImgUrl)!}"></a>
        </div>
        <div class="user-info">
            <a class="name _j_filter_click" href="javascript:;" target="_blank">${(d.users.nickname)!}</a>
            <a class="level _j_filter_click" href="javascript:;" target="_blank" rel="nofollow">LV.${(d.users.level)!}</a>
        </div>
        <div class="desc clearfix">
                    <#if img ??>
                  <img src="${img!}" width="150" height="100">
                    </#if>
            <p class="_contest" style="width: 600px">
                ${(d.users.context)!}
            </p>
        </div>
        <div class="tags">
            <a class="a-tag _j_filter_click" href="javascript:;" target="_blank">$${d.tag!}</a>
        </div>
        <div class="operate">
            <div class="zan"><i></i>${d.thumpsupnum!}</div>
            <div class="mdd"><a href="javascript:;" class="_j_filter_click" target="_blank"><i
                    class="_j_filter_click"></i>${d.destName!}</a></div>
            <div class="cate-share">
                <a class="_js_showShare _j_filter_click">分享</a>
            </div>
            <span class="reply">回答 (${size!})</span>
            <span class="browse">浏览 (${d.viewnum!})</span>
            <span class="date">发布于${d.creatTime!}</span>
        </div>
    </div>
</li>
</#list>

