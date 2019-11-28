package cn.wolfcode.luowowo.search.service;

import cn.wolfcode.luowowo.search.template.DestinationTemplate;

public interface IDestinationSearchService {
    void save(DestinationTemplate template);

    DestinationTemplate queryByName(String name);
}
