package cn.wolfcode.luowowo.article.service.impl;

import cn.wolfcode.luowowo.article.domain.TravelCommend;
import cn.wolfcode.luowowo.article.mapper.TravelCommendMapper;
import cn.wolfcode.luowowo.article.service.ITravelCommendService;
import cn.wolfcode.luowowo.common.query.QueryObject;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.apache.dubbo.config.annotation.Service;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

@Service
public class TravelCommendServiceImpl implements ITravelCommendService {
    @Autowired
    private TravelCommendMapper travelCommendMapper;

    @Override
    public void save(TravelCommend travelCommend) {
        travelCommendMapper.insert(travelCommend);
    }

    @Override
    public PageInfo<TravelCommend> query(QueryObject qo) {
        PageHelper.startPage(qo.getCurrentPage(),qo.getPageSize());
        List<TravelCommend> list = travelCommendMapper.selectForList(qo);

        return new PageInfo<>(list);
    }

    @Override
    public List<TravelCommend> listTop5() {
        return travelCommendMapper.selectTop5();
    }
}
