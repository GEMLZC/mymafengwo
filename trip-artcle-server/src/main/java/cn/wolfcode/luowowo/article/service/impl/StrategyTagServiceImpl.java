package cn.wolfcode.luowowo.article.service.impl;

import cn.wolfcode.luowowo.article.domain.StrategyTag;
import cn.wolfcode.luowowo.article.mapper.StrategyTagMapper;
import cn.wolfcode.luowowo.article.service.IStrategyTagService;
import cn.wolfcode.luowowo.common.query.QueryObject;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.apache.dubbo.config.annotation.Service;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

@Service
public class StrategyTagServiceImpl implements IStrategyTagService {
    @Autowired
    private StrategyTagMapper strategyTagMapper;

    @Override
    public PageInfo<StrategyTag> query(QueryObject qo) {
        PageHelper.startPage(qo.getCurrentPage(),qo.getPageSize());
        List<StrategyTag> list = strategyTagMapper.selectAll();
        return new PageInfo<>(list);
    }

    @Override
    public String queryDetailTagByTagId(Long id) {
        return strategyTagMapper.selectDetailTagByTagId(id);
    }

    @Override
    public List<StrategyTag> queryDetailTagByDestId(Long destId) {
        return strategyTagMapper.selectDetailTagByDestId(destId);
    }
}
