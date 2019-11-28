package cn.wolfcode.luowowo.article.service.impl;

import cn.wolfcode.luowowo.article.domain.Destination;
import cn.wolfcode.luowowo.article.domain.Travel;
import cn.wolfcode.luowowo.article.domain.TravelContent;
import cn.wolfcode.luowowo.article.mapper.TravelContentMapper;
import cn.wolfcode.luowowo.article.mapper.TravelMapper;
import cn.wolfcode.luowowo.article.service.IDestinationService;
import cn.wolfcode.luowowo.article.service.ITravelService;
import cn.wolfcode.luowowo.cache.service.ITravelStatsCacheService;
import cn.wolfcode.luowowo.comment.domain.TravelComment;
import cn.wolfcode.luowowo.comment.service.ITravelCommentService;
import cn.wolfcode.luowowo.common.query.QueryObject;
import cn.wolfcode.luowowo.common.query.TravelQuery;
import cn.wolfcode.luowowo.common.util.AjaxResult;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.apache.dubbo.config.annotation.Reference;
import org.apache.dubbo.config.annotation.Service;
import org.springframework.beans.factory.annotation.Autowired;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Service
public class TravelServiceImpl implements ITravelService {
    @Autowired
    private TravelMapper travelMapper;
    @Autowired
    private TravelContentMapper travelContentMapper;

    @Autowired
    private IDestinationService destinationService;
    @Reference
    private ITravelCommentService travelCommentService;


    @Override
    public PageInfo<Travel> query(TravelQuery qo) {
        PageHelper.startPage(qo.getCurrentPage(),qo.getPageSize(),qo.getOrderBy());
        List<Travel> list = travelMapper.selectForList(qo);
        for (Travel travel : list) {
            Destination dest = travel.getDest();
            Long did = dest.getId();
            Destination country = destinationService.getCountry(did);
            dest.setParent(country);
            travel.setDest(dest);
        }

        return new PageInfo<>(list);
    }

    @Override
    public AjaxResult saveOrUpdate(Travel travel) {
        AjaxResult result = new AjaxResult();
        //默认字段的设置
        Date date = new Date();
        travel.setSummary("AI生成");
        travel.setCreateTime(date);
        travel.setReleaseTime(date);//默认待发布
        travel.setLastUpdateTime(date);
        if (travel.getId() == null){
            travelMapper.insert(travel);
            TravelContent content = travel.getTravelContent();
            content.setId(travel.getId());
            travelContentMapper.insert(content);
        }else {
            travelMapper.updateByPrimaryKey(travel);
            TravelContent content = travel.getTravelContent();
            content.setId(travel.getId());
            travelContentMapper.updateByPrimaryKey(content);
        }
        result.addData(travel.getId());
        return result;
    }

    @Override
    public List<Travel> list() {
        return travelMapper.selectAll();
    }

    @Override
    public void updateState(Long id, Long state) {
        travelMapper.updateState(id,state);
    }

    @Override
    public Travel queryById(Long id) {

        return travelMapper.selectByPrimaryKey(id);
    }

    @Override
    public List<Travel> queryDestId(TravelQuery qo) {
        return travelMapper.selectByDestId(qo);
    }

    @Override
    public List<Travel> getByUserId(Long userId) {

        List<Travel> travels = travelMapper.selectByUserId(userId);
        //添加国家
        for (Travel travel : travels) {
            Destination dest = travel.getDest();
            Destination country = destinationService.getCountry(dest.getId());
            if(!dest.equals(country)) {
                dest.setParent(country);
            }

        }


        return travels;

    }

    @Override
    public void top(Long travelId) {
        travelMapper.addthumbsupnum(travelId);
    }



    @Override
    public int getTravelNum(Long id) {
        List<Travel> travelList = travelMapper.selectByUserId(id);
        int size = travelList.size();
        return size;
    }

    @Override
    public int getTravelReplyNum(Long id) {
        List<Travel> travelList = travelMapper.selectByUserId(id);
        int count=0;
        for (Travel travel : travelList) {
            Integer replynum = travel.getReplynum();
            count=count+replynum;
        }
        return count;
    }

    @Override
    public int getTravelViewNum(Long id) {
        List<Travel> travelList = travelMapper.selectByUserId(id);
        int count=0;
        for (Travel travel : travelList) {
            Integer viewnum = travel.getViewnum();
            count=count+viewnum;
        }

        return count;
    }

    @Override
    public void addShareNum(Long travelId, int num) {
        travelMapper.updateShareNum(travelId,num);
    }

    @Override
    public int getShareNum(Long travelId) {
        return travelMapper.selectShareNumById(travelId);
    }
}
