<#list detail as d>
    <li class="item clearfix _j_question_item" data-qid="${d.id!}">
        <div class="title">
            <a href="/community/wendaDetail?id=${d.id}" target="_blank" data-qid="${d.id}">${d.title!}</a></div>
        <div class="container">
    <#if d.user ??>
            <div class="avatar"><a href="javascript:;" target="_blank" class="_j_filter_click"><img
                    class="_j_filter_click"
                    src="${(d.user.headImgUrl)!}"></a>
            </div>
            <div class="user-info">
                <a class="name _j_filter_click" href="javascript:;" target="_blank">${(d.user.nickname)!}</a>
                <a class="level _j_filter_click" href="javascript:;" target="_blank"
                   rel="nofollow">LV.${(d.user.level)!}</a>
            </div>

        </#if>
            <div class="desc clearfix">
              <#if d.imgUrl ??>
                  <img src="${d.imgUrl!}" width="150" height="100">
              </#if>
                <p class="_contest" style="width: 600px">
                    ${d.txt!}
                </p>
            </div>
            <div class="tags">
                <a class="a-tag _j_filter_click" href="javascript:;" target="_blank">${d.tag!}</a>
            </div>
            <div class="operate">
                <div class="zan"><i></i>${d.thumpsupnum!}</div>
                <div class="mdd"><a href="javascript:;" class="_j_filter_click" target="_blank"><i
                        class="_j_filter_click"></i>${d.destName!}</a></div>
                <div class="cate-share">
                    <a class="_js_showShare _j_filter_click">分享</a>
                </div>
                <span class="reply">回答 (${d.replynum!})</span>
                <span class="browse">浏览 (${d.viewnum!})</span>
                <span class="date">发布于${d.creatTime?string("yyyy-MM-dd HH:mm:ss")}</span>
            </div>
        </div>
    </li>
</#list>

