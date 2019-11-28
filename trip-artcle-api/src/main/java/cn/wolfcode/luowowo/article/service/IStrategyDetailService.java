package cn.wolfcode.luowowo.article.service;

import cn.wolfcode.luowowo.article.domain.StrategyDetail;
import cn.wolfcode.luowowo.common.query.QueryObject;
import cn.wolfcode.luowowo.common.query.StrategyDetailQuery;
import com.github.pagehelper.PageInfo;

import java.util.List;

/**
 * 攻略明细接口
 */
public interface IStrategyDetailService {
    /**
     * 分页查询
     * @return
     */
    PageInfo<StrategyDetail> query(StrategyDetailQuery qo);

    /**
     * 查询全部
     * @return
     */
    List<StrategyDetail> query();

    /**
     * 保存信息
     * @param strategyDetail
     */
    void saveOrUpdate(StrategyDetail strategyDetail);

    /**
     * 根据id查询
     * @param id
     * @return
     */
    StrategyDetail queryById(Long id);

    /**
     * 前端信息保存
     * @param strategyDetail
     * @param tags
     */
    void saveOrUpdate(StrategyDetail strategyDetail, String tags);

    /**
     * 通过分类id查询
     * @param catalogId
     * @return
     */
    List<StrategyDetail> queryByCatalogId(Long catalogId);

    /**
     * 通过地区id查询
     * @param destId
     * @return
     */
    List<StrategyDetail> queryByDestId(Long destId);

    /**
     * 更新统计数据
     * @param strategyDetail
     */
    void updateStats(StrategyDetail strategyDetail);


}
