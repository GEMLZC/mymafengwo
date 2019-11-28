package cn.wolfcode.luowowo.common.query;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class NewDestinationQuery extends QueryObject{
    private Long monthId = -1l;//月份id
    private Long tagTime = -1l;//时间标签
    private Long tagId = -1l;//标签id
    private Integer dayType = -1;//出行天数

    public NewDestinationCondition getDay(){
        return NewDestinationCondition.TRAVEL_DAYS.get(dayType);
    }
}
