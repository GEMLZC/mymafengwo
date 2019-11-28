package cn.wolfcode.luowowo.article.mapper;

import cn.wolfcode.luowowo.article.domain.Route;
import java.util.List;

public interface RouteMapper {
    int deleteByPrimaryKey(Long id);

    int insert(Route record);

    Route selectByPrimaryKey(Long id);

    List<Route> selectAll();

    int updateByPrimaryKey(Route record);
}