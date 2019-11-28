<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <title></title>
  <link href="/styles/base.css" rel="stylesheet" type="text/css">
  <link href="/js/datepicker/datepicker.css" rel="stylesheet">
  <link href="/styles/wenda.css" rel="stylesheet" type="text/css">
  <script type="text/javascript" src="/js/jquery/jquery.js"></script>
  <script type="text/javascript" src="/js/wenda.js"></script>
</head>
 <style type="text/css">
     ._contest{
         overflow: hidden;
         text-overflow: ellipsis;
         display: -webkit-box;
         -webkit-line-clamp: 3;
         -webkit-box-orient: vertical;
     }
 </style>

<body style="position: relative;">

<#include "../common/topTpl.ftl">

  <div class="wrapper wrapper-new">
    <div class="col-main">
      <div class="newcate-wrap _j_qa_list">
        <div class="bd newcate-bd">
          <ul class="_j_pager_box">

          <#list detail as d>
            <li class="item clearfix _j_question_item listViewTitle" data-qid="${d.id}" >
              <div class="title">
                <a href="/community/wendaDetail?id=${d.id}" target="_blank" data-qid="${d.id}" class="listViewTitle">${d.title!}</a> </div>
              <div class="container">
            <#if d.user ??>
                <div class="avatar"><a href="javascript:;" target="_blank" class="_j_filter_click">

                        <img class="_j_filter_click"
                          src="${(d.user.headImgUrl)!}">

                </a>
                </div>
                <div class="user-info">
                  <a class="name _j_filter_click" href="javascript:;" target="_blank">${(d.user.nickname)!}</a>
                  <a class="level _j_filter_click" href="javascript:;" target="_blank" rel="nofollow">LV.${(d.user.level)!}</a>
                </div>
            </#if>
                <div class="desc clearfix" >
                    <a href="/community/wendaDetail?id=${d.id}"  >
                      <#if d.imgUrl ??>
			            <img src="${d.imgUrl!}" width="150" height="100">
                      </#if>
                        <p class="_contest">
                          ${d.txt!}
                        </p>
                    </a>
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
          </ul>
            <div class="_j_pager">
                <div class="ft ft_load_btn">
                    <div class="answer-more _j_add_more_button ">
                        <a>加载更多<i></i></a>
                    </div>
                </div>
                <div class="ft ft_loading _j_add_loading_button hide" style="display: none">
                    <div class="answer-loading">正在加载<i></i></div>
                </div>
            </div>
        </div>
        <script>
            $(function () {
                var currentPage = 2;
                $('._j_add_more_button').click(function () {
                    $.get('/community/wenDaList',{currentPage:currentPage},function (data) {
                        $('._j_pager_box').append(data);
                        currentPage++;
                    })
                })
            })
        </script>
      </div>
    </div>

    <div class="col-side">
        <div class="i-ask" style="background-color: #FE9C0F">
            <a href="/community" class="btn-ask btn-ask2"><i></i><p style="text-align:center;"> <font size="4" style="color: white">我要提问</font></p></a>
        </div>

      <div class="rank _j_rank" style="margin-top: 20px;">
        <div class="hd">排行榜<ul class="tab-time">
            <li class="_j_rank_change_date" data-type="0"><span>今日</span></li>
            <li class="_j_rank_change_date on" data-type="1"><span>本周</span></li>
            <li class="_j_rank_change_date" data-type="2"><span>本月</span></li>
          </ul>
        </div>


        <div class="bd">
          <ul class="tab-num" data-cs-p="rank_list">
            <li class="_j_rank_change_flag" data-rank="0" data-cs-d="金牌数">金牌数</li>
            <li class="_j_rank_change_flag on" data-rank="1" data-cs-d="回答数">回答数</li>
            <li class="_j_rank_change_flag" data-rank="2" data-cs-d="被顶次数">被顶次数</li>

          </ul>
          <ul class="rank-list _j_rank_list">
              <#list sort as s>
                  <#if s_index+1 <= 3>
                    <li class="r-top r-top${s_index+1} clearfix">
                  <#else >
                  <li class="clearfix">
                  </#if>
                  <em class="num">${s_index+1}</em>
                  <div class="user no_qid">
                    <a class="avatar" href="javascript:;" target="_blank" rel="nofollow"><img src="${s.headImgUrl!}" style="width: 100%;border-radius: 50%"></a>
                    <span class="name"><a href="javascript:;" target="_blank"
                        rel="nofollow">${s.nickname!}</a></span>
                    <span class="level"><a href="javascript:;" target="_blank"
                        rel="nofollow">LV${s.level!}</a></span>
                  </div>
                  <span class="num">${s.replyNum!}</span>
                </li>
              </#list>
          </ul>
        </div>

      </div>
    </div>
  </div>
</body>
<script>
</script>