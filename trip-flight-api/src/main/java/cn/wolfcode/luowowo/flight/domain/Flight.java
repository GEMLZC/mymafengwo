package cn.wolfcode.luowowo.flight.domain;

import cn.wolfcode.luowowo.common.domain.BaseDomain;
import lombok.Getter;
import lombok.Setter;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

@Getter@Setter
public class Flight extends BaseDomain{
    //出发城市
    private FlightDest orgcity;
    //目标城市
    private FlightDest dstcity;
    //航班编号
    private String flightno;
    //出发机场
    private String depport;
    //到达机场
    private String arrport;
    //出发日期
    private Date deptDate;
    //到达日期
    private Date arrDate;
    //出发时间
    @DateTimeFormat(pattern = "yyyy-MM-dd HH-mm")
    private Date deptTime;
    //到达时间
    @DateTimeFormat(pattern = "yyyy-MM-dd HH-mm")
    private Date arrTime;
    //价格
    private Long price;

}
