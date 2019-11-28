package cn.wolfcode.luowowo.article.mapper;

import cn.wolfcode.luowowo.article.domain.Destination;
import cn.wolfcode.luowowo.article.domain.NewDestination;
import cn.wolfcode.luowowo.common.query.DestinationQuery;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface DestinationMapper {
    int deleteByPrimaryKey(Long id);

    int insert(Destination record);

    Destination selectByPrimaryKey(Long id);

    List<Destination> selectAll(DestinationQuery qo);

    int updateByPrimaryKey(Destination record);

    void updateHost(@Param("id") Long id, @Param("status") Long status);

    void updateInfoById(Destination destination);

    List<Destination> selectByPrimaryKeyArray(Long[] refIds);

    List<Destination> selectAllDest();

    List<Destination> selectByRegionId(@Param("regionId") Long regionId);


    List<Destination> selectAllNoPage();

    List<Destination> selectByRegionIdTop12(@Param("regionId")Long regionId);

    Destination selectByName(String destName);

    List<Destination> selectByParentId(Long id);
    List<NewDestination> selectByMonthId(Long mid);

}