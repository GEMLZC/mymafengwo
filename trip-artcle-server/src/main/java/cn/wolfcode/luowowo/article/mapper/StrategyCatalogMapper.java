package cn.wolfcode.luowowo.article.mapper;

import cn.wolfcode.luowowo.article.domain.StrategyCatalog;
import cn.wolfcode.luowowo.common.query.QueryObject;
import java.util.List;

public interface StrategyCatalogMapper {
    int deleteByPrimaryKey(Long id);

    int insert(StrategyCatalog record);

    StrategyCatalog selectByPrimaryKey(Long id);

    List<StrategyCatalog> selectAll();

    int updateByPrimaryKey(StrategyCatalog record);

    List<StrategyCatalog> selectForList(QueryObject qo);

    List<StrategyCatalog> selectByDestId(Long id);
}