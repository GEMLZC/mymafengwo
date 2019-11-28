package cn.wolfcode.luowowo.hotel.mapper;

import cn.wolfcode.luowowo.hotel.domain.HotelFacilities;
import java.util.List;

public interface HotelFacilitiesMapper {
    int deleteByPrimaryKey(Long id);

    int insert(HotelFacilities record);

    HotelFacilities selectByPrimaryKey(Long id);

    List<HotelFacilities> selectAll();

    int updateByPrimaryKey(HotelFacilities record);
}