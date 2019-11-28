<!DOCTYPE html>
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title></title>
    <link href="/styles/base.css" rel="stylesheet" type="text/css">
    <link href="/styles/addtravelnote.css" rel="stylesheet" type="text/css">
    <link href="/js/ueditor/themes/default/css/umeditor.css" type="text/css" rel="stylesheet">
    <link href="/js/plugins/datepicker/datepicker.css" rel="stylesheet">
    <script type="text/javascript" src="/js/jquery/jquery.js"></script>
    <script type="text/javascript" charset="utf-8" src="/js/ueditor/umeditor.config.js"></script>
    <script type="text/javascript" charset="utf-8" src="/js/ueditor/umeditor.min.js"></script>
    <script type="text/javascript" src="/js/ueditor/lang/zh-cn/zh-cn.js"></script>
    <script src="/js/plugins/datepicker/datepicker.js"></script>
    <script src="/js/plugins/jquery-form/jquery.form.js"></script>
    <link href="/js/plugins/chosen/chosen.css" rel="stylesheet" type="text/css">
    <script type="text/javascript" src="/js/plugins/chosen/chosen.jquery.js"></script>
    <script type="text/javascript" src="/js/system/common.js"></script>
    <script type="text/javascript" src="/js/system/addtravelnote.js"></script>
    <script>
        $(function () {
            $(".chose_pic").click(function () {
                $("#coverBtn").click();
            })
            $("#coverBtn").change(function () {
                if(this.value){
                    $("#coverForm").ajaxSubmit(function (data) {
                        $(".choseBtn").html(" + 重新选择");
                        $("#coverImage").attr("src", "/" +data);
                        $("#coverValue").val("/" + data);
                    })
                }
            })

            //保存或发表
            $(".btn_submit, .btn_save").click(function () {
                $("#state").val($(this).data("state"));
                $("#editForm").ajaxSubmit(function (data) {
                    if(data.success){
                        window.location.href = "/travel/detail?id=" + data.data
                    }else{
                        popup("操作失败");
                    }
                })
            })

            //目的地
            $("#region").chosen();

            <#if tv??>
            $.get("/travel/getContent", {id: ${tv.id}}, function(data) {
                ue.setContent(data.content);
            });
            </#if>
        })
    </script>
    <style type="text/css">
        /*#content_div img {
            width: 100%;
        }*/
        #coverImage {
            width: 100%;
        }
    </style>
</head>
<body>
    <#assign currentNav="travel">
    <#include "../common/navbar.ftl">

    <!--文件上传-->
    <form action="/travel/coverImageUpload" method="post" id="coverForm" enctype="multipart/form-data">
        <input type="file" name="pic" id="coverBtn" style="display: none;">
    </form>

    <div class="wrapper">
        <div class="ap-head">
            <h1>发表新话题/文章</h1>
            <dl d-data="1" class="on">
                <dt>游记</dt>
                <dd>关联至具体的旅行目的地</dd>
            </dl>
            <dl d-data="2" class="">
                <dt>随笔</dt>
                <dd>只在我的骡窝窝显示</dd>
            </dl>
            <div class="clearfix"></div>
        </div>
        <div class="ap-wrap">
            <div class="ap-main">
                <form class="forms" action="/travel/saveOrUpdate" method="post" id="editForm">
                    <input type="hidden" name="id" value="${(tv.id)!}">
                    <input type="hidden" name="state" id="state">


                    <dl class="title cf">
                        <dd>
                            <label class="" style="display: block;">请在这里输入标题</label>
                            <span class="char-limit _j_char_limit hide">可输入<strong>48</strong>字</span>
                            <input id="title" name="title" type="text" maxlength="48"  value="${(tv.title)!}">
                        </dd>
                    </dl>
                    <dl>
                        <dd>
                            <div class="chose_pic">
                                <img src="${(tv.coverUrl)!}" id="coverImage"><span class="choseBtn">+ 选择封面</span>
                                <input type="hidden" name="coverUrl" id="coverValue" value="${(tv.coverUrl)!}">
                            </div>
                        </dd>
                    </dl>
                    <dl>
                        <div class="pi-base">
                            <div class="pi-row">
                                <div class="pi-col pi-date"> <label>出发时间</label> <input
                                        class="pi-input _j_dateinput hasDatepicker" type="text" name="travelTime"
                                        style="z-index: 551; position: relative;margin-right: 10px;"
                                        data-toggle="datepicker" value="${(tv.travelTime?string('yyyy-MM-dd'))!}">
                                </div>
                                <div class="pi-col pi-person"> <label>人物</label>
                                    <div class="pi-dropdown _j_piDrop">
                                        <div class="toggle"> <input type="hidden" class="_j_personhiddeninput"
                                                name="person" value="2"> <i class="pi-icon-caret "></i> <input
                                                class="pi-input _j_personinput _j_person" placeholder="选择出行人物"
                                                type="text"> </div>
                                        <ul class="dropdown-menu _j_piDropMenu hide" style="display: none;">
                                            <li data-person="1" class="_j_personitem"><a role="button">一个人</a></li>
                                            <li data-person="2" class="_j_personitem"><a role="button">情侣/夫妻</a></li>
                                            <li data-person="3" class="_j_personitem"><a role="button">带孩子</a></li>
                                            <li data-person="4" class="_j_personitem"><a role="button">家庭出游</a></li>
                                            <li data-person="5" class="_j_personitem"><a role="button"> 和朋友</a></li>
                                            <li data-person="6" class="_j_personitem"><a role="button">和同学</a></li>
                                            <li data-person="7" class="_j_personitem"><a role="button">其它</a></li>
                                        </ul>

                                        <script>
                                            $("._j_personhiddeninput").val(${(tv.person)!});
                                            var v = $("._j_piDropMenu li[data-person=${(tv.person)!}]").find("a").text();
                                            $("._j_personinput").val(v);
                                        </script>
                                    </div>
                                </div>
                                <div class="pi-col pi-date" style="margin-left: 2%;"> <label for="isopen">是否公开</label>
                                    <input class="pi-input" style="margin-top: 13px;width:15px; height: 15px;"
                                           name="overt" value="1"
                                        type="checkbox" id="isopen" />

                                    <script>
                                        $("#isopen").attr("checked", ${(tv.overt)!0})
                                    </script>
                                </div>
                            </div>
                            <div class="pi-row">
                                <div class="pi-col pi-day"> <label>出行天数</label> <input id="days"
                                        style="margin-right: 10px;" class="pi-input" type="number" min="1" placeholder="输入天数"
                                        name="days" value="${(tv.days)!}"> </div>
                                <div class="pi-col pi-day"> <label>人均花费/RMB</label> <input id="expense" class="pi-input"
                                        type="text" placeholder="输入花费" name="perExpends" value="${(tv.perExpends)!}"> </div>
                                <div class="pi-col pi-date" style="margin-left: 2%;"> <label for="isopen">旅游地点</label>
                                    <div class="pi-dropdown "style="text-align: left" >
                                        <select name="dest.id" data-placeholder="请选择目的地" id="region" style="width: 150px;">
                                            <#list dests as r>
                                                <option value="${r.id!}">${r.name!}</option>
                                            </#list>
                                        </select>

                                        <script>
                                            $("#region").val(${(tv.dest.id)!});
                                        </script>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </dl>
                    <dl class="body cf">
                        <dd id="content_div">
                            <script id="editor" type="text/plain" style="width:100%;height:500px;"></script>
                        </dd>
                    </dl>
                    <div class="btns">
                        <div class="accept_pact">
                            <input type="checkbox" checked>
                            我已阅读并同意<a href="javascript:;" title="《骡窝窝游记协议》" target="_blank">《骡窝窝游记协议》</a>
                        </div>
                        <input class="btn_submit" value="发表" type="button" data-state="1">
                        <div class="cont">或者</div>
                        <input class="btn_save" value="保存草稿" type="button" data-state="0">
                    </div>
                </form>
            </div>
        </div>
    </div>
    <#include "../common/footer.ftl">
</body>

</html>