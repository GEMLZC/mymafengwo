package cn.wolfcode.luowowo.search.repository;

import cn.wolfcode.luowowo.search.template.DestinationTemplate;
import org.springframework.data.elasticsearch.repository.ElasticsearchRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface DestinationRepository extends ElasticsearchRepository<DestinationTemplate,Long>{
    DestinationTemplate findByName(String name);
}
