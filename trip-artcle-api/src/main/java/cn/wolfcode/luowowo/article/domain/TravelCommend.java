package cn.wolfcode.luowowo.article.domain;

import cn.wolfcode.luowowo.common.domain.BaseDomain;
import com.alibaba.fastjson.JSON;
import lombok.Getter;
import lombok.Setter;

import java.util.HashMap;
import java.util.Map;

@Setter@Getter
public class TravelCommend extends BaseDomain {
    public static final Integer STATE_NORMAL = 0;
    public static final Integer STATE_DISABLE = 1;

    private Long travelId;

    private String title;

    private String subTitle;

    private String coverUrl;

    private Integer state = STATE_NORMAL;

    private Integer sequence;

    public String getStateName() {
        String msg = "推荐";
        if (state == STATE_DISABLE) {
            msg = "禁用";
        }
        return msg;
    }

    public String getJson() {
        Map<String, Object> map = new HashMap<>();
        map.put("id", id);
        map.put("travelId", travelId);
        map.put("title", title);
        map.put("subTitle", subTitle);
        map.put("coverUrl", coverUrl);
        map.put("state", state);
        map.put("sequence", sequence);
        return JSON.toJSONString(map);
    }
}