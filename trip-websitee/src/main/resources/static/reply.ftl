<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
</head>
<body>
 <div class="bd _j_pager_box">
     <ul class="answer-list answer_detail">
         <div>
             <li>
                 <div class="answer-content _js_answer_content">
                     <div class="answer-info clearfix">
                         <div class="user-bar fl">
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
                     <div class="_j_short_answer_item hide" style="display: block;">
                         ${(user.context)!}
                     </div>
                 </div>
             </li>
         </div>
     </ul>
 </div>
</html>