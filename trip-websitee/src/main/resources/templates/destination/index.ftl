<!DOCTYPE html>
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title></title>
    <link href="/styles/base.css" rel="stylesheet" type="text/css">
    <link href="/styles/destination.css" rel="stylesheet" type="text/css">
    <script type="text/javascript" src="/js/jquery/jquery.js"></script>
    <script type="text/javascript" src="/js/common.js"></script>
    <script type="text/javascript" src="/js/system/destionation.js"></script>


</head>

<body>
    <#assign currentNav="destination">
    <#include "../common/navbar.ftl">
    <div class="container">
        <div class="place-focus" data-cs-p="头图">
            <div class="show-banner show-info-notes">
                <div class="cover" style="height: auto;">
                    <a class="bigimg" href="javascript:;" target="_blank" data-cs-l="图片" style="height: 400px;">
                        <div class="shade"></div>
                        <img data-ow="1776" data-oh="1184" src="https://p1-q.mafengwo.net/s13/M00/F9/34/wKgEaVzOi--AfG8vABekLtngwCo63.jpeg" style="margin: -249.667px 0px 0px; width: 100%; height: auto;">
                    </a>
                </div>
                <div class="show-info show-info-sm">
                    <div class="owner">
                    </div>
                    <div class="show-name">
                        <a href="javascript:;" target="_blank" data-t="目的地">
                            <h2>成都 | 独具风情的蜀都蓉城，咫尺天堂的人间烟火</h2><span></span>
                        </a>
                    </div>
                    <p class="location">关于成都，有这样一句话“少不入川，老不出蜀”。如果你来过成都，你一定会觉得是这样的。</p>
                    <div class="show-links">
                        <a href="javascript:;" target="_blank">阅读全文</a>
                    </div>
                </div>
                <div class="show-shadow"></div>
                <div class="show-ft">
                    <div class="show-ft-item pic-from">
                        <i></i>
                        <div class="pic-from-pop">
                            <span>
                                <a href="javascript:;" target="_blank" data-t="作者">林琛Live</a>
                                的作品
                            </span>
                            <em></em>
                        </div>
                    </div>
                    <span class="show-ft-item"><a class="show-icon-download" href="javascript:;"
                            title="下载壁纸"></a></span>
                    <span class="show-ft-item"><a class="show-icon-calendar" href="javascript:;"
                            target="_blank">13</a></span>
                    <div class="show-ft-item pic-share">
                        <a class="btn-share" href="javascript:void(0)"><i></i>分享</a>
                        <div class="pop-share" id="_j_sharecnt" style="display: none">
                            <a class="s-weibo" href="javascript:void(0)"><i></i></a>
                            <a class="s-qzone" href="javascript:void(0)"><i></i></a>
                            <a class="s-weixin" href="javascript:void(0)"><i></i></a>
                        </div>
                    </div>
                </div>
                <a class="show-arrdown" href="#" data-cs-l="锚点下箭头"></a>
            </div>
            <div class="place-search-panel place-search-panel-sm">
                <h2>Don't fear the unknown</h2>
                <form name="mdd-search-form" action="/destination/search" id="search">
                    <div class="searchbar">
                        <input autocomplete="off" class="search-input" type="text" name="destName" placeholder="我想去...">
                        <a class="search-button" href="#" data-cs-l="搜索" role="button"><i class="icon-search"></i></a>
                    </div>
                </form>
                <script>
                    $('.search-button').click(function () {
                        $('#search').submit();
                    })
                </script>

                <div class="search-suggest-panel search-suggest-place hide" style="display: none;">
                    <ul class="suggest-list">
                        <li class="active"><i class="sicon-place"></i><span class="skey">广州</span><span>中国</span></li>
                        <li class=""><i class="sicon-place"></i><span class="skey">贵州</span></li>
                        <li class=""><i class="sicon-place"></i><span class="skey">甘孜</span><span>中国</span></li>
                            <li class=""><i class="sicon-place"></i><span class="skey">广州长隆旅游度假区</span><span>广东</span></li>
                        <li class=""><i class="sicon-place"></i><span class="skey">赣州</span><span>中国</span></li>
                    </ul>
                </div>
                <div class="place-search-hot"><a href="javascript:;">北京</a><a href="javascript:;">重庆</a><a href="javascript:;">普吉岛</a><a href="javascript:;">台湾</a><a href="javascript:;">清迈</a></div>
            </div>
        </div>
        <div class="row row-hot">
            <div class="wrapper">
                <div class="r-title">
                    <h2>热门目的地</h2>
                </div>
                <div class="r-navbar">

                    <a href="javascript:void(0)" class="on"  data-rid="-1">国内</a><span class="divide">|</span>
                    <#list hotRegions as r>
                        <a href="javascript:void(0)"  data-rid="${r.id}">${r.name}</a><span class="divide">|</span>
                    </#list>
                </div>
                <div id="hotContent">

                </div>
            </div>
        </div>
        <div class="row-line"></div>
        <div class="pagelet-block">
            <div class="row row-season row-bg">
                <div class="wrapper">
                        <div class="r-title">
                            <h2>当季推荐</h2>
                        </div>
                    <div class="r-navbar">
                    <#list months as m>
                        <a class="${(m.id==1)?string('on','')}" href="javascript:void(0)" data-mid="${m.id!}">${m.name!}</a>
                            <#if m_index+1 != 12>
                                <span class="divide">|</span>
                            </#if>
                    </#list>
                    </div>
                    <div class="J_seasonmdds">
                    </div>
                </div>
            </div>
            <div class="row-line"></div>
        </div>
        <div class="pagelet-block1">
            <div class="row row-theme">
                <div class="wrapper">
                    <div class="r-title">
                        <h2>主题精选</h2>
                    </div>
                    <div class="r-navbar">
                        <#list destThemes as t>
                        <a class="${(t.id==1)?string('on','')}"" href="javascript:void(0)" data-tid="${t.id!}">${t.name!}</a><span class="divide">|</span>
                        </#list>
                    </div>
                    <div class="J_catemdds">
                    </div>
                </div>
            </div>
            <div class="row-line"></div>
        </div>
        <div class="row row-state row-bg">
            <div class="wrapper">
                <div class="row-list" data-cs-p="全球目的地">
                    <h2 class="hd">全球目的地<span>（按拼音首字母排序）</span></h2>
                    <div class="bd">
                        <dl class="item">
                            <dt class="sub-title">亚洲</dt>
                            <dd class="clearfix">
                                <ul class="col">
                                    <li class="letter">A</li>
                                    <li><a href="javascript:;" target="_blank">阿富汗 <span
                                                class="en">Afghanistan</span></a></li>
                                    <li><a href="javascript:;" target="_blank">阿联酋 <span class="en">United Arab
                                                Emirates</span></a>
                                    </li>
                                    <li><a href="javascript:;" target="_blank">阿曼 <span class="en">Sultanate of
                                                Oman</span></a></li>
                                    <li><a href="javascript:;" target="_blank">阿塞拜疆 <span
                                                class="en">Azerbaijan</span></a></li>
                                    <li class="letter">B</li>
                                    <li><a href="javascript:;" target="_blank">巴基斯坦 <span class="en">Pakistan</span></a>
                                    </li>
                                    <li><a href="javascript:;" target="_blank">巴勒斯坦 <span
                                                class="en">Palestine</span></a>
                                    </li>
                                    <li><a href="javascript:;" target="_blank">巴林 <span class="en">Bahrain</span></a>
                                    </li>
                                    <li><a href="javascript:;" target="_blank">不丹 <span class="en">Bhutan</span></a>
                                    </li>
                                    <li class="letter">C</li>
                                    <li><a href="javascript:;" target="_blank">朝鲜 <span class="en">North
                                                Korea</span></a>
                                    </li>
                                    <li class="letter">D</li>
                                    <li><a href="javascript:;" target="_blank">东帝汶 <span class="en">East
                                                Timor</span></a>
                                    </li>
                                    <li class="letter">F</li>
                                    <li><a href="javascript:;" target="_blank">菲律宾 <span
                                                class="en">Philippines</span></a><i class="icon-label"></i></li>
                                    <li class="letter">G</li>
                                    <li><a href="javascript:;" target="_blank">格鲁吉亚 <span class="en">Georgia</span></a>
                                    </li>
                                    <li class="letter">H</li>
                                    <li><a href="javascript:;" target="_blank">哈萨克斯坦 <span class="en">The Republic of
                                                Kazakhstan</span></a>
                                    </li>
                                    <li><a href="javascript:;" target="_blank">韩国 <span class="en">Korea</span></a><i class="icon-label"></i></li>
                                    <li class="letter">J</li>
                                    <li><a href="javascript:;" target="_blank">吉尔吉斯斯坦 <span
                                                class="en">Kyrgyzstan</span></a></li>
                                    <li><a href="javascript:;" target="_blank">柬埔寨 <span
                                                class="en">Cambodia</span></a><i class="icon-label"></i></li>
                                </ul>
                                <ul class="col">
                                    <li class="letter">K</li>
                                    <li><a href="javascript:;" target="_blank">卡塔尔 <span class="en">The State of
                                                Qatar</span></a>
                                    </li>
                                    <li><a href="javascript:;" target="_blank">科威特 <span class="en">The State of
                                                Kuwait</span></a>
                                    </li>
                                    <li class="letter">L</li>
                                    <li><a href="javascript:;" target="_blank">老挝 <span class="en">Laos</span></a><i class="icon-label"></i></li>
                                    <li><a href="javascript:;" target="_blank">黎巴嫩 <span class="en">Lebanon</span></a>
                                    </li>
                                    <li class="letter">M</li>
                                    <li><a href="javascript:;" target="_blank">马尔代夫 <span
                                                class="en">Maldives</span></a><i class="icon-label"></i></li>
                                    <li><a href="javascript:;" target="_blank">马来西亚 <span
                                                class="en">Malaysia</span></a><i class="icon-label"></i></li>
                                    <li><a href="javascript:;" target="_blank">蒙古 <span class="en">Mongolia</span></a>
                                    </li>
                                    <li><a href="javascript:;" target="_blank">孟加拉国 <span
                                                class="en">Bangladesh</span></a></li>
                                    <li><a href="javascript:;" target="_blank">缅甸 <span class="en">Myanmar</span></a><i class="icon-label"></i></li>
                                    <li class="letter">N</li>
                                    <li><a href="javascript:;" target="_blank">尼泊尔 <span class="en">Nepal</span></a><i class="icon-label"></i></li>
                                    <li class="letter">R</li>
                                    <li><a href="javascript:;" target="_blank">日本 <span class="en">Japan</span></a><i class="icon-label"></i></li>
                                    <li class="letter">S</li>
                                    <li><a href="javascript:;" target="_blank">沙特阿拉伯 <span class="en">Saudi
                                                Arabia</span></a></li>
                                    <li><a href="javascript:;" target="_blank">斯里兰卡 <span class="en">Sri
                                                Lanka</span></a>
                                    </li>
                                    <li class="letter">T</li>
                                    <li><a href="javascript:;" target="_blank">塔吉克斯坦 <span
                                                class="en">Tajikistan</span></a></li>
                                    <li><a href="javascript:;" target="_blank">泰国 <span class="en">Thailand</span></a><i class="icon-label"></i></li>
                                </ul>
                                <ul class="col">
                                    <li><a href="javascript:;" target="_blank">土库曼斯坦 <span
                                                class="en">Turkmenistan</span></a></li>
                                    <li class="letter">W</li>
                                    <li><a href="javascript:;" target="_blank">文莱 <span class="en">Brunei
                                                Darussalam</span></a></li>
                                    <li><a href="javascript:;" target="_blank">乌兹别克斯坦 <span class="en">The Republic of
                                                Uzbekistan</span></a>
                                    </li>
                                    <li class="letter">X</li>
                                    <li><a href="javascript:;" target="_blank">新加坡 <span
                                                class="en">Singapore</span></a><i class="icon-label"></i></li>
                                    <li><a href="javascript:;" target="_blank">叙利亚 <span class="en">The Syrian Arab
                                                Republic</span></a>
                                    </li>
                                    <li class="letter">Y</li>
                                    <li><a href="javascript:;" target="_blank">亚美尼亚 <span class="en">The Republic of
                                                Armenia</span></a>
                                    </li>
                                    <li><a href="javascript:;" target="_blank">也门 <span class="en">The Republic of
                                                Yemen</span></a>
                                    </li>
                                    <li><a href="javascript:;" target="_blank">伊拉克 <span class="en">Iraq</span></a>
                                    </li>
                                    <li><a href="javascript:;" target="_blank">伊朗 <span class="en">Iran</span></a>
                                    </li>
                                    <li><a href="javascript:;" target="_blank">以色列 <span class="en">Israel</span></a>
                                    </li>
                                    <li><a href="javascript:;" target="_blank">印度 <span class="en">India</span></a><i class="icon-label"></i></li>
                                    <li><a href="javascript:;" target="_blank">印度尼西亚 <span
                                                class="en">Indonesia</span></a><i class="icon-label"></i></li>
                                    <li><a href="javascript:;" target="_blank">约旦 <span class="en">Jordan</span></a>
                                    </li>
                                    <li><a href="javascript:;" target="_blank">越南 <span class="en">Vietnam</span></a><i class="icon-label"></i></li>
                                    <li class="letter">Z</li>
                                    <li><a href="javascript:;" target="_blank">中国 <span class="en">China</span></a> <img class="domestic" style="width: 34px;margin-left: 20px;cursor: pointer" src="http://css.mafengwo.net/images/mdd/place/flag.jpg">
                                    </li>
                                </ul>
                            </dd>
                        </dl>
                        <dl class="item">
                            <dt class="sub-title">北美洲</dt>
                            <dd class="clearfix">
                                <ul class="col">
                                    <li class="letter">A</li>
                                    <li><a href="javascript:;" target="_blank">安提瓜和巴布达 <span class="en">Antigua and
                                                Barbuda</span></a>
                                    </li>
                                    <li class="letter">B</li>
                                    <li><a href="javascript:;" target="_blank">巴巴多斯 <span class="en">Barbados</span></a>
                                    </li>
                                    <li><a href="javascript:;" target="_blank">巴哈马 <span class="en">Bahamas</span></a>
                                    </li>
                                    <li><a href="javascript:;" target="_blank">巴拿马 <span class="en">Panama</span></a>
                                    </li>
                                    <li><a href="javascript:;" target="_blank">伯利兹 <span class="en">Belize</span></a>
                                    </li>
                                    <li class="letter">D</li>
                                    <li><a href="javascript:;" target="_blank">多米尼加 <span class="en">Dominican
                                                Republic</span></a>
                                    </li>
                                    <li><a href="javascript:;" target="_blank">多米尼克 <span class="en">Dominica</span></a>
                                    </li>
                                    <li class="letter">G</li>
                                    <li><a href="javascript:;" target="_blank">哥斯达黎加 <span class="en">Costa
                                                Rica</span></a></li>
                                </ul>
                                <ul class="col">
                                    <li><a href="javascript:;" target="_blank">格林纳达 <span class="en">Grenada</span></a>
                                    </li>
                                    <li><a href="javascript:;" target="_blank">古巴 <span class="en">Cuba</span></a><i class="icon-label"></i></li>
                                    <li class="letter">H</li>
                                    <li><a href="javascript:;" target="_blank">海地 <span class="en">Haiti</span></a>
                                    </li>
                                    <li><a href="javascript:;" target="_blank">洪都拉斯 <span class="en">Republic of
                                                Honduras</span></a>
                                    </li>
                                    <li class="letter">J</li>
                                    <li><a href="javascript:;" target="_blank">加拿大 <span class="en">Canada</span></a><i class="icon-label"></i></li>
                                    <li class="letter">M</li>
                                    <li><a href="javascript:;" target="_blank">美国 <span class="en">United States of
                                                America</span></a>

                                        <a class="texas" style="margin-left: 0" href="javascript:;" target="_blank">德克萨斯</a>
                                    </li>
                                    <li><a href="javascript:;" target="_blank">墨西哥 <span class="en">The United Mexican
                                                States</span></a><i class="icon-label"></i></li>
                                    <li class="letter">N</li>
                                    <li><a href="javascript:;" target="_blank">尼加拉瓜 <span
                                                class="en">Nicaragua</span></a>
                                    </li>
                                </ul>
                                <ul class="col">
                                    <li class="letter">S</li>
                                    <li><a href="javascript:;" target="_blank">萨尔瓦多 <span class="en">El
                                                Salvador</span></a></li>
                                    <li><a href="javascript:;" target="_blank">圣基茨和尼维斯 <span class="en">Saint Kitts and
                                                Nevis</span></a>
                                    </li>
                                    <li><a href="javascript:;" target="_blank">圣卢西亚 <span class="en">Saint
                                                Lucia</span></a></li>
                                    <li><a href="javascript:;" target="_blank">圣文森特和格林纳丁斯 <span class="en">Saint Vincent
                                                and the Grenadines</span></a>
                                    </li>
                                    <li class="letter">T</li>
                                    <li><a href="javascript:;" target="_blank">特立尼达和多巴哥 <span class="en">Trinidad and
                                                Tobago</span></a>
                                    </li>
                                    <li class="letter">W</li>
                                    <li><a href="javascript:;" target="_blank">危地马拉 <span
                                                class="en">Guatemala</span></a>
                                    </li>
                                    <li class="letter">Y</li>
                                    <li><a href="javascript:;" target="_blank">牙买加 <span class="en">Jamaica</span></a>
                                    </li>
                                </ul>
                            </dd>
                        </dl>
                        <dl class="item">
                            <dt class="sub-title">南美洲</dt>
                            <dd class="clearfix">
                                <ul class="col">
                                    <li class="letter">A</li>
                                    <li><a href="javascript:;" target="_blank">阿根廷 <span
                                                class="en">Argentina</span></a><i class="icon-label"></i></li>
                                    <li class="letter">B</li>
                                    <li><a href="javascript:;" target="_blank">巴拉圭 <span class="en">Paraguay</span></a>
                                    </li>
                                    <li><a href="javascript:;" target="_blank">巴西 <span class="en">Brazil</span></a><i class="icon-label"></i></li>
                                    <li><a href="javascript:;" target="_blank">秘鲁 <span class="en">The Republic of
                                                Peru</span></a>
                                    </li>
                                </ul>
                                <ul class="col">
                                    <li><a href="javascript:;" target="_blank">玻利维亚 <span
                                                class="en">Bolivia</span></a><i class="icon-label"></i></li>
                                    <li class="letter">E</li>
                                    <li><a href="javascript:;" target="_blank">厄瓜多尔 <span class="en">Ecuador</span></a>
                                    </li>
                                    <li class="letter">G</li>
                                    <li><a href="javascript:;" target="_blank">哥伦比亚 <span
                                                class="en">Colombia</span></a><i class="icon-label"></i></li>
                                    <li><a href="javascript:;" target="_blank">圭亚那 <span class="en">Guyana</span></a>
                                    </li>
                                </ul>
                                <ul class="col">
                                    <li class="letter">S</li>
                                    <li><a href="javascript:;" target="_blank">苏里南 <span class="en">The Republic of
                                                Suriname</span></a>
                                    </li>
                                    <li class="letter">W</li>
                                    <li><a href="javascript:;" target="_blank">委内瑞拉 <span class="en">Bolivarian Republic
                                                of Venezuela</span></a>
                                    </li>
                                    <li><a href="javascript:;" target="_blank">乌拉圭 <span class="en">The Oriental
                                                Republic of Uruguay</span></a>
                                    </li>
                                    <li class="letter">Z</li>
                                    <li><a href="javascript:;" target="_blank">智利 <span class="en">Republic of
                                                Chile</span></a><i class="icon-label"></i></li>
                                </ul>
                            </dd>
                        </dl>
                        <dl class="item">
                            <dt class="sub-title">欧洲</dt>
                            <dd class="clearfix">
                                <ul class="col">
                                    <li class="letter">A</li>
                                    <li><a href="javascript:;" target="_blank">阿尔巴尼亚 <span class="en">The Republic of
                                                Albania</span></a>
                                    </li>
                                    <li><a href="javascript:;" target="_blank">爱尔兰 <span class="en">Ireland</span></a><i class="icon-label"></i></li>
                                    <li><a href="javascript:;" target="_blank">爱沙尼亚 <span class="en">The Republic of
                                                Estonia</span></a>
                                    </li>
                                    <li><a href="javascript:;" target="_blank">安道尔 <span class="en">Andorra</span></a>
                                    </li>
                                    <li><a href="javascript:;" target="_blank">奥地利 <span class="en">Austria</span></a><i class="icon-label"></i></li>
                                    <li class="letter">B</li>
                                    <li><a href="javascript:;" target="_blank">白俄罗斯 <span class="en">Belarus</span></a>
                                    </li>
                                    <li><a href="javascript:;" target="_blank">保加利亚 <span class="en">The Republic of
                                                Bulgaria</span></a>
                                    </li>
                                    <li><a href="javascript:;" target="_blank">比利时 <span class="en">Belgium</span></a><i class="icon-label"></i></li>
                                    <li><a href="javascript:;" target="_blank">冰岛 <span class="en">Iceland</span></a><i class="icon-label"></i></li>
                                    <li><a href="javascript:;" target="_blank">波黑 <span class="en">Bosnia and
                                                Herzegovina</span></a>
                                    </li>
                                    <li><a href="javascript:;" target="_blank">波兰 <span class="en">Poland</span></a><i class="icon-label"></i></li>
                                    <li class="letter">D</li>
                                    <li><a href="javascript:;" target="_blank">丹麦 <span class="en">Denmark</span></a><i class="icon-label"></i></li>
                                    <li><a href="javascript:;" target="_blank">德国 <span class="en">Germany</span></a><i class="icon-label"></i></li>
                                    <li class="letter">E</li>
                                    <li><a href="javascript:;" target="_blank">俄罗斯 <span class="en">Russia</span></a><i class="icon-label"></i></li>
                                    <li class="letter">F</li>
                                    <li><a href="javascript:;" target="_blank">法国 <span class="en">France</span></a><i class="icon-label"></i></li>
                                    <li><a href="javascript:;" target="_blank">梵蒂冈 <span class="en">Vatican City
                                                State</span></a>
                                    </li>
                                </ul>
                                <ul class="col">
                                    <li><a href="javascript:;" target="_blank">芬兰 <span class="en">Finland</span></a><i class="icon-label"></i></li>
                                    <li class="letter">H</li>
                                    <li><a href="javascript:;" target="_blank">荷兰 <span class="en">Holland</span></a><i class="icon-label"></i></li>
                                    <li><a href="javascript:;" target="_blank">黑山 <span class="en">Montenegro</span></a>
                                    </li>
                                    <li class="letter">J</li>
                                    <li><a href="javascript:;" target="_blank">捷克 <span class="en">Czech</span></a><i class="icon-label"></i></li>
                                    <li class="letter">K</li>
                                    <li><a href="javascript:;" target="_blank">科索沃 <span class="en">The Republic of
                                                Kosovo</span></a>
                                    </li>
                                    <li><a href="javascript:;" target="_blank">克罗地亚 <span class="en">Croatia</span></a>
                                    </li>
                                    <li class="letter">L</li>
                                    <li><a href="javascript:;" target="_blank">拉脱维亚 <span class="en">Latvia</span></a>
                                    </li>
                                    <li><a href="javascript:;" target="_blank">立陶宛 <span class="en">Lithuania</span></a>
                                    </li>
                                    <li><a href="javascript:;" target="_blank">列支敦士登 <span
                                                class="en">Liechtenstein</span></a></li>
                                    <li><a href="javascript:;" target="_blank">卢森堡 <span class="en">The Grand Duchy of
                                                Luxembourg</span></a>
                                    </li>
                                    <li><a href="javascript:;" target="_blank">罗马尼亚 <span class="en">Romania</span></a>
                                    </li>
                                    <li class="letter">M</li>
                                    <li><a href="javascript:;" target="_blank">马耳他 <span class="en">Malta</span></a>
                                    </li>
                                    <li><a href="javascript:;" target="_blank">马其顿 <span class="en">Macedonia</span></a>
                                    </li>
                                    <li><a href="javascript:;" target="_blank">摩尔多瓦 <span class="en">The Republicof
                                                Moldova</span></a>
                                    </li>
                                    <li><a href="javascript:;" target="_blank">摩纳哥 <span class="en">The Principality of
                                                Monaco</span></a>
                                    </li>
                                    <li class="letter">N</li>
                                    <li><a href="javascript:;" target="_blank">挪威 <span class="en">Norway</span></a><i class="icon-label"></i></li>
                                </ul>
                                <ul class="col">
                                    <li><a href="javascript:;" target="_blank">葡萄牙 <span
                                                class="en">Portugal</span></a><i class="icon-label"></i></li>
                                    <li class="letter">R</li>
                                    <li><a href="javascript:;" target="_blank">瑞典 <span class="en">The Kingdom of
                                                Sweden</span></a><i class="icon-label"></i></li>
                                    <li><a href="javascript:;" target="_blank">瑞士 <span
                                                class="en">Switzerland</span></a><i class="icon-label"></i></li>
                                    <li class="letter">S</li>
                                    <li><a href="javascript:;" target="_blank">塞尔维亚 <span class="en">The Republic of
                                                Serbia</span></a>
                                    </li>
                                    <li><a href="javascript:;" target="_blank">塞浦路斯 <span class="en">Cyprus</span></a>
                                    </li>
                                    <li><a href="javascript:;" target="_blank">圣马力诺 <span class="en">The Republic of San
                                                Marino</span></a>
                                    </li>
                                    <li><a href="javascript:;" target="_blank">斯洛伐克 <span class="en">Slovakia</span></a>
                                    </li>
                                    <li><a href="javascript:;" target="_blank">斯洛文尼亚 <span class="en">The Republic of
                                                Slovenia</span></a>
                                    </li>
                                    <li class="letter">T</li>
                                    <li><a href="javascript:;" target="_blank">土耳其 <span class="en">Turkey</span></a><i class="icon-label"></i></li>
                                    <li class="letter">W</li>
                                    <li><a href="javascript:;" target="_blank">乌克兰 <span class="en">Ukraine</span></a>
                                    </li>
                                    <li class="letter">X</li>
                                    <li><a href="javascript:;" target="_blank">西班牙 <span class="en">Spain</span></a><i class="icon-label"></i></li>
                                    <li><a href="javascript:;" target="_blank">希腊 <span class="en">Greece</span></a><i class="icon-label"></i></li>
                                    <li><a href="javascript:;" target="_blank">匈牙利 <span class="en">Hungary</span></a><i class="icon-label"></i></li>
                                    <li class="letter">Y</li>
                                    <li><a href="javascript:;" target="_blank">意大利 <span class="en">Italy</span></a><i class="icon-label"></i></li>
                                    <li><a href="javascript:;" target="_blank">英国 <span class="en">United
                                                Kingdom</span></a><i class="icon-label"></i></li>
                                </ul>
                            </dd>
                        </dl>
                        <dl class="item">
                            <dt class="sub-title">非洲</dt>
                            <dd class="clearfix">
                                <ul class="col">
                                    <li class="letter">A</li>
                                    <li><a href="javascript:;" target="_blank">阿尔及利亚 <span class="en">People's
                                                Democratic Republic of Algeria</span></a>
                                    </li>
                                    <li><a href="javascript:;" target="_blank">埃及 <span class="en">Egypt</span></a>
                                    </li>
                                    <li><a href="javascript:;" target="_blank">埃塞俄比亚 <span
                                                class="en">Ethiopia</span></a>
                                    </li>
                                    <li><a href="javascript:;" target="_blank">安哥拉 <span class="en">The Republic of
                                                Angola</span></a>
                                    </li>
                                    <li class="letter">B</li>
                                    <li><a href="javascript:;" target="_blank">贝宁 <span class="en">Benin</span></a>
                                    </li>
                                    <li><a href="javascript:;" target="_blank">博茨瓦纳 <span class="en">Botswana</span></a>
                                    </li>
                                    <li><a href="javascript:;" target="_blank">布基纳法索 <span class="en">Burkina
                                                Faso</span></a></li>
                                    <li><a href="javascript:;" target="_blank">布隆迪 <span class="en">Burundi</span></a>
                                    </li>
                                    <li class="letter">C</li>
                                    <li><a href="javascript:;" target="_blank">赤道几内亚 <span class="en">Equatorial
                                                Guinea</span></a>
                                    </li>
                                    <li class="letter">D</li>
                                    <li><a href="javascript:;" target="_blank">多哥 <span class="en">Togo</span></a>
                                    </li>
                                    <li class="letter">E</li>
                                    <li><a href="javascript:;" target="_blank">厄立特里亚 <span class="en">The State of
                                                Eritrea</span></a>
                                    </li>
                                    <li class="letter">F</li>
                                    <li><a href="javascript:;" target="_blank">佛得角 <span class="en">Cape
                                                Verde</span></a>
                                    </li>
                                    <li class="letter">G</li>
                                    <li><a href="javascript:;" target="_blank">冈比亚 <span class="en">Gambia</span></a>
                                    </li>
                                    <li><a href="javascript:;" target="_blank">刚果 <span class="en">The Republic of
                                                Congo</span></a>
                                    </li>
                                    <li><a href="javascript:;" target="_blank">刚果民主共和国 <span class="en">Democratic
                                                Republic of the Congo</span></a>
                                    </li>
                                    <li class="letter">J</li>
                                    <li><a href="javascript:;" target="_blank">吉布提 <span class="en">Djibouti</span></a>
                                    </li>
                                    <li><a href="javascript:;" target="_blank">几内亚 <span class="en">The Republic of
                                                Guinea</span></a>
                                    </li>
                                    <li><a href="javascript:;" target="_blank">几内亚比绍 <span
                                                class="en">Guinea-Bissau</span></a></li>
                                    <li><a href="javascript:;" target="_blank">加纳 <span class="en">Ghana</span></a>
                                    </li>
                                </ul>
                                <ul class="col">
                                    <li><a href="javascript:;" target="_blank">加蓬 <span class="en">Gabon</span></a>
                                    </li>
                                    <li><a href="javascript:;" target="_blank">津巴布韦 <span class="en">Zimbabwe</span></a>
                                    </li>
                                    <li class="letter">K</li>
                                    <li><a href="javascript:;" target="_blank">喀麦隆 <span class="en">Cameroon</span></a>
                                    </li>
                                    <li><a href="javascript:;" target="_blank">科摩罗 <span class="en">Comoros</span></a>
                                    </li>
                                    <li><a href="javascript:;" target="_blank">科特迪瓦 <span class="en">Ivory
                                                Coast</span></a></li>
                                    <li><a href="javascript:;" target="_blank">肯尼亚 <span class="en">Kenya</span></a><i class="icon-label"></i></li>
                                    <li class="letter">L</li>
                                    <li><a href="javascript:;" target="_blank">莱索托 <span class="en">Lesotho</span></a>
                                    </li>
                                    <li><a href="javascript:;" target="_blank">利比里亚 <span class="en">Liberia</span></a>
                                    </li>
                                    <li><a href="javascript:;" target="_blank">利比亚 <span class="en">State of
                                                Libya</span></a></li>
                                    <li><a href="javascript:;" target="_blank">留尼旺 <span class="en">Réunion</span></a>
                                    </li>
                                    <li><a href="javascript:;" target="_blank">卢旺达 <span class="en">Rwanda</span></a>
                                    </li>
                                    <li class="letter">M</li>
                                    <li><a href="javascript:;" target="_blank">马达加斯加 <span
                                                class="en">Madagascar</span></a><i class="icon-label"></i></li>
                                    <li><a href="javascript:;" target="_blank">马拉维 <span class="en">The Republic of
                                                Malawi</span></a>
                                    </li>
                                    <li><a href="javascript:;" target="_blank">马里 <span class="en">The Republic of
                                                Mali</span></a>
                                    </li>
                                    <li><a href="javascript:;" target="_blank">毛里求斯 <span
                                                class="en">Mauritius</span></a><i class="icon-label"></i></li>
                                    <li><a href="javascript:;" target="_blank">毛里塔尼亚 <span class="en">The Islamic
                                                Republic of Mauritania</span></a>
                                    </li>
                                    <li><a href="javascript:;" target="_blank">摩洛哥 <span class="en">Morocco</span></a><i class="icon-label"></i></li>
                                    <li><a href="javascript:;" target="_blank">莫桑比克 <span
                                                class="en">Mozambique</span></a></li>
                                    <li class="letter">N</li>
                                    <li><a href="javascript:;" target="_blank">纳米比亚 <span class="en">Namibia</span></a>
                                    </li>
                                </ul>
                                <ul class="col">
                                    <li><a href="javascript:;" target="_blank">南非 <span class="en">South
                                                Africa</span></a></li>
                                    <li><a href="javascript:;" target="_blank">南苏丹 <span class="en">Republic of South
                                                Sudan</span></a>
                                    </li>
                                    <li><a href="javascript:;" target="_blank">尼日尔 <span class="en">Niger</span></a>
                                    </li>
                                    <li><a href="javascript:;" target="_blank">尼日利亚 <span class="en">Federal Republic of
                                                Nigeria</span></a>
                                    </li>
                                    <li class="letter">S</li>
                                    <li><a href="javascript:;" target="_blank">塞拉利昂 <span class="en">Sierra
                                                leone</span></a></li>
                                    <li><a href="javascript:;" target="_blank">塞内加尔 <span class="en">Senegal</span></a>
                                    </li>
                                    <li><a href="javascript:;" target="_blank">塞舌尔 <span
                                                class="en">Seychelles</span></a><i class="icon-label"></i></li>
                                    <li><a href="javascript:;" target="_blank">圣多美和普林西比 <span class="en">Sao Tome and
                                                Principe</span></a>
                                    </li>
                                    <li><a href="javascript:;" target="_blank">斯威士兰 <span
                                                class="en">Swaziland</span></a>
                                    </li>
                                    <li><a href="javascript:;" target="_blank">苏丹 <span class="en">Sudan</span></a>
                                    </li>
                                    <li><a href="javascript:;" target="_blank">索马里 <span class="en">Somalia</span></a>
                                    </li>
                                    <li class="letter">T</li>
                                    <li><a href="javascript:;" target="_blank">坦桑尼亚 <span class="en">The United Republic
                                                of Tanzania</span></a>
                                    </li>
                                    <li><a href="javascript:;" target="_blank">突尼斯 <span class="en">Tunisia</span></a>
                                    </li>
                                    <li class="letter">W</li>
                                    <li><a href="javascript:;" target="_blank">乌干达 <span class="en">Uganda</span></a>
                                    </li>
                                    <li class="letter">X</li>
                                    <li><a href="javascript:;" target="_blank">西撒哈拉 <span class="en">Western
                                                Sahara</span></a></li>
                                    <li class="letter">Z</li>
                                    <li><a href="javascript:;" target="_blank">赞比亚 <span class="en">Zambia</span></a>
                                    </li>
                                    <li><a href="javascript:;" target="_blank">乍得 <span class="en">Chad</span></a>
                                    </li>
                                    <li><a href="javascript:;" target="_blank">中非 <span class="en">The Central African
                                                Republic</span></a>
                                    </li>
                                </ul>
                            </dd>
                        </dl>
                        <dl class="item">
                            <dt class="sub-title">大洋洲</dt>
                            <dd class="clearfix">
                                <ul class="col">
                                    <li class="letter">A</li>
                                    <li><a href="javascript:;" target="_blank">澳大利亚 <span
                                                class="en">Australia</span></a><i class="icon-label"></i></li>
                                    <li class="letter">B</li>
                                    <li><a href="javascript:;" target="_blank">巴布亚新几内亚 <span class="en">Papua New
                                                Guinea</span></a>
                                    </li>
                                    <li class="letter">D</li>
                                    <li><a href="javascript:;" target="_blank">大溪地 <span class="en">Tahiti</span></a><i class="icon-label"></i></li>
                                    <li class="letter">F</li>
                                    <li><a href="javascript:;" target="_blank">斐济 <span class="en">Fiji</span></a><i class="icon-label"></i></li>
                                    <li class="letter">G</li>
                                    <li><a href="javascript:;" target="_blank">关岛 <span class="en">Guam</span></a>
                                    </li>
                                    <li class="letter">J</li>
                                    <li><a href="javascript:;" target="_blank">基里巴斯 <span class="en">Kiribati</span></a>
                                    </li>
                                </ul>
                                <ul class="col">
                                    <li class="letter">K</li>
                                    <li><a href="javascript:;" target="_blank">库克群岛 <span class="en">Cook
                                                Islands</span></a></li>
                                    <li class="letter">M</li>
                                    <li><a href="javascript:;" target="_blank">马绍尔群岛 <span class="en">Marshall
                                                Islands</span></a>
                                    </li>
                                    <li><a href="javascript:;" target="_blank">密克罗尼西亚联邦 <span
                                                class="en">Micronesia</span></a></li>
                                    <!--li class="letter">N</li>
                            <li><a href="javascript:;" target="_blank">瑙鲁 <span class="en">Nauru</span></a>
                            </li>
                            <li><a href="javascript:;" target="_blank">纽埃 <span class="en">Niue</span></a>
                            </li-->
                                    <li class="letter">P</li>
                                    <li><a href="javascript:;" target="_blank">帕劳 <span class="en">Palau</span></a><i class="icon-label"></i></li>
                                </ul>
                                <ul class="col">
                                    <li class="letter">S</li>
                                    <li><a href="javascript:;" target="_blank">萨摩亚 <span class="en">Samoa</span></a>
                                    </li>
                                    <li><a href="javascript:;" target="_blank">所罗门群岛 <span class="en">Solomon
                                                Islands</span></a></li>
                                    <li class="letter">T</li>
                                    <li><a href="javascript:;" target="_blank">汤加 <span class="en">The Kingdom of
                                                Tonga</span></a>
                                    </li>
                                    <li><a href="javascript:;" target="_blank">图瓦卢 <span class="en">Tuvalu</span></a>
                                    </li>
                                    <li class="letter">W</li>
                                    <li><a href="javascript:;" target="_blank">瓦努阿图 <span class="en">Republic of
                                                Vanuatu</span></a>
                                    </li>
                                    <li class="letter">X</li>
                                    <li><a href="javascript:;" target="_blank">新西兰 <span class="en">New
                                                Zealand</span></a><i class="icon-label"></i></li>
                                </ul>
                            </dd>
                        </dl>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <#include "../common/footer.ftl">
</body>

</html>