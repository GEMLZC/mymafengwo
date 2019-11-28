package cn.wolfcode.luowowo.article.mapper;

import cn.wolfcode.luowowo.article.domain.StrategyCollect;
import java.util.List;

public interface StrategyCollectMapper {

    int insert(StrategyCollect record);

    List<StrategyCollect> selectAll();

    List<Long> selectByUserId(Long userid);
}