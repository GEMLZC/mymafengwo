package cn.wolfcode.luowowo.search.service;

import cn.wolfcode.luowowo.search.template.TravelTemplate;

import java.util.List;

public interface ITravelSearchService {
    void save(TravelTemplate template);

    /**
     * 通过地区名称查询
     * @param keyword
     * @return
     */
    List<TravelTemplate> queryByName(String name);
}
