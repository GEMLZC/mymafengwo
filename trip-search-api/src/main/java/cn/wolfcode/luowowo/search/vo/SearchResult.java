package cn.wolfcode.luowowo.search.vo;

import cn.wolfcode.luowowo.search.template.DestinationTemplate;
import cn.wolfcode.luowowo.search.template.StrategyTemplate;
import cn.wolfcode.luowowo.search.template.TravelTemplate;
import cn.wolfcode.luowowo.search.template.UserInfoTemplate;
import lombok.Getter;
import lombok.Setter;

import java.io.Serializable;
import java.util.Collections;
import java.util.List;

@Setter@Getter
public class SearchResult implements Serializable {
    private Integer total = 0;

    private List<DestinationTemplate> dests = Collections.EMPTY_LIST;
    private List<TravelTemplate> travels = Collections.EMPTY_LIST;
    private List<StrategyTemplate> strategys = Collections.EMPTY_LIST;
    private List<UserInfoTemplate> users = Collections.EMPTY_LIST;
}
