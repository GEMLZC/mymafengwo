package cn.wolfcode.luowowo.article.mapper;

import cn.wolfcode.luowowo.article.domain.Quarter;
import java.util.List;

public interface QuarterMapper {
    int deleteByPrimaryKey(Long id);

    int insert(Quarter record);

    Quarter selectByPrimaryKey(Long id);

    List<Quarter> selectAll();

    int updateByPrimaryKey(Quarter record);
}