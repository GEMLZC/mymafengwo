package cn.wolfcode.luowowo.article.mapper;

import cn.wolfcode.luowowo.article.domain.ViewContent;
import java.util.List;

public interface ViewContentMapper {
    int insert(ViewContent record);

    List<ViewContent> selectAll();

    ViewContent selectByPrimaryKey(Long viewId);
}