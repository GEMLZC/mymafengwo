package cn.wolfcode.luowowo.search.service.impl;

import cn.wolfcode.luowowo.search.repository.UserInfoRepository;
import cn.wolfcode.luowowo.search.service.IUserInfoSearchService;
import cn.wolfcode.luowowo.search.template.UserInfoTemplate;
import org.apache.dubbo.config.annotation.Service;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

@Service
public class UserInfoSearchServiceImpl implements IUserInfoSearchService {
    @Autowired
    private UserInfoRepository repository;

    @Override
    public void save(UserInfoTemplate template) {
        repository.save(template);
    }

    @Override
    public List<UserInfoTemplate> queryByName(String name) {
        return repository.findByDestName(name);
    }
}
