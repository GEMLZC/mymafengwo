package cn.wolfcode.luowowo.flight.mapper;

import cn.wolfcode.luowowo.common.query.FlightQueryObject;
import cn.wolfcode.luowowo.flight.domain.Flight;
import java.util.List;

public interface FlightMapper {
    int deleteByPrimaryKey(Long id);

    int insert(Flight record);

    Flight selectByPrimaryKey(Long id);

    List<Flight> selectAll();

    int updateByPrimaryKey(Flight record);

    List<Flight> queryForList(FlightQueryObject qo);
}