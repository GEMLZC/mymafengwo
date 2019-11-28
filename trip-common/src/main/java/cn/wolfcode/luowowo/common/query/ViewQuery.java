package cn.wolfcode.luowowo.common.query;

import lombok.Getter;
import lombok.Setter;

/**
 * Created by Xhek on 2019/11/23.
 */
@Getter@Setter
public class ViewQuery extends QueryObject {
    private Integer type=-1;
    private Long destId=-1L;

    private Long viewId=-1L;

    private Long tagId=-1L;

    private Long conditionId=-1L;

    private Long parentId=-1L;


}
