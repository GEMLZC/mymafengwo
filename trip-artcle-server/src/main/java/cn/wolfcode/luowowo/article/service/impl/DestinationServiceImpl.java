package cn.wolfcode.luowowo.article.service.impl;


import cn.wolfcode.luowowo.article.domain.Destination;
import cn.wolfcode.luowowo.article.domain.NewDestination;
import cn.wolfcode.luowowo.article.mapper.DestinationMapper;
import cn.wolfcode.luowowo.article.service.IDestinationService;
import cn.wolfcode.luowowo.common.query.DestinationQuery;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.apache.dubbo.config.annotation.Service;
import org.springframework.beans.factory.annotation.Autowired;


import java.util.ArrayList;
import java.util.List;

@Service
public class DestinationServiceImpl implements IDestinationService {
    @Autowired
    private DestinationMapper destinationMapper;

    @Override
    public PageInfo<Destination> query(DestinationQuery qo) {
        PageHelper.startPage(qo.getCurrentPage(),qo.getPageSize());
        return new PageInfo<>(destinationMapper.selectAll(qo));
    }

    @Override
    public List<Destination> query() {
        return destinationMapper.selectAllNoPage();
    }

    @Override
    public void updateStatus(Long id, Long status) {
        destinationMapper.updateHost(id,status);
    }


    @Override
    public List<Destination> getListDestByDeep(Integer deep) {
        return null;
    }

    @Override
    public List<Destination> getListDestByRef(Long[] refIds) {
        return destinationMapper.selectByPrimaryKeyArray(refIds);
    }

    @Override
    public List<Destination> queryForList() {
        return destinationMapper.selectAllDest();
    }

    @Override
    public List<Destination> queryByParentId(Long parentId) {
        if (parentId == -1) return null;//如果父id是-1直接返回null

        List<Destination> list = new ArrayList<>();
        Destination destination = destinationMapper.selectByPrimaryKey(parentId);
        if (destination != null) {
            list.add(destination);
            //只要还有有上一级地区就不断的发起查询上一级操作
            while (destination.getParent() != null) {
                //把原先的Destination对象信息覆盖，存入新的信息
                destination = destinationMapper.selectByPrimaryKey(destination.getParent().getId());
                //存储到list中
                list.add(0, destination);
            }
        }
        return list;
    }

    @Override
    public void updateInfo(Destination destination) {
        destinationMapper.updateInfoById(destination);
    }

    @Override
    public List<Destination> queryByRegionId(Long regionId) {
        return destinationMapper.selectByRegionId(regionId);
    }

    @Override
    public Destination getCountry(Long destId) {
        return queryByParentId(destId).get(0);
    }

    @Override
    public Destination getProvince(Long destId) {
        List<Destination> toast = queryByParentId(destId);
        return toast.size() > 1 ?  toast.get(1) : null;
    }

    public Destination selectByPrimaryKey(Long destId) {
        return destinationMapper.selectByPrimaryKey(destId);
    }

    public List<Destination> queryByRegionIdTop12(long regionId) {
        return destinationMapper.selectByRegionIdTop12(regionId);
    }

    public Destination selectByName(String destName) {
        return destinationMapper.selectByName(destName);
    }

    public List<Destination> selectByParentId(Long id) {
        return destinationMapper.selectByParentId(id);
    }

    @Override
    public Destination queryById(Long id) {
        return destinationMapper.selectByPrimaryKey(id);
    }

    @Override
    public List<NewDestination> queryByMonthId(Long mid) {
        return destinationMapper.selectByMonthId(mid);
    }


    @Override
    public Destination get(Long destId) {
        return destinationMapper.selectByPrimaryKey(destId);
    }
}
