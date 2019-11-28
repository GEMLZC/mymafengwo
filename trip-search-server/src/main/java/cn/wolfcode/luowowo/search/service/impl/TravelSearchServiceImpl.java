package cn.wolfcode.luowowo.search.service.impl;

import cn.wolfcode.luowowo.search.repository.TravelRepository;
import cn.wolfcode.luowowo.search.service.ITravelSearchService;
import cn.wolfcode.luowowo.search.template.TravelTemplate;
import org.apache.dubbo.config.annotation.Service;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

@Service
public class TravelSearchServiceImpl implements ITravelSearchService {
    @Autowired
    private TravelRepository repository;

    @Override
    public void save(TravelTemplate template) {
        repository.save(template);
    }

    @Override
    public List<TravelTemplate> queryByName(String name) {
        return repository.findByDestName(name);
    }
}
