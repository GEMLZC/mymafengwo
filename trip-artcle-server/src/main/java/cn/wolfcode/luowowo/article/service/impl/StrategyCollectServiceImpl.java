package cn.wolfcode.luowowo.article.service.impl;

import cn.wolfcode.luowowo.article.domain.StrategyCollect;
import cn.wolfcode.luowowo.article.domain.Travel;
import cn.wolfcode.luowowo.article.mapper.StrategyCollectMapper;
import cn.wolfcode.luowowo.article.service.IStrategyCollectService;
import org.apache.dubbo.config.annotation.Service;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

@Service
public class StrategyCollectServiceImpl implements IStrategyCollectService{
    @Autowired
    private StrategyCollectMapper strategyCollectMapper;


    @Override
    public void save(StrategyCollect strategyCollect) {
        strategyCollectMapper.insert(strategyCollect);
    }

    @Override
    public List<Long> liststrategy(Long userid) {

        return strategyCollectMapper.selectByUserId(userid);
    }

    @Override
    public List<StrategyCollect> list() {
        return strategyCollectMapper.selectAll();
    }
}
