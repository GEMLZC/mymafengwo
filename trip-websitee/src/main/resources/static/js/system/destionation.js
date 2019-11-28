$(function() {
    $('.mfw-header').on('mouseenter', function() {
        $(this).removeClass('header-place-default');
    }).on('mouseleave', function() {
        $(this).addClass('header-place-default');
    });

    $('.search-input').bind('input propertychange', function() {
        var val = $(this).val();
        // debugger;
        if (val) {
            $('.search-suggest-panel').show();
        } else {
            $('.search-suggest-panel').hide();
        }
    });
    $('.search-suggest-panel').on('mouseenter', function() {

    }).on('mouseleave', function() {
        var self = this;
        setTimeout(function() {
            $(self).hide();
        }, 1500);
    });



    //获取国内数据
    $.get("/destination/listHotDestByRegionId", {regionId:-1}, function (data) {
        $("#hotContent").append(data);

    });
    $.get("/destination/listHotDestByMonthId", {mid:1}, function (data) {
        $(".J_seasonmdds").append(data);

    });
    $.get("/destination/listdestByThemesId",{themeId:1}, function (data) {
        $(".J_catemdds").append(data);
    });

    //区域
    $('.row-hot .r-navbar a').on('mouseenter', function() {
        var rid = $(this).data("rid");
        if(!rid){
            return;
        }
        $('.row-hot .r-navbar a').removeClass('on');
        $(this).addClass('on');

        $('.row-hot .hot-list').addClass('hide');

        //请求页面
        if($(".hot-list-"+rid).size() != 0){
            $(".hot-list-"+rid).removeClass('hide');
            return;
        }
        $.get("/destination/listHotDestByRegionId", {regionId:rid}, function (data) {
            if($(".hot-list-"+rid).size() == 0){
                $("#hotContent").append(data);
            }
            $(".hot-list-"+rid).removeClass('hide');
        })

    });

    //月份滑动图片改动
    $('.pagelet-block .r-navbar a').on('hover', function() {

        var mid = $(this).data("mid");
        console.log(mid);
        $('.pagelet-block .r-navbar a').removeClass('on');
        $(this).addClass('on');
        $('.pagelet-block .tiles').addClass('hide');
        //请求页面
        if($(".tile-list-"+mid).size() != 0){
            $(".tile-list-"+mid).removeClass('hide');
            return;
        }
        $.get("/destination/listHotDestByMonthId",{mid:mid}, function (data) {
            if($(".tile-list-"+mid).size() == 0){
                $(".J_seasonmdds").append(data);
            }
            $(".tile-list-"+mid).removeClass('hide');
        })
    });


    //主题改动
    $('.pagelet-block1 .r-navbar a').on('hover', function() {
        var tid = $(this).data("tid");
        console.log(tid);
        $('.pagelet-block1 .r-navbar a').removeClass('on');
        $(this).addClass('on');
        $('.pagelet-block1 .tiles').addClass('hide');
        //请求页面
        if($(".tile-lis-"+tid).size() != 0){
            $(".tile-lis-"+tid).removeClass('hide');
            return;
        }

        $.get("/destination/listdestByThemesId",{themeId:tid}, function (data) {
            if($(".tile-lis-"+tid).size() == 0){
                $(".J_catemdds").append(data);
            }
            $(".tile-lis-"+tid).removeClass('hide');
        })
    });

    $('.suggest-list li').click(function() {
        window.location.href = "./index.ftl"
    })
});

$(function() {
    $('.mfw-header').on('mouseenter', function() {
        $(this).removeClass('header-place-default');
    }).on('mouseleave', function() {
        $(this).addClass('header-place-default');
    });

    $('.search-input').bind('input propertychange', function() {
        var val = $(this).val();
        // debugger;
        if (val) {
            $('.search-suggest-panel').show();
        } else {
            $('.search-suggest-panel').hide();
        }
    });
    $('.search-suggest-panel').on('mouseenter', function() {
    }).on('mouseleave', function() {
        var self = this;
        setTimeout(function() {
            $(self).hide();
        }, 1500);
    });

});