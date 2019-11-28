package cn.wolfcode.luowowo.article.service.impl;

import cn.wolfcode.luowowo.article.domain.TravelAgency;
import cn.wolfcode.luowowo.article.mapper.TravelAgencyMapper;
import cn.wolfcode.luowowo.article.service.ITravelAgencyService;
import org.apache.dubbo.config.annotation.Service;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;
@Service
public class TravelAgencyServiceImpl implements ITravelAgencyService{

    @Autowired
    private TravelAgencyMapper travelAgencyMapper;


    @Override
    public List<TravelAgency> query() {
        return travelAgencyMapper.selectAll();
    }
}
