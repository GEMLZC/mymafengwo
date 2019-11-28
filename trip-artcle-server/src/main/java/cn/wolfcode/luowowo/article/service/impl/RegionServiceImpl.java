package cn.wolfcode.luowowo.article.service.impl;

import cn.wolfcode.luowowo.article.domain.Destination;
import cn.wolfcode.luowowo.article.domain.Region;
import cn.wolfcode.luowowo.article.mapper.RegionMapper;
import cn.wolfcode.luowowo.article.service.IRegionService;
import cn.wolfcode.luowowo.common.query.QueryObject;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.apache.dubbo.config.annotation.Service;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

@Service
public class RegionServiceImpl implements IRegionService{
    @Autowired
    private RegionMapper regionMapper;

    @Override
    public PageInfo<Region> query(QueryObject qo) {
        PageHelper.startPage(qo.getCurrentPage(),qo.getPageSize());
        return new PageInfo<>(regionMapper.selectForList(qo));
    }

    @Override
    public List<Region> queryHostRegion() {
        return regionMapper.selectHostRegion();
    }

    @Override
    public void save(Region destr) {

    }

    @Override
    public Region queryById(Long drid) {
        return regionMapper.selectByPrimaryKey(drid);
    }

    @Override
    public void updateStatus(Long id, Long status) {

    }

    @Override
    public Region queryDestReById(Long id) {
        return null;
    }

    @Override
    public List<Region> queryAllIshot(Integer ishot) {
        return null;
    }

    @Override
    public void saveOrUpdate(Region region) {
        if (region.getId() == null){
            regionMapper.insert(region);
        }else {
            regionMapper.updateByPrimaryKey(region);
        }
    }
}
