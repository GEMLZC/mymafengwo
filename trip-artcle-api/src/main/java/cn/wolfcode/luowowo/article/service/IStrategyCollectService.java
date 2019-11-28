package cn.wolfcode.luowowo.article.service;

import cn.wolfcode.luowowo.article.domain.StrategyCollect;
import cn.wolfcode.luowowo.article.domain.Travel;

import java.util.List;

public interface IStrategyCollectService {
    /**
     * 保存用户收藏的攻略
     * @param strategyCollect
     */
    void save(StrategyCollect strategyCollect);

    /**
     * 根据用户id获取数据库中的攻略关系
     * @param userid
     * @return
     */
    List<Long> liststrategy(Long userid);

    /**
     * 查询所有收藏关系
     * @return
     */
    List<StrategyCollect> list();


}
