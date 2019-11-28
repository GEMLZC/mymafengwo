package cn.wolfcode.luowowo.article.service.impl;

import cn.wolfcode.luowowo.article.domain.StrategyContent;
import cn.wolfcode.luowowo.article.mapper.StrategyContentMapper;
import cn.wolfcode.luowowo.article.service.IStrategyContentService;
import org.apache.dubbo.config.annotation.Service;
import org.springframework.beans.factory.annotation.Autowired;

@Service
public class StrategyContentServiceImpl implements IStrategyContentService {
    @Autowired
    private StrategyContentMapper strategyContentMapper;

    @Override
    public StrategyContent queryById(Long id) {
        return strategyContentMapper.selectByPrimaryKey(id);
    }
}
