package cn.wolfcode.luowowo.search.service;

import cn.wolfcode.luowowo.search.query.SearchQueryObject;
import org.springframework.data.domain.Page;

public interface ISearchService {
    <T> Page<T> hightLightSearch(String indexAndType, Class<T> clz, SearchQueryObject qo, String... fields);

}
