package cn.wolfcode.luowowo.search.service.impl;

import cn.wolfcode.luowowo.search.repository.DestinationRepository;
import cn.wolfcode.luowowo.search.service.IDestinationSearchService;
import cn.wolfcode.luowowo.search.template.DestinationTemplate;
import org.apache.dubbo.config.annotation.Service;
import org.springframework.beans.factory.annotation.Autowired;

@Service
public class DestinationSearchServiceImpl implements IDestinationSearchService {
    @Autowired
    private DestinationRepository repository;

    @Override
    public void save(DestinationTemplate template) {
        repository.save(template);
    }

    @Override
    public DestinationTemplate queryByName(String name) {
        return repository.findByName(name);
    }
}
