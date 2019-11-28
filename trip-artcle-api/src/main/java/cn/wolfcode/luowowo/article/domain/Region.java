package cn.wolfcode.luowowo.article.domain;

import cn.wolfcode.luowowo.common.domain.BaseDomain;
import com.alibaba.fastjson.JSON;
import lombok.Getter;
import lombok.Setter;
import org.springframework.util.StringUtils;

import java.util.HashMap;
import java.util.Map;

@Setter@Getter
public class Region extends BaseDomain {
    public static final Integer STATE_HOT = 1; //热门
    public static final Integer STATE_NORMAL = 0; //普通

    public static final Integer STATE_ENABLE = 1; //启用
    public static final Integer STATE_DISABLE = 0; //禁用

    private String name;

    private String sn;

    private String ref;

    private Long[] refIds;

    private Integer hot = STATE_NORMAL;

    private String info;

    private Integer state = STATE_ENABLE;

    public String getStateName() {
        return state == STATE_ENABLE ? "启用" : "禁用";
    }

    public String getHotName() {
        return hot == STATE_HOT ? "热门" : "普通";
    }

    public String getRef() {
        if (refIds == null) {
            return null;
        }

        StringBuilder sb = new StringBuilder();
        for (Long id : refIds) {
            sb.append(id).append(",");
        }
        sb.deleteCharAt(sb.length() - 1);
        ref = sb.toString();
        return ref;
    }

    public Long[] getRefIds() {
        if (!StringUtils.hasLength(ref)) {
            return null;
        }
        String[] vals = ref.split(",");
        refIds = new Long[vals.length];
        for (int i = 0; i < vals.length; i++) {
            refIds[i] = Long.valueOf(vals[i]);
        }
        return refIds;
    }

    public String getJson() {
        Map<String, Object> map = new HashMap<>();
        map.put("id", id);
        map.put("info", info);
        map.put("name", name);
        map.put("sn", sn);
        if (ref != null) {
            map.put("ref", ref);
        } else {
            map.put("ref", getRef());
        }
        if (refIds != null) {
            map.put("refIds", refIds);
        } else {
            map.put("refIds", getRefIds());
        }
        map.put("info", info);
        map.put("hot", hot);
        map.put("state", state);
        return JSON.toJSONString(map);
    }
}