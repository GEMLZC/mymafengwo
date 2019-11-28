package cn.wolfcode.luowowo.article.service;

import cn.wolfcode.luowowo.article.domain.StrategyCollect;
import cn.wolfcode.luowowo.article.domain.TravelCollect;

import java.util.List;

public interface ITravelCollectService {
    /**
     * 保存用户收藏的攻略
     * @param travelCollect
     */
    void save(TravelCollect travelCollect);

    /**
     * 根据用户id获取数据库中的攻略关系
     * @param userid
     * @return 游记id
     */
    List<Long> listtravel(Long userid);

    /**
     * 查询所有关系
     * @return
     */
    List<TravelCollect> list();
}
