package cn.wolfcode.luowowo.article.mapper;

import cn.wolfcode.luowowo.article.domain.Region;
import cn.wolfcode.luowowo.common.query.QueryObject;
import java.util.List;

public interface RegionMapper {
    int deleteByPrimaryKey(Long id);

    int insert(Region record);

    Region selectByPrimaryKey(Long id);

    List<Region> selectAll();

    int updateByPrimaryKey(Region record);

    List<Region> selectForList(QueryObject qo);

    List<Region> selectHostRegion();

}