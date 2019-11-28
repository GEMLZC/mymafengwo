package cn.wolfcode.luowowo.search.service;

import cn.wolfcode.luowowo.search.template.UserInfoTemplate;

import java.util.List;

public interface IUserInfoSearchService {
    void save(UserInfoTemplate template);

    /**
     * 通过地区名称查询
     * @param name
     * @return
     */
    List<UserInfoTemplate> queryByName(String name);
}
