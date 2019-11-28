package cn.wolfcode.luowowo.article.mapper;

import cn.wolfcode.luowowo.article.domain.StrategyContent;
import java.util.List;

public interface StrategyContentMapper {
    int deleteByPrimaryKey(Long id);

    int insert(StrategyContent record);

    StrategyContent selectByPrimaryKey(Long id);

    List<StrategyContent> selectAll();

    List<StrategyContent> selectForList();

    int updateByPrimaryKey(StrategyContent record);
}