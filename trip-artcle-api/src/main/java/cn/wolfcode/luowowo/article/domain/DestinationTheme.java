package cn.wolfcode.luowowo.article.domain;

import cn.wolfcode.luowowo.common.domain.BaseDomain;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.ArrayList;
import java.util.List;

/**
 * 地区主题
 */
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class DestinationTheme extends BaseDomain{
    //主题类型
    public final static long THEME_YEAR = 1;//全年适宜
    public final static long THEME_SEASON = 2;//季节
    public final static long THEME_TRAVEL = 3;//出行方式
    public final static long THEME_HOLIDAY = 4;//节假日

    private String name;
    List<DestinationThemeTag> tags = new ArrayList<>();//所有的标签

}