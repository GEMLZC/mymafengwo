package cn.wolfcode.luowowo.common.query;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class DestinationQuery extends QueryObject{
    private Long parentId = -1L;//默认-1不加入查询条件中
    private Long hot = -1L;
}
