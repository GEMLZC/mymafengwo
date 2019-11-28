$(function () {
  // 初始化富文本编辑器
  var ue = UM.getEditor('editor');
  $('._j_title').bind('input propertychange', function () {
    var MAXLENGTH = 80;
    var val = $(this).val();
    if (MAXLENGTH - val.length >= 0) {
      $(this).next().find('._j_title_num').html(val.length);
    }
  });
});