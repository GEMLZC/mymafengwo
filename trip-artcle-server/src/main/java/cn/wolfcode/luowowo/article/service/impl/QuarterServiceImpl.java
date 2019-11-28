package cn.wolfcode.luowowo.article.service.impl;

import cn.wolfcode.luowowo.article.domain.Quarter;
import cn.wolfcode.luowowo.article.mapper.QuarterMapper;
import cn.wolfcode.luowowo.article.service.IQuarterService;
import org.apache.dubbo.config.annotation.Service;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

@Service
public class QuarterServiceImpl implements IQuarterService {
    @Autowired
    private  QuarterMapper quarterMapper;

    @Override
    public List<Quarter> query() {
        return quarterMapper.selectAll();
    }

    @Override
    public List<Quarter> listAll() {
        return quarterMapper.selectAll();
    }

    @Override
    public Quarter get(Long mid) {
        return quarterMapper.selectByPrimaryKey(mid);
    }

}
