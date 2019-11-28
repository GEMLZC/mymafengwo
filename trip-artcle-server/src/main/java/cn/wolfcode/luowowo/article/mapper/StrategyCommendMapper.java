package cn.wolfcode.luowowo.article.mapper;

import cn.wolfcode.luowowo.article.domain.StrategyCommend;
import cn.wolfcode.luowowo.common.query.QueryObject;
import java.util.List;

public interface StrategyCommendMapper {
    int deleteByPrimaryKey(Long id);

    int insert(StrategyCommend record);

    StrategyCommend selectByPrimaryKey(Long id);

    List<StrategyCommend> selectAll();

    int updateByPrimaryKey(StrategyCommend record);

    List<StrategyCommend> selectForList(QueryObject qo);

    List<StrategyCommend> selectTop5();
}