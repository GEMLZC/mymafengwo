package cn.wolfcode.luowowo.article.service;

import cn.wolfcode.luowowo.article.domain.StrategyTag;
import cn.wolfcode.luowowo.article.domain.StrategyTheme;
import cn.wolfcode.luowowo.common.query.QueryObject;
import com.github.pagehelper.PageInfo;

import java.util.List;

/**
 * 主题接口
 */
public interface IStrategyThemeService {
    /**
     * 分页查询
     * @return
     */
    PageInfo<StrategyTheme> query(QueryObject qo);

    /**
     * 保存信息
     * @param strategyTheme
     */
    void saveOrUpdate(StrategyTheme strategyTheme);

    /**
     * 不分页查询
     * @return
     */
    List<StrategyTheme> list();
}
