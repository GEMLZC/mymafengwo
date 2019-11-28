<ul class="clearfix">
<#list innerView as rfs>
    <li>
        <a href="/poi/5174512.html" target="_blank">
            <img src="${(rfs.imgUrls[0])!}"
                 width="235" height="150">
            <span class="num num-top">${rfs_index+1}</span>
            <div class="info">
                <h3>${(rfs.name)!}</h3>
                <span><em>${(rfs.visitnum)!}</em>人去过</span>
            </div>
        </a>
    </li>
</#list>

</ul>