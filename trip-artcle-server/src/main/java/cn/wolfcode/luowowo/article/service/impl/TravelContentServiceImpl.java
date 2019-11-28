package cn.wolfcode.luowowo.article.service.impl;

import cn.wolfcode.luowowo.article.domain.TravelContent;
import cn.wolfcode.luowowo.article.mapper.TravelContentMapper;
import cn.wolfcode.luowowo.article.service.ITravelContentService;
import org.apache.dubbo.config.annotation.Service;
import org.springframework.beans.factory.annotation.Autowired;

@Service
public class TravelContentServiceImpl implements ITravelContentService{
    @Autowired
    private TravelContentMapper travelContentMapper;

    @Override
    public TravelContent queryById(Long id) {
        return travelContentMapper.selectById(id);
    }
}
