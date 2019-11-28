package cn.wolfcode.luowowo.common.query;

import lombok.AllArgsConstructor;
import lombok.Getter;

import java.util.HashMap;
import java.util.Map;

@Getter@AllArgsConstructor
public class NewDestinationCondition {

    public static final Map<Integer, NewDestinationCondition> TRAVEL_DAYS = new HashMap<>();

    static {
        TRAVEL_DAYS.put(2, new NewDestinationCondition(2, 3));
        TRAVEL_DAYS.put(4, new NewDestinationCondition(4, 5));
        TRAVEL_DAYS.put(6, new NewDestinationCondition(6, 9));
        TRAVEL_DAYS.put(10, new NewDestinationCondition(10, null));
    }

    private Integer min;
    private Integer max;
}
