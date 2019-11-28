package cn.wolfcode.luowowo.flight.mapper;

import cn.wolfcode.luowowo.flight.domain.FlightDest;

import java.util.List;

public interface FlightDestMapper {
    int deleteByPrimaryKey(Long id);

    int insert(FlightDest record);

    FlightDest selectByPrimaryKey(Long id);

    List<FlightDest> selectAll();

    int updateByPrimaryKey(FlightDest record);

    List<FlightDest> listHotFlights();

    List<FlightDest> listFlightsByCodeA();
    List<FlightDest> listFlightsByCodeF();
    List<FlightDest> listFlightsByCodeK();
    List<FlightDest> listFlightsByCodeQ();
    List<FlightDest> listFlightsByCodeX();

}