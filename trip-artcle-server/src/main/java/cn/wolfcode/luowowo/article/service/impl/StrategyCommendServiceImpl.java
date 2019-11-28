package cn.wolfcode.luowowo.article.service.impl;

import cn.wolfcode.luowowo.article.domain.StrategyCommend;
import cn.wolfcode.luowowo.article.mapper.StrategyCommendMapper;
import cn.wolfcode.luowowo.article.service.IStrategyCommendService;
import cn.wolfcode.luowowo.common.query.QueryObject;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.apache.dubbo.config.annotation.Service;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

@Service
public class StrategyCommendServiceImpl implements IStrategyCommendService {
    @Autowired
    private StrategyCommendMapper strategyCommendMapper;

    @Override
    public void save(StrategyCommend strategyCommend) {
        strategyCommendMapper.insert(strategyCommend);
    }

    @Override
    public PageInfo<StrategyCommend> query(QueryObject qo) {
        PageHelper.startPage(qo.getCurrentPage(),qo.getPageSize());
        List<StrategyCommend> list = strategyCommendMapper.selectForList(qo);

        return new PageInfo<>(list);
    }

    @Override
    public List<StrategyCommend> listTop5() {
        return strategyCommendMapper.selectTop5();
    }
}
