package cn.wolfcode.luowowo.website.controller;

import cn.wolfcode.luowowo.common.query.FlightQueryObject;
import cn.wolfcode.luowowo.flight.domain.Flight;
import cn.wolfcode.luowowo.flight.domain.FlightDest;
import cn.wolfcode.luowowo.flight.service.IFlightService;
import org.apache.dubbo.config.annotation.Reference;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("/flight")
public class FilghtController {
    @Reference
    private IFlightService flightService;

    @RequestMapping("")
    public String index(Model model){
        //hotFlights
        List<FlightDest> hotFlights= flightService.listHotFlights();
        model.addAttribute("hotFlights",hotFlights);
        //initialA
        List<FlightDest> initialA= flightService.listFlightsByCode('A');
        model.addAttribute("initialA",initialA);
        //initialF
        List<FlightDest> initialF= flightService.listFlightsByCode('F');
        model.addAttribute("initialF",initialF);
        //initialK
        List<FlightDest> initialK= flightService.listFlightsByCode('K');
        model.addAttribute("initialK",initialK);
        //initialQ
        List<FlightDest> initialQ= flightService.listFlightsByCode('Q');
        model.addAttribute("initialQ",initialQ);
        //initialX
        List<FlightDest> initialX= flightService.listFlightsByCode('X');
        model.addAttribute("initialX",initialX);
        //flight
        return "/flight/index";
    }
    @RequestMapping("/search")
    public String search(Model model,FlightQueryObject qo){
        List<Flight> flights = flightService.query(qo);
        model.addAttribute("flights",flights);
        return "/flight/FlightTpl";
    }
}
