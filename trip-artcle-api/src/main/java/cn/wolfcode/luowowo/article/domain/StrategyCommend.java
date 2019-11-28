package cn.wolfcode.luowowo.article.domain;

import cn.wolfcode.luowowo.common.domain.BaseDomain;
import com.alibaba.fastjson.JSON;
import lombok.Getter;
import lombok.Setter;

import java.util.HashMap;
import java.util.Map;

@Setter@Getter
public class StrategyCommend extends BaseDomain {
    public static final Integer STATE_NORMAL = 0; //正常
    public static final Integer STATE_DISABLE = 1; //禁用

    private Long detailId;
    private String title;
    private String subTitle;
    private String coverUrl;
    private Integer sequence;
    private Integer state = STATE_NORMAL;

    public String getStateName() {
        String msg = "正常";
        if (state == STATE_DISABLE) {
            msg = "禁用";
        }
        return msg;
    }

    public String getJson() {
        Map<String, Object> map = new HashMap<>();
        map.put("id", id);
        map.put("detailId", detailId);
        map.put("title", title);
        map.put("subTitle", subTitle);
        map.put("sequence", sequence);
        map.put("coverUrl", coverUrl);
        return JSON.toJSONString(map);
    }
}
