package cn.wolfcode.luowowo.article.mapper;

import cn.wolfcode.luowowo.article.domain.TravelAgency;
import java.util.List;

public interface TravelAgencyMapper {
    int deleteByPrimaryKey(Long id);

    int insert(TravelAgency record);

    TravelAgency selectByPrimaryKey(Long id);

    List<TravelAgency> selectAll();

    int updateByPrimaryKey(TravelAgency record);
}