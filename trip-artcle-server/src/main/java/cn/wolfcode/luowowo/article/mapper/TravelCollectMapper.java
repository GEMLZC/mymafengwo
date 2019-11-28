package cn.wolfcode.luowowo.article.mapper;

import cn.wolfcode.luowowo.article.domain.TravelCollect;
import java.util.List;

public interface TravelCollectMapper {
    int insert(TravelCollect record);

    List<TravelCollect> selectAll();

    List<Long> selectByUserId(Long userid);
}