package cn.wolfcode.luowowo.article.domain;

import cn.wolfcode.luowowo.common.domain.BaseDomain;
import lombok.Getter;
import lombok.Setter;

import java.util.ArrayList;
import java.util.List;

@Setter
@Getter
public class Quarter extends BaseDomain {

    private String name;//月份

    private List<NewDestination> destinations = new ArrayList<>();


}