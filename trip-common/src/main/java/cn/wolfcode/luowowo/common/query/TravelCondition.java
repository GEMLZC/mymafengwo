package cn.wolfcode.luowowo.common.query;

import lombok.AllArgsConstructor;
import lombok.Getter;

import java.util.HashMap;
import java.util.Map;

@Getter@AllArgsConstructor
public class TravelCondition {
    public static final Map<Integer, TravelCondition> TRAVEL_PER_EXPEND = new HashMap<>();
    public static final Map<Integer, TravelCondition> TRAVEL_TIME = new HashMap<>();
    public static final Map<Integer, TravelCondition> TRAVEL_DAYS = new HashMap<>();

    static {
        TRAVEL_PER_EXPEND.put(1, new TravelCondition(1, 999));
        TRAVEL_PER_EXPEND.put(2, new TravelCondition(1000, 6000));
        TRAVEL_PER_EXPEND.put(3, new TravelCondition(6000, 20000));
        TRAVEL_PER_EXPEND.put(4, new TravelCondition(20000, null));

        TRAVEL_TIME.put(1, new TravelCondition(1, 2));
        TRAVEL_TIME.put(2, new TravelCondition(3, 4));
        TRAVEL_TIME.put(3, new TravelCondition(5, 6));
        TRAVEL_TIME.put(4, new TravelCondition(7, 8));
        TRAVEL_TIME.put(5, new TravelCondition(9, 10));
        TRAVEL_TIME.put(6, new TravelCondition(11, 12));

        TRAVEL_DAYS.put(1, new TravelCondition(0, 3));
        TRAVEL_DAYS.put(2, new TravelCondition(4, 7));
        TRAVEL_DAYS.put(3, new TravelCondition(8, 14));
        TRAVEL_DAYS.put(4, new TravelCondition(15, null));
    }

    private Integer min;
    private Integer max;
}
