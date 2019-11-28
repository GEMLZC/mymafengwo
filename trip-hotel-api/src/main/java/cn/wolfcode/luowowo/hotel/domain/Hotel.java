package cn.wolfcode.luowowo.hotel.domain;

import cn.wolfcode.luowowo.article.domain.Destination;
import cn.wolfcode.luowowo.common.domain.BaseDomain;
import lombok.Getter;
import lombok.Setter;



@Setter@Getter
public class Hotel extends BaseDomain {
    //酒店类型常量
    public static final Integer HOTEL=1;//酒店类型
    public static final Integer RESORT=2;//度假村
    public static final Integer HOMESTAY=3;//民宿

    //临近地铁状态常量
    public static final Integer CLOSE=1;
    public static final Integer NOCLOSE=0;



    //目的地
    private Destination dest;
    //评分
    private Double score;
    //星级
    private Integer star;
    //最低价格
    private Long price;
    //酒店类型
    private Integer type;
    //品牌
    private String brand;
    //简介
    private String info;
    //地址
    private String location;
    //评论数
    private Long commentnum;
    //游记数
    private Long travelnum;
    //封面
    private String coverUrl;
    //剩余房间数
    private Long roomnum;
    //销量
    private Long sellnum;
    //英文
    private String english;
    //近地铁状态
    private Integer closeSub;
    //酒店名字
    private String name;
    //针对用户的收藏添加的字段isFavour
    private boolean isFavour;
    //针对酒店是否售罄的字段
    private boolean hasRoom=true;
    //马蜂窝的酒店详情页
    private String url;

    public boolean getHasRoom(){
        return roomnum>0;
    }
}
