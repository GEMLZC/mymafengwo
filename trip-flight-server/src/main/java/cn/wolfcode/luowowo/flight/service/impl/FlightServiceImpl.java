package cn.wolfcode.luowowo.flight.service.impl;

import cn.wolfcode.luowowo.common.query.FlightQueryObject;
import cn.wolfcode.luowowo.flight.domain.Flight;
import cn.wolfcode.luowowo.flight.domain.FlightDest;
import cn.wolfcode.luowowo.flight.mapper.FlightDestMapper;
import cn.wolfcode.luowowo.flight.mapper.FlightMapper;
import cn.wolfcode.luowowo.flight.service.IFlightService;
import org.apache.dubbo.config.annotation.Service;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.ArrayList;
import java.util.List;

@Service
public class FlightServiceImpl implements IFlightService {
    @Autowired
    private FlightDestMapper flightDestMapper;
    @Autowired
    private FlightMapper flightMapper;

    public List<FlightDest> listHotFlights() {
        return flightDestMapper.listHotFlights();
    }

    public List<FlightDest> listFlightsByCode(char a) {
        List<FlightDest> flightDests = new ArrayList<>();
        switch (a) {
            case 'A':
                flightDests = flightDestMapper.listFlightsByCodeA();
                break;
            case 'F':
                flightDests = flightDestMapper.listFlightsByCodeF();
                break;
            case 'K':
                flightDests = flightDestMapper.listFlightsByCodeK();
                break;
            case 'Q':
                flightDests = flightDestMapper.listFlightsByCodeQ();
                break;
            case 'X':
                flightDests = flightDestMapper.listFlightsByCodeX();
                break;
        }
        return flightDests;
    }

    public List<Flight> query(FlightQueryObject qo) {
        List<Flight> flights = flightMapper.queryForList(qo);
        return flights;
    }
}
