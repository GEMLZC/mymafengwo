package cn.wolfcode.luowowo.search.repository;

import cn.wolfcode.luowowo.search.template.StrategyTemplate;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.elasticsearch.repository.ElasticsearchRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface StrategyRepository extends ElasticsearchRepository<StrategyTemplate,Long>{
    /**
     * 国内通过省份id查询
     * @param typeValue
     * @return
     */
    Page<StrategyTemplate> findByProvinceId(Long typeValue , Pageable pageable);

    /**
     * 国外通过国家id查询
     * @param typeValue
     * @return
     */
    Page<StrategyTemplate> findByCountryId(Long typeValue, Pageable pageable);

    /**
     * 通过主题id查询
     * @param typeValue
     * @return
     */
    Page<StrategyTemplate> findByThemeId(Long typeValue, Pageable pageable);


    /**
     * 通过地区名称查询
     * @param name
     * @return
     */
    List<StrategyTemplate> findByDestName(String name);
}
