package cn.wolfcode.luowowo.article.service;

import cn.wolfcode.luowowo.article.domain.Destination;
import cn.wolfcode.luowowo.article.domain.NewDestination;
import cn.wolfcode.luowowo.common.query.DestinationQuery;
import com.github.pagehelper.PageInfo;

import java.util.List;


public interface IDestinationService {
    /**
     * 分页查询
     * @param qo
     * @return
     */
    PageInfo<Destination> query(DestinationQuery qo);

    /**
     * 查询全部
     * @return
     */
    List<Destination> query();


    /**
     * 更新热门转态
     * @param id
     * @param status
     */
    void updateStatus(Long id, Long status);

    /**
     * 查询目录深度小于等于deep的目的地
     * @param deep
     * @return
     */
    List<Destination> getListDestByDeep(Integer deep);

    /**
     * 获取关联地区
     * @param refIds
     * @return
     */
    List<Destination> getListDestByRef(Long[] refIds);

    /**
     * 查询全部地区
     * @return
     */
    List<Destination> queryForList();

    /**
     * 通过ParentId找寻地区，吐司导航
     * @param parentId
     * @return
     */
    List<Destination> queryByParentId(Long parentId);

    /**
     * 修改目的地简介
     * @param destination
     */
    void updateInfo(Destination destination);

    /**
     * 根据热门区域id查询目的地
     * @param regionId
     * @return
     */
    List<Destination> queryByRegionId(Long regionId);

    /**
     * 获取国家
     * @param destId
     * @return
     */
    Destination getCountry(Long destId);

    /**
     * 获取地区
     * @param destId
     * @return
     */
    Destination getProvince(Long destId);

    /**
     * 根据id获取目的地
     * @param destId
     * @return
     */
    Destination selectByPrimaryKey(Long destId);

    /**
     * 根据热门区域id查询目的地,限制12个
     * @param regionId
     * @return
     */
    List<Destination> queryByRegionIdTop12(long regionId);

    /**
     * 通过目的地名称查询目的地
     * @param destName
     * @return
     */
    Destination selectByName(String destName);

    /**
     * 获取同一个父目的点的其他目的地
     * @param id
     * @return
     */
    List<Destination> selectByParentId(Long id);

    /**
     * 通过id查询
     * @param id
     * @return
     */
    Destination queryById(Long id);

    /**
     * 通过月份id查目的地
     * @param mid
     * @return
     */
    List<NewDestination> queryByMonthId(Long mid);


    /**
     * 通过目的地id获取目的地
     * @param destId
     * @return
     */
    Destination get(Long destId);

}
