package cn.wolfcode.luowowo.search.service.impl;

import cn.wolfcode.luowowo.search.query.SearchQueryObject;
import cn.wolfcode.luowowo.search.repository.StrategyRepository;
import cn.wolfcode.luowowo.search.service.IStrategySearchService;
import cn.wolfcode.luowowo.search.template.StrategyTemplate;
import cn.wolfcode.luowowo.search.vo.StatsResult;
import org.apache.dubbo.config.annotation.Service;
import org.elasticsearch.index.query.QueryBuilders;
import org.elasticsearch.search.SearchService;
import org.elasticsearch.search.aggregations.bucket.composite.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.elasticsearch.core.aggregation.AggregatedPage;
import org.springframework.data.elasticsearch.core.query.NativeSearchQueryBuilder;

import java.util.*;

@Service
public class StrategySearchServiceImpl implements IStrategySearchService {
    @Autowired
    private StrategyRepository repository;

    @Override
    public void save(StrategyTemplate template) {
        repository.save(template);
    }

    @Override
    public List<StatsResult> listCondition(int condition) {
        List<StatsResult> list = new ArrayList<>();
        String fieldId = "";
        String fieldName = "";
        switch (condition) {
            case SearchQueryObject.CONDITION_UNABROAD://国外
                fieldId = "provinceId";
                fieldName = "provinceName";
                break;
            case SearchQueryObject.CONDITION_ABROAD://国内
                fieldId = "countryId";
                fieldName = "countryName";
                break;
            case SearchQueryObject.CONDITION_THEME://主题
                fieldId = "themeId";
                fieldName = "themeName";
                break;
        }
        return searchGroup(fieldId, fieldName,condition);
    }


    /**
     * 桶聚合
     * @param fieldId
     * @param fieldName
     * @param condition
     * @return
     */
    private List<StatsResult> searchGroup(String fieldId, String fieldName,int condition) {
        NativeSearchQueryBuilder builder = new NativeSearchQueryBuilder();
        //排除中国的数据
        switch (condition){
            case SearchQueryObject.CONDITION_UNABROAD:
                builder.withQuery(QueryBuilders.termQuery("countryId",StatsResult.CHINA_ID));
                break;
            case SearchQueryObject.CONDITION_ABROAD:
                builder.withQuery(QueryBuilders.boolQuery().mustNot(
                        QueryBuilders.termQuery("countryId",StatsResult.CHINA_ID)
                ));
                break;
        }


        List<StatsResult> list = new ArrayList<>();


        builder.withPageable(PageRequest.of(0, 1));

        List<CompositeValuesSourceBuilder<?>> sources = new ArrayList<>();
        sources.add(new TermsValuesSourceBuilder("id").field(fieldId));
        sources.add(new TermsValuesSourceBuilder("name").field(fieldName));

        builder.addAggregation(new CompositeAggregationBuilder("condition", sources));

        AggregatedPage<StrategyTemplate> page = (AggregatedPage<StrategyTemplate>) repository.search(builder.build());

        InternalComposite group = (InternalComposite) page.getAggregation("condition");

        for (CompositeAggregation.Bucket bucket : group.getBuckets()) {
            Map<String, Object> map = bucket.getKey();

            Object id = map.get("id");
            Object name = map.get("name");

            Long count = bucket.getDocCount();
            list.add(new StatsResult(Long.parseLong(id.toString()), name.toString(), count));
        }

        return list;
    }

    @Override
    public Page<StrategyTemplate> list(SearchQueryObject qo) {
        Page<StrategyTemplate> page = null;
        Pageable pageable = qo.getPageable();
        Long value = qo.getTypeValue();
        switch (qo.getType()) {
            case SearchQueryObject.CONDITION_UNABROAD://国内通过省份id查询
                page = repository.findByProvinceId(value,pageable);
                break;
            case SearchQueryObject.CONDITION_ABROAD://国外通过国家id查询
                page = repository.findByCountryId(value,pageable);
                break;
            case SearchQueryObject.CONDITION_THEME://通过主题id查询
                page = repository.findByThemeId(value,pageable);
                break;
            default:
                page = repository.findAll(pageable);
        }
        return page;
    }

    @Override
    public List<Map<String, Object>> themeCommend() {
        List<Map<String, Object>> list = new ArrayList<>();
        //桶聚合分类
        List<StatsResult> themes = searchGroup("themeId","themeName",0);//不排除中国
        for (StatsResult theme : themes) {
            Map<String, Object> map = new HashMap<>();
            map.put("theme",theme);
            Long themeId = theme.getId();

            //根据id查询攻略
            List<StrategyTemplate> strategyTemplates = repository.findByThemeId(themeId, null).getContent();
            HashSet<StatsResult> set = new HashSet<>();
            for (StrategyTemplate template : strategyTemplates) {
                //把每个查询出来的攻略封装到StatsResult中，并添加到set中
                set.add(new StatsResult(template.getDestId(),template.getDestName(),null));
            }
            map.put("dests",set);
            list.add(map);
        }

        return list;
    }


    @Override
    public List<StrategyTemplate> queryByName(String name) {
        return repository.findByDestName(name);
    }

}
