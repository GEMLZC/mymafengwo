package cn.wolfcode.luowowo.article.mapper;

import cn.wolfcode.luowowo.article.domain.ViewTag;
import java.util.List;

public interface ViewTagMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(ViewTag record);

    ViewTag selectByPrimaryKey(Integer id);

    List<ViewTag> selectAll();

    int updateByPrimaryKey(ViewTag record);

    List<ViewTag> selectByDestId(Long destId);
}