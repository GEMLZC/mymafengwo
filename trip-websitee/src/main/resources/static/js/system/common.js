function popup(msg) {
    $('body').append('<div id="over_container"><div id="over_message">'+msg+'</div></div>')
    setTimeout(function () {
        $('#over_container').remove();
    }, 3000)
}
//弹出，3秒消失
function popup(msg) {
    $('body').append('<div id="over_container"><div id="over_message">' + msg + '</div></div>')
    setTimeout(function () {
        $('#over_container').remove();
    }, 3000)
}

$(function () {
    $('._j_close').click(function () {
        $('#_j_layer_0').hide();
    })

    $('.collect_icon').click(function () {
        if ($(this).hasClass('on-i02')) {
            $('#_j_layer_0').show();
            $('.collect_icon').removeClass('on-i02')
        } else {
            $(this).addClass('on-i02');
        }
    });

    //景点-js
    $('._j_support_btn').click(function () {
        $('body').append('<div id="over_container"><div id="over_message">今天已经顶过</div></div>')
        setTimeout(function () {
            $('#over_container').remove();
        }, 3000)
    });


    $(window).scroll(function () {
        if ($(this).scrollTop() > 280) {
            $('.toolbar-item-top').show();
        } else {
            $('.toolbar-item-top').hide();
        }
        ;
    });

    $('.toolbar-item-top').click(function () {
        $('html, body').animate({
            scrollTop: 0
        }, 250);
        return false;
    });


});