package cn.wolfcode.luowowo.hotel.domain;

import cn.wolfcode.luowowo.common.domain.BaseDomain;
import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class HotelTag extends BaseDomain {
    //名字
    private String name;
    //关联的目的地id
    private Long destId;
}
