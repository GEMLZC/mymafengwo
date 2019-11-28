<div class="mfw-cmt _j_reply_item ajaxComment"  >
    <div class="mcmt-info">
        <div class="mcmt-photo">
            <a href="javascript:;" target="_blank">
                <img src="${c.headUrl!}"
                     width="48" height="48" alt="${c.username!}">
            </a>
        </div>
        <div class="mcmt-user">
            <a href="javascript:;" target="_blank" class="name">${c.username!}</a>
            <a href="javascript:;" class="level">LV.${c.level!}</a>
            <a href="javascript:;" class="identity identity-guide" target="_blank"></a>
            <a href="javascript:void(0);" class="per_attention" data-japp="following"
               data-uid="76382990" data-follow_class="hide">
                <img src="http://images.mafengwo.net/images/home/tweet/btn_sfollow.gif"
                     width="38" height="13" border="0" title="关注TA">
            </a>
        </div>
        <div class="mcmt-other">
            <span class="floor">${floor}F</span>
        </div>
    </div>
    <div class="mcmt-con-wrap clearfix">
        <div class="mcmt-con">

        <#if c.type == 1>
            <div class="mcmt-quote">
                <p>引用 ${(c.refComment.username)!} 发表于 ${(c.refComment.createTime?string('yyyy-MM-dd HH:ss'))!} 的回复：</p>
                <p class="_j_reply_content">${(c.refComment.content)!}</p>
            </div>
            <div class="mcmt-word">
                <p class="_j_reply_content" >回复${(c.refComment.username)!}：${(c.content)!}</p>
            </div>
        <#else>
            <div class="mcmt-quote">
            </div>
            <div class="mcmt-word">
                <p class="_j_reply_content">${(c.content)!}</p>
            </div>
        </#if>
        </div>
        <div class="mcmt-tag">
        </div>
    </div>
    <div class="mcmt-bot">
        <div class="time">${(c.createTime?string('yyyy-MM-dd HH:ss'))!}</div>
        <div class="option">
            <a role="button" class="reply-report">举报</a>
            <a role="button" class="_j_reply replyBtn" data-touser="${c.username!}" data-toid="${c.id!}">回复</a>
        </div>
    </div>
</div>

<script>
    //替换表情
    var psA = $(".ajaxComment ._j_reply_content");
    for(var i = 0;i < psA.length; i++){
        $(psA[i]).html( emoji($(psA[i]).html() + ""));
    }
</script>