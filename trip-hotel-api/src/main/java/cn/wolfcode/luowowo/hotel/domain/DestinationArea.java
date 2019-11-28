package cn.wolfcode.luowowo.hotel.domain;

import cn.wolfcode.luowowo.article.domain.Destination;
import cn.wolfcode.luowowo.common.domain.BaseDomain;
import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class DestinationArea extends BaseDomain{
    //名字
    private String name;
    //关联的目的地
    private Destination dest;
    //攻略,简介
    private String info;
    //三星酒店均价--假数据
    private Long rate3Price;
    //四星酒店均价--假数据
    private Long rate4Price;
    //五星酒店均价--假数据
    private Long rate5Price;
    //酒店总数,假数据
    private Long hotelsum;
    //游客选择百分比,假数据
    private Long choosepercent;
}
