package cn.wolfcode.luowowo.article.mapper;

import cn.wolfcode.luowowo.article.domain.ViewComment;
import cn.wolfcode.luowowo.common.query.QueryObject;

import java.util.List;

public interface ViewCommentMapper {
    int deleteByPrimaryKey(Long id);

    int insert(ViewComment record);

    ViewComment selectByPrimaryKey(Long id);

    List<ViewComment> selectAll();

    int updateByPrimaryKey(ViewComment record);

    List<ViewComment> queryForList(QueryObject qo);

    List<ViewComment> selectByUserId(Long uid);
}