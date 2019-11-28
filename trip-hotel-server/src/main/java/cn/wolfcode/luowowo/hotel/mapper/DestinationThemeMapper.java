package cn.wolfcode.luowowo.hotel.mapper;

import cn.wolfcode.luowowo.hotel.domain.DestinationTheme;
import java.util.List;

public interface DestinationThemeMapper {
    int deleteByPrimaryKey(Long id);

    int insert(DestinationTheme record);

    DestinationTheme selectByPrimaryKey(Long id);

    List<DestinationTheme> selectAll();

    int updateByPrimaryKey(DestinationTheme record);
}