package cn.wolfcode.luowowo.article.service.impl;

import cn.wolfcode.luowowo.article.domain.View;
import cn.wolfcode.luowowo.article.domain.ViewContent;
import cn.wolfcode.luowowo.article.mapper.ViewContentMapper;
import cn.wolfcode.luowowo.article.mapper.ViewMapper;
import cn.wolfcode.luowowo.article.service.IViewService;
import cn.wolfcode.luowowo.common.query.QueryObject;
import cn.wolfcode.luowowo.common.query.ViewQuery;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import lombok.AllArgsConstructor;
import org.apache.dubbo.config.annotation.Service;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

/**
 * Created by Xhek on 2019/11/23.
 */
@Service
public class ViewServiceImpl implements IViewService {

    @Autowired
    private ViewMapper viewMapper;


    @Autowired
    private ViewContentMapper contentMapper;


    @Override
    public PageInfo query(QueryObject qo) {
        PageHelper.startPage(qo.getCurrentPage(),qo.getPageSize());
        List<View> views = viewMapper.queryForList(qo);
        return new PageInfo(views);
    }

    @Override
    public List<View> queryByDestAndType(Long destId, int type) {
        return viewMapper.selectByDestAndType(destId,type);
    }

    @Override
    public View get(Long viewId) {
        View view = viewMapper.selectByPrimaryKey(viewId);
        ViewContent content = contentMapper.selectByPrimaryKey(viewId);
        view.setViewContent(content);
        return view;
    }

    @Override
    public PageInfo getByParentId(QueryObject qo) {
        PageHelper.startPage(qo.getCurrentPage(),qo.getPageSize());
        List<View> list = viewMapper.queryForList(qo);

        return new PageInfo(list);
    }


}
