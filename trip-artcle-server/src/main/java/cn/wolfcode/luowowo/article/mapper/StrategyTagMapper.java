package cn.wolfcode.luowowo.article.mapper;

import cn.wolfcode.luowowo.article.domain.StrategyTag;
import java.util.List;

public interface StrategyTagMapper {
    int deleteByPrimaryKey(Long id);

    int insert(StrategyTag record);

    StrategyTag selectByPrimaryKey(Long id);

    List<StrategyTag> selectAll();

    int updateByPrimaryKey(StrategyTag record);

    StrategyTag selectByName(String tag);

    String selectDetailTagByTagId(Long id);

    List<StrategyTag> selectDetailTagByDestId(Long destId);
}