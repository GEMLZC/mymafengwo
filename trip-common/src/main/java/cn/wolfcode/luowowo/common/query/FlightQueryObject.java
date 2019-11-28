package cn.wolfcode.luowowo.common.query;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class FlightQueryObject extends QueryObject {
    //出发城市
    private String orgCity;
    //目的城市
    private String dstCity;
    //出发时间
    private String depTime;
}
