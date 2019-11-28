package cn.wolfcode.luowowo.common.query;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class StrategyDetailQuery extends QueryObject{
    private Long destId = -1l;//地区id
    private Long catalogId = -1l;//分类id
    private Long tagId = -1l;//标签id
}
