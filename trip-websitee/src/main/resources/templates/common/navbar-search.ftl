<div class="s-head">
    <div class="wid clearfix">
        <div class="s-head-logo">
            <a href="/"></a>
        </div>
        <div class="searchbar">
            <div class="search-wrapper">
                <form action="/q" method="get" id="kwSearchForm">
                    <input type="hidden" name="type" value="${qo.type}" id="searchType">
                    <div class="search-input"><input name="keyword" type="text" id="_j_search_input" value="${qo.keyword!}"
                                                     placeholder="搜目的地/攻略/游记/用户" autocomplete="off" ></div>
                </form>
            </div>
            <div class="search-button"><a role="button" href="javascript:" id="_j_search_button"><i
                    class="icon-search"></i></a></div>
        </div>
        <div id="pagelet-block-6d34f3fc7bb6504c1b634be7d8ff2a67" class="pagelet-block"
             data-api="apps:user:pagelet:pageViewHeadInfo" data-params="{&quot;type&quot;:1}" data-async="1"
             data-controller="/js/pageletcommon/pageHeadUserInfoWWWNormal">
            <div class="login-info">
                <div class="head-user" id="_j_head_user">
                    <a class="drop-trigger" href="javascript:;" title="骡窝窝用户的窝" rel="nofollow">
                        <div class="user-image"><img src="/images/default.png" height="32" width="32" alt="骡窝窝用户的窝"></div>
                        <i class="icon-caret-down"></i>
                    </a>
                </div>
                <div class="head-msg" id="_j_head_msg">
                    <a class="drop-trigger" href="javascript:" rel="nofollow">
                        <i class="icon-msg"></i>
                        消息
                        <i class="icon-caret-down"></i>
                        <span class="head-msg-new hide" style="display: none;"></span>
                    </a>

                </div>
                <div class="head-daka ">
                    <a class="btn head-btn-daka" href="javascript:" rel="nofollow" id="head-btn-daka" title="打卡"
                       data-japp="daka">打卡</a>
                    <a class="btn-active head-btn-daka" href="javascript:" rel="nofollow" id="head-btn-daka-active"
                       title="已打卡" data-japp="daka">已打卡</a>
                </div>
            </div>
        </div>
    </div>
</div>