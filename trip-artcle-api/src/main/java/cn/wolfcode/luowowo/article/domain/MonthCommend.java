package cn.wolfcode.luowowo.article.domain;

import cn.wolfcode.luowowo.common.domain.BaseDomain;
import lombok.*;

import java.util.List;

@NoArgsConstructor
@AllArgsConstructor
@Setter@Getter@ToString
public class MonthCommend extends BaseDomain {

    private  int queryId;//搜索id

    private String name;//目的地名称

    private String coverUrl;//目的地封面

    private String info;//目的地信息

    private List<DestinationTags> destTags;//目的地标签集合对象

    private List<DestinationLines> destinationLines;//目的地线路集合对象

}
