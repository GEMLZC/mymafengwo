package cn.wolfcode.luowowo.article.mapper;

import cn.wolfcode.luowowo.article.domain.DestinationThemeTag;
import java.util.List;

public interface DestinationThemeTagMapper {
    int deleteByPrimaryKey(Long id);

    int insert(DestinationThemeTag record);

    DestinationThemeTag selectByPrimaryKey(Long id);

    List<DestinationThemeTag> selectAll();

    int updateByPrimaryKey(DestinationThemeTag record);

    List<DestinationThemeTag> selectByThemeId(Long themeId);
}