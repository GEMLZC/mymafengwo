package cn.wolfcode.luowowo.article.service;


import cn.wolfcode.luowowo.article.domain.StrategyContent;

/**
 * 文章内容接口
 */
public interface IStrategyContentService {
    /**
     * 根据id查询
     * @return
     */
    StrategyContent queryById(Long id);
}
