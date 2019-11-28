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
public class Destination extends BaseDomain {
    public static final Integer STATE_HOT = 1; //热门
    public static final Integer STATE_NORMAL = 0; //普通

    private String name;//目的地名称

    private Integer hot = STATE_NORMAL;

    private String coverUrl;//目的地封面

    private String info;//目的地信息

    private Integer deep;

    private Destination parent;

    private Region region;

    private List<Destination> children = new ArrayList<>();

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