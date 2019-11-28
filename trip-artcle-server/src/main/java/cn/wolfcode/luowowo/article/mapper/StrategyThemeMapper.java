package cn.wolfcode.luowowo.article.mapper;

import cn.wolfcode.luowowo.article.domain.StrategyTheme;
import cn.wolfcode.luowowo.common.query.QueryObject;

import java.util.List;

public interface StrategyThemeMapper {
    int deleteByPrimaryKey(Long id);

    int insert(StrategyTheme record);

    StrategyTheme selectByPrimaryKey(Long id);

    List<StrategyTheme> selectAll();

    List<StrategyTheme> selectForList(QueryObject qo);

    int updateByPrimaryKey(StrategyTheme record);
}