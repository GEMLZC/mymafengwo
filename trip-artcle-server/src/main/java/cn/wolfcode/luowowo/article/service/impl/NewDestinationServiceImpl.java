package cn.wolfcode.luowowo.article.service.impl;

import cn.wolfcode.luowowo.article.domain.NewDestination;
import cn.wolfcode.luowowo.article.mapper.NewDestinationMapper;
import cn.wolfcode.luowowo.article.service.INewDestinationService;
import cn.wolfcode.luowowo.common.query.NewDestinationQuery;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.apache.dubbo.config.annotation.Service;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

@Service
public class NewDestinationServiceImpl implements INewDestinationService {
    @Autowired
    private NewDestinationMapper newDestinationMapper;


    @Override
    public PageInfo<NewDestination> query(NewDestinationQuery qo) {
        PageHelper.startPage(qo.getCurrentPage(),qo.getPageSize());
        List<NewDestination> list = newDestinationMapper.selectForList(qo);
        return new PageInfo<>(list);
    }
}
