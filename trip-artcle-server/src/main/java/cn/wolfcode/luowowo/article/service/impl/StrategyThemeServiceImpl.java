package cn.wolfcode.luowowo.article.service.impl;

import cn.wolfcode.luowowo.article.domain.StrategyTheme;
import cn.wolfcode.luowowo.article.mapper.StrategyThemeMapper;
import cn.wolfcode.luowowo.article.service.IStrategyThemeService;
import cn.wolfcode.luowowo.common.query.QueryObject;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.apache.dubbo.config.annotation.Service;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

@Service
public class StrategyThemeServiceImpl implements IStrategyThemeService {
    @Autowired
    private StrategyThemeMapper strategyThemeMapper;

    @Override
    public PageInfo<StrategyTheme> query(QueryObject qo) {
        PageHelper.startPage(qo.getCurrentPage(),qo.getPageSize());
        List<StrategyTheme> list = strategyThemeMapper.selectForList(qo);
        return new PageInfo<>(list);
    }

    @Override
    public void saveOrUpdate(StrategyTheme strategyTheme) {
        if (strategyTheme.getId() == null){
            strategyThemeMapper.insert(strategyTheme);
        }else {
            strategyThemeMapper.updateByPrimaryKey(strategyTheme);
        }
    }

    @Override
    public List<StrategyTheme> list() {
        return strategyThemeMapper.selectAll();
    }
}
