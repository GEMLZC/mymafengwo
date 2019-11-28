package cn.wolfcode.luowowo.article.mapper;

import cn.wolfcode.luowowo.article.domain.StrategyDetail;
import cn.wolfcode.luowowo.common.query.QueryObject;
import cn.wolfcode.luowowo.common.query.StrategyDetailQuery;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface StrategyDetailMapper {
    int deleteByPrimaryKey(Long id);

    int insert(StrategyDetail record);

    StrategyDetail selectByPrimaryKey(Long id);

    List<StrategyDetail> selectAll();

    List<StrategyDetail> selectByCatalogId(Long catalogId);

    List<StrategyDetail> selectForList(StrategyDetailQuery qo);

    int updateByPrimaryKey(StrategyDetail record);

    void insertDetailTag(@Param("detailId") Long detailId, @Param("tagId") Long tagId);

    void deleteDetailTagByPrimaryKey(Long id);

    List<StrategyDetail> selectByDestId(Long destId);

    void updateStats(StrategyDetail strategyDetail);
}