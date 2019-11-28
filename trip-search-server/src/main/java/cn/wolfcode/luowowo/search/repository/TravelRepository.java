package cn.wolfcode.luowowo.search.repository;

import cn.wolfcode.luowowo.search.template.TravelTemplate;
import org.springframework.data.elasticsearch.repository.ElasticsearchRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface TravelRepository extends ElasticsearchRepository<TravelTemplate,Long>{
    List<TravelTemplate> findByDestName(String name);
}
