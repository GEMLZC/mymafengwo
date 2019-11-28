package cn.wolfcode.luowowo.article.mapper;

import cn.wolfcode.luowowo.article.domain.View;
import cn.wolfcode.luowowo.common.query.QueryObject;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ViewMapper {
    int deleteByPrimaryKey(Long id);

    int insert(View record);

    View selectByPrimaryKey(Long id);

    List<View> selectAll();

    int updateByPrimaryKey(View record);


    List<View> queryForList(QueryObject qo);


    List<View> selectByDestAndType(@Param("destId") Long destId, @Param("type") int type);

    List<View> selectByTagIs(Long tagId);

    List<View> selectByParentId(Long id);
}