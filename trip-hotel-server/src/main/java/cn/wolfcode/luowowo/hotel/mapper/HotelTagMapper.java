package cn.wolfcode.luowowo.hotel.mapper;

import cn.wolfcode.luowowo.hotel.domain.HotelTag;
import java.util.List;

public interface HotelTagMapper {
    int deleteByPrimaryKey(Long id);

    int insert(HotelTag record);

    HotelTag selectByPrimaryKey(Long id);

    List<HotelTag> selectAll();

    int updateByPrimaryKey(HotelTag record);

    List<HotelTag> selectTagsByDestId(Long destId);
}