package cn.wolfcode.luowowo.article.mapper;

import cn.wolfcode.luowowo.article.domain.TravelContent;
import java.util.List;

public interface TravelContentMapper {
    int insert(TravelContent record);

    List<TravelContent> selectAll();

    TravelContent selectById(Long id);

    void updateByPrimaryKey(TravelContent content);
}