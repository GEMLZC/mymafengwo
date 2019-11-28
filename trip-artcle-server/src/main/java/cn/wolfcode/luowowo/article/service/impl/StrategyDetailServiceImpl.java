package cn.wolfcode.luowowo.article.service.impl;

import cn.wolfcode.luowowo.article.domain.*;
import cn.wolfcode.luowowo.article.mapper.StrategyCatalogMapper;
import cn.wolfcode.luowowo.article.mapper.StrategyContentMapper;
import cn.wolfcode.luowowo.article.mapper.StrategyDetailMapper;
import cn.wolfcode.luowowo.article.mapper.StrategyTagMapper;
import cn.wolfcode.luowowo.article.service.IStrategyDetailService;
import cn.wolfcode.luowowo.common.query.QueryObject;
import cn.wolfcode.luowowo.common.query.StrategyDetailQuery;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.apache.dubbo.config.annotation.Service;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.Date;
import java.util.List;

@Service
public class StrategyDetailServiceImpl implements IStrategyDetailService {
    @Autowired
    private StrategyDetailMapper strategyDetailMapper;
    @Autowired
    private StrategyCatalogMapper strategyCatalogMapper;
    @Autowired
    private StrategyContentMapper strategyContentMapper;
    @Autowired
    private StrategyTagMapper strategyTagMapper;

    @Override
    public PageInfo<StrategyDetail> query(StrategyDetailQuery qo) {
        PageHelper.startPage(qo.getCurrentPage(),qo.getPageSize());
        List<StrategyDetail> list = strategyDetailMapper.selectForList(qo);
        return new PageInfo<>(list);
    }

    @Override
    public List<StrategyDetail> query() {
        return strategyDetailMapper.selectAll();
    }

    @Override
    public void saveOrUpdate(StrategyDetail strategyDetail) {
        if (strategyDetail.getId() == null){
            strategyDetailMapper.insert(strategyDetail);
        }else {
            strategyDetailMapper.updateByPrimaryKey(strategyDetail);
        }
    }

    @Override
    public StrategyDetail queryById(Long id) {
        return strategyDetailMapper.selectByPrimaryKey(id);
    }

    @Override
    public void saveOrUpdate(StrategyDetail strategyDetail, String tags) {
        //设置默认字段
        //地区的默认字段需要去查询分类外键字段下的地区
        StrategyCatalog strategyCatalog = strategyCatalogMapper.selectByPrimaryKey(strategyDetail.getCatalog().getId());
        Destination destination = new Destination();
        destination.setId(strategyCatalog.getDestId());
        strategyDetail.setSummary("AI算法生成");
        strategyDetail.setDest(destination);

        if (strategyDetail.getId() == null){
            strategyDetail.setCreateTime(new Date());
            strategyDetailMapper.insert(strategyDetail);
            //主键不能自增，所以要获取strategyDetail对象的id作为主键
            StrategyContent strategyContent = strategyDetail.getStrategyContent();
            strategyContent.setId(strategyDetail.getId());
            strategyContentMapper.insert(strategyContent);

        }else {
            //同理
            strategyDetailMapper.updateByPrimaryKey(strategyDetail);
            StrategyContent strategyContent = strategyDetail.getStrategyContent();
            strategyContent.setId(strategyDetail.getId());
            strategyContentMapper.updateByPrimaryKey(strategyContent);
        }

        //标签新增和维护文章明细与标签的关系
        if (tags != null && tags.length() != 0 && !"".equals(tags)){
            //删除中间表关系，不管是新增还是编辑，然后再添加
            strategyDetailMapper.deleteDetailTagByPrimaryKey(strategyDetail.getId());
            if (tags.contains(",")){
                String[] tag = tags.split(",");

                for (String s : tag) {
                    StrategyTag strategyTag = strategyTagMapper.selectByName(s);
                    if (strategyTag == null){
                        //标签新增
                        strategyTag = new StrategyTag();
                        strategyTag.setName(s);
                        strategyTagMapper.insert(strategyTag);

                    }
                    //维护中间表
                    strategyDetailMapper.insertDetailTag(strategyDetail.getId(),strategyTag.getId());
                }
            }else {
                StrategyTag strategyTag = strategyTagMapper.selectByName(tags);
                if (strategyTag == null){
                    //标签新增
                    strategyTag = new StrategyTag();
                    strategyTag.setName(tags);
                    strategyTagMapper.insert(strategyTag);
                }
                //维护中间表
                strategyDetailMapper.insertDetailTag(strategyDetail.getId(),strategyTag.getId());
            }
        }

    }

    @Override
    public List<StrategyDetail> queryByCatalogId(Long catalogId) {
        return strategyDetailMapper.selectByCatalogId(catalogId);
    }

    @Override
    public List<StrategyDetail> queryByDestId(Long destId) {
        return strategyDetailMapper.selectByDestId(destId);
    }

    @Override
    public void updateStats(StrategyDetail strategyDetail) {
        strategyDetailMapper.updateStats(strategyDetail);
    }


}
