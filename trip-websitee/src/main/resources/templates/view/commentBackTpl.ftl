<div class="comment add-reply ">
    <ul class="more_reply_box">

        <li>
                <#if cb.type == 0>
                    <a href="javascript:void(0);">
                        <img src="${cb.headUrl!}" width="16" height="16">${cb.username!}
                    </a>
                    :${cb.content!}
                    <a class="_j_reply re_reply"
                       data-toid="${(cb.userId)!}"
                       data-touser="${(cb.username)!}"
                       data-id="${cb.commentId!}"
                       data-cbid="${(cb.id)!}"
                        title="添加回复">回复</a>
                    <br><span class="time">${(cb.creatTime?string('yyyy-MM-dd HH:mm'))!}</span>

                <#else>

                    <a href="javascript:void(0);">
                        <img src="${cb.headUrl!}" width="16" height="16">${cb.username!}
                    </a>
                    回复${(cb.refComment.username)!}:${cb.content!}
                    <a class="_j_reply re_reply"
                       data-toid="${(cb.userId)!}"
                       data-touser="${(cb.username)!}"
                       data-id="${cb.commentId!}"
                       data-cbid="${(cb.id)!}"
                       title="添加回复">回复</a>
                    <br><span class="time">${(cb.creatTime?string('yyyy-MM-dd HH:mm'))!}</span>
                </#if>
        </li>
    </ul>


</div>

