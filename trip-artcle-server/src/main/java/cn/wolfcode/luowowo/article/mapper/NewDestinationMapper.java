package cn.wolfcode.luowowo.article.mapper;

import cn.wolfcode.luowowo.article.domain.NewDestination;
import cn.wolfcode.luowowo.common.query.NewDestinationQuery;

import java.util.List;

public interface NewDestinationMapper {
    int deleteByPrimaryKey(Long id);

    int insert(NewDestination record);

    NewDestination selectByPrimaryKey(Long id);

    List<NewDestination> selectAll();

    List<NewDestination> selectForList(NewDestinationQuery qo);

    int updateByPrimaryKey(NewDestination record);
}