package cn.wolfcode.luowowo.article.service;

import cn.wolfcode.luowowo.article.domain.Destination;
import cn.wolfcode.luowowo.article.domain.Region;
import cn.wolfcode.luowowo.common.query.QueryObject;
import com.github.pagehelper.PageInfo;

import java.util.List;

public interface IRegionService {
    /**
     * 分页查询
     * @param qo
     * @return
     */
    PageInfo<Region> query(QueryObject qo);

    /**
     * 查询热门地区
     * @return
     */
    List<Region> queryHostRegion();

    /**
     * 保存信息
     * @param destr
     */
    void save(Region destr);

    /**
     * 通过id查询热门区域
     * @param drid
     * @return
     */
    Region queryById(Long drid);

    /**
     * 更新状态
     * @param id
     * @param status
     */
    void updateStatus(Long id, Long status);

    /**
     * 查询热门区域
     * @param id
     * @return
     */
    Region queryDestReById(Long id);

    List<Region> queryAllIshot(Integer ishot);

    void saveOrUpdate(Region region);
}
