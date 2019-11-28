package cn.wolfcode.luowowo.flight.service;

import cn.wolfcode.luowowo.common.query.FlightQueryObject;
import cn.wolfcode.luowowo.flight.domain.Flight;
import cn.wolfcode.luowowo.flight.domain.FlightDest;

import java.util.List;

public interface IFlightService {
    /**
     * 获取热门目的地
     * @return
     */
    List<FlightDest> listHotFlights();

    /**
     * 获取字母开头目的地
     * @param a
     * @return
     */
    List<FlightDest> listFlightsByCode(char a);

    /**
     * 高级查询航班
     * @param qo
     * @return
     */
    List<Flight> query(FlightQueryObject qo);
}
