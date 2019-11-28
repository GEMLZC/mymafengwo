package cn.wolfcode.luowowo.article.service.impl;

import cn.wolfcode.luowowo.article.domain.StrategyCatalog;
import cn.wolfcode.luowowo.article.mapper.StrategyCatalogMapper;
import cn.wolfcode.luowowo.article.service.IStrategyCatalogService;
import cn.wolfcode.luowowo.common.query.QueryObject;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.apache.dubbo.config.annotation.Service;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

@Service
public class StrategyCatalogServiceImpl implements IStrategyCatalogService {
    @Autowired
    private StrategyCatalogMapper strategyCatalogMapper;

    @Override
    public PageInfo<StrategyCatalog> query(QueryObject qo) {
        PageHelper.startPage(qo.getCurrentPage(),qo.getPageSize());
        List<StrategyCatalog> list = strategyCatalogMapper.selectForList(qo);
        return new PageInfo<>(list);
    }

    @Override
    public List<StrategyCatalog> getCatalogById(Long id) {
        return null;
    }

    @Override
    public List<StrategyCatalog> queryCatalogByDestId(Long id) {
        return strategyCatalogMapper.selectByDestId(id);
    }

    @Override
    public void saveOrUpdate(StrategyCatalog strategyCatalog) {
        if (strategyCatalog.getId() == null){
            strategyCatalogMapper.insert(strategyCatalog);
        }else {
            strategyCatalogMapper.updateByPrimaryKey(strategyCatalog);
        }
    }

    @Override
    public List<StrategyCatalog> list() {
        return strategyCatalogMapper.selectAll();
    }
}
