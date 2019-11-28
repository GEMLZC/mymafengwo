package cn.wolfcode.luowowo.flight.domain;

import cn.wolfcode.luowowo.common.domain.BaseDomain;
import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class FlightDest extends BaseDomain {
    public static final Integer HOT=1;
    public static final Integer NOT_HOT=0;
    //名字
    private String name;
    //代码
    private String aircode;
    //热门与否
    private Integer ishot;
}
