package cn.wolfcode.luowowo.article.service;

import cn.wolfcode.luowowo.article.domain.StrategyCatalog;
import cn.wolfcode.luowowo.common.query.QueryObject;
import com.github.pagehelper.PageInfo;

import java.util.List;

public interface IStrategyCatalogService {
    /**
     * 分页查询
     * @param qo
     * @return
     */
    PageInfo<StrategyCatalog> query(QueryObject qo);

    List<StrategyCatalog> getCatalogById(Long id);

    /**
     * 通过地区id查询
     * @param id
     * @return
     */
    List<StrategyCatalog> queryCatalogByDestId(Long id);

    void saveOrUpdate(StrategyCatalog strategyCatalog);

    List<StrategyCatalog> list();
}
