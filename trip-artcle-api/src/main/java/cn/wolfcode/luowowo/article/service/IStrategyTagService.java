package cn.wolfcode.luowowo.article.service;

import cn.wolfcode.luowowo.article.domain.StrategyTag;
import cn.wolfcode.luowowo.common.query.QueryObject;
import com.github.pagehelper.PageInfo;

import java.util.List;

/**
 * 标签接口
 */
public interface IStrategyTagService {
    /**
     * 查询全部标签
     * @return
     */
    PageInfo<StrategyTag> query(QueryObject qo);

    /**
     * 根据文章明细id查询标签
     * @param id
     * @return
     */
    String queryDetailTagByTagId(Long id);

    /**
     * 根据地区id联表查询标签
     * @param destId
     * @return
     */
    List<StrategyTag> queryDetailTagByDestId(Long destId);
}
