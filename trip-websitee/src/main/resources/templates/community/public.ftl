<!DOCTYPE html>
<html>

<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <title></title>
  <link href="/styles/base.css" rel="stylesheet" type="text/css">
  <link href="/styles/public.css" rel="stylesheet" type="text/css">
  <link href="/js/datepicker/datepicker.css" rel="stylesheet">
    <link href="/styles/addtravelnote.css" rel="stylesheet" type="text/css">

  <script type="text/javascript" src="/js/jquery/jquery.min.js"></script>
    <script src="/js/plugins/datepicker/datepicker.js"></script>
    <link rel="stylesheet" href="/js/bootstrap/css/bootstrap.css" type="text/css" />
    <script type="text/javascript" src="/js/bootstrap/js/bootstrap.js"></script>
    <script src="/js/plugins/bootstrap-select/bootstrap-select.js"></script>
    <script type="text/javascript" src="/js/plugins/chosen/chosen.jquery.js"></script>
    <script src="/js/plugins/jquery-form/jquery.form.js"></script>
    <link rel="stylesheet" type="text/css" href="/js/plugins/bootstrap-select/bootstrap-select.css"/>
    <script type="text/javascript" src="/js/wangEditor/wangEditor.min.js"></script>
<script>
    function showPicker(data) {
        var html = '';
        $.each(data, function (index, item) {
            html += '<option value="' + item.id + '">'+item.name+'</option>'
        });
        $("#refIds").html(html);
        $('#refIds').selectpicker('refresh');
    }

    $(function () {
        var dests = localStorage.getItem("dests");

        if (dests == null) {
            $.get("/community/listDests", function (data) {
                showPicker(data);
                localStorage.setItem("dests", JSON.stringify(data));
            });
        } else {
            showPicker(JSON.parse(dests));
        }

        //初始化富文本编辑器
        var E = window.wangEditor;
        var editor = new E('#editor');
        // 或者 var editor = new E( document.getElementById('editor') )
        editor.customConfig.uploadImgServer = '/community/upload';
        editor.customConfig.uploadFileName = 'pic';

        /*editor.customConfig.uploadImgHooks = {
            // 如果服务器端返回的不是 {errno:0, data: [...]} 这种格式，可使用该配置
            // （但是，服务器端返回的必须是一个 JSON 格式字符串！！！否则会报错）
            customInsert: function (insertImg, result, editor) {
                // 图片上传并返回结果，自定义插入图片的事件（而不是编辑器自动插入图片！！！）
                // insertImg 是插入图片的函数，editor 是编辑器对象，result 是服务器端返回的结果

                // 举例：假如上传图片成功后，服务器端返回的是 {url:'....'} 这种格式，即可这样插入图片：
                console.log(result);
                var url = result.url;
                insertImg(url);

                // result 必须是一个 JSON 格式字符串！！！否则报错
            }
        }*/

        var $text1 = $('#text1')
        editor.customConfig.onchange = function (html) {
            // 监控变化，同步更新到 textarea
            $text1.html('');
            $text1.val(String(html))
        }
        editor.customConfig.zIndex = 100
        editor.create();
        // 初始化 textarea 的值
        //$text1.val()
        //editor.create();

        $('.qt-post-btn').click(function () {
            var txt =  editor.txt.text();//获取纯文本内容
            $('#txt').val(txt);
            console.log($('#txt').val(txt));
            $('#editFrom').submit();
        })
    })


</script>
</head>

<body>
     <#assign currentNav="travel">
    <#include "../common/navbar.ftl">
<form action="/community/save" method="post" enctype="multipart/form-data" id="editFrom">
  <div class="wrapper">
    <div class="qt-container clearfix">
      <div class="qt-main">
        <div class="crumb">
          <a href="/wenda/">旅游问答</a> &gt; <span>我要提问</span>
        </div>
        <div class="qt-tit">
          <h5>问题标题</h5>

          <div class="qt-con">
            <input type="text" name="title" placeholder="标题不小于10字哦" class="_j_title">
            <span class="count"><span class="_j_title_num">0</span>/80 字</span>
            <span class="_j_min_num hide">10</span>
            <span class="error err-tips _j_title_error">标题不能少于10字</span>
          </div>
        </div>

          <div class="qt-mdd _qa_block" id="_qa_mdd">
              <h5>选择目的地</h5>
              <div class="qt-con _qa_select" id="_qa_select_mdds">
                  <select class="form-control selectpicker" id="refIds" name="destId"
                          data-live-search="true" title="请选择关联的目的地" data-size="4" style="z-index: 999">
                  </select>
              </div>
          </div>
        <br>
        <br>
        <br>
        <br>
        <div class="qt-details">
          <h5><a title="添加问答内容" class="icon active" id="_j_show_content"></a>问题详细内容</h5>
            <div id="editor" style="width: 800px">
            </div>
        </div>
          <input id="text1" type="hidden"  name="context"/>
<#--          <input id="txt" type="hidden"  name="txt"/>
          <input id="img" type="hidden"  name="img"/>-->

        <div class="publish_question">
          <a class="qt-post-btn _j_publish" title="发布问题">发布问题</a>
        </div>
      </div>
</form>
      <div class="qt-sider">
        <div class="qts-tit">提问的正确姿势</div>
        <div class="qts-con">
          <p>1.问题要【具体】【真实】【诚恳】，问题较多，需全面阐述时，可以添加问题补充。结伴/交易/与旅行无关的提问将被删除。</p>
          <p>2.给问题添加目的地，并打上正确的标签将有助于更快地获得回答。</p>
        </div>
      </div>
    </div>
  </div>
  </div>
  </div>
  </div>
</div>
</body>

</html>
