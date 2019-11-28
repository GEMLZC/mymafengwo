package cn.wolfcode.luowowo.search.service;

import cn.wolfcode.luowowo.search.query.SearchQueryObject;
import cn.wolfcode.luowowo.search.template.StrategyTemplate;
import cn.wolfcode.luowowo.search.vo.StatsResult;
import org.springframework.data.domain.Page;

import java.util.List;
import java.util.Map;

public interface IStrategySearchService {
    /**
     * 保存信息
     * @param template
     */
    void save(StrategyTemplate template);

    /**
     * 区别分组类型
     * @param conditionUnabroad
     * @return
     */
    List<StatsResult> listCondition(int conditionUnabroad);

    /**
     * 分页查询
     * @param qo
     * @return
     */
    Page<StrategyTemplate> list(SearchQueryObject qo);

    /**
     * 主题推荐
     * @return
     */
    List<Map<String,Object>> themeCommend();

    /**
     * 通过地区名称查询
     * @param name
     * @return
     */
    List<StrategyTemplate> queryByName(String name);
}
