package cn.wolfcode.luowowo.article.service.impl;

import cn.wolfcode.luowowo.article.domain.TravelCollect;
import cn.wolfcode.luowowo.article.mapper.TravelCollectMapper;
import cn.wolfcode.luowowo.article.service.ITravelCollectService;
import cn.wolfcode.luowowo.article.service.ITravelCollectService;
import org.apache.dubbo.config.annotation.Service;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

@Service
public class TravelCollectServiceImpl implements ITravelCollectService{
    @Autowired
    private TravelCollectMapper travelCollectMapper;


    @Override
    public void save(TravelCollect travelCollect) {
        travelCollectMapper.insert(travelCollect);
    }

    @Override
    public List<Long> listtravel(Long userid) {

        return travelCollectMapper.selectByUserId(userid);
    }

    @Override
    public List<TravelCollect> list() {
        return travelCollectMapper.selectAll();
    }
}
