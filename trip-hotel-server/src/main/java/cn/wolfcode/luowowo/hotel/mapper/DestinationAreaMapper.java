package cn.wolfcode.luowowo.hotel.mapper;

import cn.wolfcode.luowowo.hotel.domain.DestinationArea;
import java.util.List;

public interface DestinationAreaMapper {
    int deleteByPrimaryKey(Long id);

    int insert(DestinationArea record);

    DestinationArea selectByPrimaryKey(Long id);

    List<DestinationArea> selectAll();

    int updateByPrimaryKey(DestinationArea record);

    List<DestinationArea> selectAreaByDestId(Long destId);
}