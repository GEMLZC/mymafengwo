package cn.wolfcode.luowowo.article.mapper;

import cn.wolfcode.luowowo.article.domain.DestinationTheme;
import java.util.List;

public interface DestinationThemeMapper {
    int deleteByPrimaryKey(Long id);

    int insert(DestinationTheme record);

    DestinationTheme selectByPrimaryKey(Long id);

    List<DestinationTheme> selectAll();

    int updateByPrimaryKey(DestinationTheme record);

    List<DestinationTheme> selectExcludeTheme(Long themeType);
}