<li>
    <div class="answer-side _js_answerAva">
        <!-- <a class="btn-ding _js_zan "><i></i><span data-real_num="3">3</span></a> -->
    </div>
    <div class="answer-content _js_answer_content">


        <div class="answer-info clearfix">
            <div class="user-bar fl">
            <#--<a class="_j_filter_click avatar" href="javascript:;" target="_blank"><img-->
            <#--src="http://p4-q.mafengwo.net/s7/M00/11/82/wKgB6lT4WTOACq5EAAAGg4I64pY55.jpeg?imageMogr2%2Fthumbnail%2F%2148x48r%2Fgravity%2FCenter%2Fcrop%2F%2148x48%2Fquality%2F90"-->
            <#--width="48" height="48" class="photo"></a>-->


                <a class="_j_filter_click avatar" href="javascript:;" target="_blank"><img
                        src="${(user.headImgUrl)!}"
                        width="48" height="48" class="photo"></a>

                <a class="name" href="javascript:;" target="_blank">${(user.nickname)!}</a>
                <a class="level" href="javascript:;" target="_blank" rel="nofollow">LV.${(user.level)!}</a>
                <a class="identity i-guide" href="javascript:;" target="_blank">指路人</a>
            </div>
            <ul class="answer-medal fr">
                <li class="gold">
                    <div class="btn"><i></i><a href="javascript:;" target="_blank">金牌回答</a></div>
                </li>
            </ul>
        </div>
        <!-- 回答内容 -->
    <#--<div class="_j_short_answer_item hide" style="display: block;">-->
    <#--我从12年开始来北京工作，老窝一直没挪过，都在机场旁。但是我工作单位换过几家。可以来跟你们唠唠几个艰辛地方。1、机场—昌平科技园这是我最开始的上班路线。那时候昌平线只开通到南邵站。每天早上我五点半从家里出来，拼个车子到15号线国展，15-->
    <#--</div>-->
        <div class="_j_short_answer_item hide" style="display: block;">
        ${(user.context)!}
        </div>
    </div>
</li>