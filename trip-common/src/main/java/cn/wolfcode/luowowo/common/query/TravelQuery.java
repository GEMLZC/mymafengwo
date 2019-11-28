package cn.wolfcode.luowowo.common.query;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class TravelQuery extends QueryObject{
    private Long authorId = -1L;//作者id
    private Long userId = 1L;//访问者id
    private Integer overt;//公开状态
    private int state = -1;//状态
    private Integer travelTimeType = -1;//出发时间
    private Integer perExpendType = -1;//人均花费
    private Integer dayType = -1;//出行天数
    private Integer destId = -1;//地区id

    private Integer orderType = 1;//排序类型

    public String getOrderBy(){
        switch (orderType){
            case 2:
                return "t.viewnum desc";
        }
        return "t.releaseTime desc";
    }

    //需要翻译过滤条件的get方法
    public TravelCondition getTravelTime(){
        return TravelCondition.TRAVEL_TIME.get(travelTimeType);
    }

    public TravelCondition getDay(){
        return TravelCondition.TRAVEL_DAYS.get(dayType);
    }

    public TravelCondition getPerExpend(){
        return TravelCondition.TRAVEL_PER_EXPEND.get(perExpendType);
    }
}
