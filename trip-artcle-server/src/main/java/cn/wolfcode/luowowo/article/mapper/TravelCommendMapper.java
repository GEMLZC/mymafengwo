package cn.wolfcode.luowowo.article.mapper;

import cn.wolfcode.luowowo.article.domain.TravelCommend;
import cn.wolfcode.luowowo.common.query.QueryObject;

import java.util.List;

public interface TravelCommendMapper {
    int deleteByPrimaryKey(Long id);

    int insert(TravelCommend record);

    TravelCommend selectByPrimaryKey(Long id);

    List<TravelCommend> selectAll();

    List<TravelCommend> selectForList(QueryObject qo);

    int updateByPrimaryKey(TravelCommend record);

    List<TravelCommend> selectTop5();

}