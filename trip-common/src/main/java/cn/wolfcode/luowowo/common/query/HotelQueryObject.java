package cn.wolfcode.luowowo.common.query;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class HotelQueryObject extends QueryObject {
    //标签
    private Long hoteltag=-1L;
    //价格
    private Long price=-1L;
    //星级
    private Integer star=-1;
    //类型
    private Integer type=-1;
    //设施
    private Long facilities=-1L;
    //品牌
    private String brand;
    //区域id
    private Long area=-1L;
    //剩余房间
    private Integer hasroom=0;
    //是否靠近地铁
    private Integer closeSub=0;
    //是否查询被收藏
    private Integer favour=0;
    //目的地id
    private Long destId;
}
