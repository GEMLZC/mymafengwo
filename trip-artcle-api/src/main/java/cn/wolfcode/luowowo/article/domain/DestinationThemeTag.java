package cn.wolfcode.luowowo.article.domain;

import cn.wolfcode.luowowo.common.domain.BaseDomain;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

/**
 * 地区主题标签
 */
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class DestinationThemeTag extends BaseDomain {
    private String name;
    private String coverImg;
    private DestinationTheme theme;


}