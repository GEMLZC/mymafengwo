package cn.wolfcode.luowowo.article.domain;

import cn.wolfcode.luowowo.common.domain.BaseDomain;
import com.alibaba.fastjson.JSON;
import lombok.Getter;
import lombok.Setter;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Setter@Getter
public class StrategyCatalog extends BaseDomain {
    public static final Integer STATE_ENABLE = 0; //启用
    public static final Integer STATE_DISABLE = 1; //禁用

    private String name;

    private Integer state = STATE_ENABLE;

    private Long destId;

    private List<StrategyDetail> details = new ArrayList<>();

    public String getStateName() {
        return state == STATE_ENABLE ? "启用" : "禁用";
    }

    public String getJson() {
        Map<String, Object> map = new HashMap<>();
        map.put("id", id);
        map.put("name", name);
        map.put("state", state);
        map.put("destId", destId);
        return JSON.toJSONString(map);
    }
}