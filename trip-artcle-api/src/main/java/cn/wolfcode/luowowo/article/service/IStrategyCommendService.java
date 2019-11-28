package cn.wolfcode.luowowo.article.service;

import cn.wolfcode.luowowo.article.domain.StrategyCommend;
import cn.wolfcode.luowowo.common.query.QueryObject;
import com.github.pagehelper.PageInfo;

import java.util.List;

public interface IStrategyCommendService {
    /**
     * 保存信息
     * @param strategyCommend
     */
    void save(StrategyCommend strategyCommend);

    /**
     * 分页查询
     * @param qo
     * @return
     */
    PageInfo<StrategyCommend> query(QueryObject qo);

    /**
     * 查询前五的推荐游记
     * @return
     */
    List<StrategyCommend> listTop5();

}
