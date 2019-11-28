package cn.wolfcode.luowowo.article.domain;

import cn.wolfcode.luowowo.common.domain.BaseDomain;
import com.alibaba.fastjson.JSON;
import lombok.Getter;
import lombok.Setter;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
@Setter
@Getter
public class NewDestination extends BaseDomain {
    public static final Integer STATE_HOT = 1; //热门
    public static final Integer STATE_NORMAL = 0; //普通


    private Long parent_id;

    private Long region_id;

    private String name;

    private Integer hot = STATE_NORMAL;

    private String coverUrl;

    private String info;

    private Quarter quarter;//月份

    private DestinationThemeTag tag;//标签

    private Route route;//路线

    private Integer deep;

    private List<NewDestination> children = new ArrayList<>();


    public String getJson() {
        Map<String, Object> map = new HashMap<>();
        map.put("id", id);
        map.put("info", info);
        return JSON.toJSONString(map);
    }

    public String getHotName() {
        return hot == STATE_HOT ? "热门" : "普通";
    }
}