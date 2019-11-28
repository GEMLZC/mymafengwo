package cn.wolfcode.luowowo.article.domain;

import cn.wolfcode.luowowo.common.domain.BaseDomain;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

/**
 * 线路
 */
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class Route extends BaseDomain{

    private String name;//线路名称

    private String summary;//摘要

    private Integer day;//出行天数
}