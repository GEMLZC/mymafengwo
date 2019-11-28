<ul id="menu" class="list-group">
    <li class="list-group-item">
        <a href="#" data-toggle="collapse" data-target="#destinationMgr">
            <span>目的地管理</span>
        </a>

        <ul class="in" id="destinationMgr">
            <li class="destination"><a href="/destination/list">目的地管理</a></li>
            <li class="region"><a href="/region/list">区域管理</a></li>
        </ul>
    </li>

    <li class="list-group-item">
        <a href="#" data-toggle="collapse" data-target="#strategyMgr">
            <span>攻略管理</span>
        </a>
        <ul class="in" id="strategyMgr">
	    <li class="strategyTag"><a href="/strategyTag/list">攻略标签管理</a></li>
            <li class="strategyCatalog"><a href="/strategyCatalog/list">攻略分类管理</a></li>
            <li class="strategyTheme"><a href="/strategyTheme/list">攻略主题管理</a></li>
            <li class="strategyDetail"><a href="/strategyDetail/list">攻略文章管理</a></li>        
            <li class="strategyCommend"><a href="/strategyCommend/list">攻略推荐管理</a></li>
        </ul>
    </li>
    <li class="list-group-item">
        <a href="#" data-toggle="collapse" data-target="#travelMgr">
            <span>游记管理</span>
        </a>
        <ul class="in" id="travelMgr">
            <li class="travel"><a href="/travel/list">游记管理</a></li>
            <li class="travelCommend"><a href="/travelCommend/list">游记推荐管理</a></li>

        </ul>
    </li>
    <li class="list-group-item">
        <a href="#" data-toggle="collapse" data-target="#customerReport">
            <span>评论管理</span>
        </a>
        <ul class="in" id="customerReport">
            <li class="customerReport"><a href="/customerReport/list">攻略评论</a></li>
            <li class="customerReport"><a href="/customerReport/list">游记评论</a></li>
        </ul>
    </li>
</ul>

<!--设置菜单回显-->
<script>
    $(".in li.${currentMenu}").addClass("active");
</script>