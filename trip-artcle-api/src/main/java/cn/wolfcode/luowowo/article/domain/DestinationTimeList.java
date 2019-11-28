package cn.wolfcode.luowowo.article.domain;

import cn.wolfcode.luowowo.common.domain.BaseDomain;
import lombok.Getter;
import lombok.Setter;

import java.util.ArrayList;
import java.util.List;

@Setter
@Getter
public class DestinationTimeList extends BaseDomain {
    //月份集合
    private List<Quarter> quarters = new ArrayList<>();
    //单个主题标签集合
    private List<DestinationThemeTag> tags = new ArrayList<>();
}
