package cn.wolfcode.luowowo.article.service;

import cn.wolfcode.luowowo.article.domain.Travel;
import cn.wolfcode.luowowo.article.domain.TravelContent;
import cn.wolfcode.luowowo.common.query.QueryObject;
import cn.wolfcode.luowowo.common.query.TravelQuery;
import cn.wolfcode.luowowo.common.util.AjaxResult;
import com.github.pagehelper.PageInfo;

import java.util.List;

/**
 * 游记管理接口
 */
public interface ITravelService {
    /**
     * 分页查询
     * @return
     */
    PageInfo<Travel> query(TravelQuery qo);

    /**
     * 保存信息
     * @param travel
     */
    AjaxResult saveOrUpdate(Travel travel);

    /**
     * 不分页查询
     * @return
     */
    List<Travel> list();

    /**
     * 更新状态
     * @param id
     * @param state
     */
    void updateState(Long id, Long state);

    /**
     * 通过id查询
     * @param id
     * @return
     */
    Travel queryById(Long id);

    /**
     * 通过地区id查询
     * @param qo
     * @return
     */
    List<Travel> queryDestId(TravelQuery qo);

    /**
     * 根据用户id查询其所写的游记
     * @param userId
     * @return
     */
    List<Travel> getByUserId(Long userId);

    /**
     * 游记点赞
     * @param travelId
     */
    void top(Long travelId);

    /**
     * 查询用户的游记总数
     * @param id
     * @return
     */
    int getTravelNum(Long id);

    /**
     * 查询用户游记的总回复数
     * @param id
     * @return
     */
    int getTravelReplyNum(Long id);

    /**
     * 查询用户游记额总浏览数
     * @param id
     * @return
     */
    int getTravelViewNum(Long id);
    /**
     * 修改分享数
     * @param travelId
     * @param i
     */
    void addShareNum(Long travelId, int i);

    /**
     * 获取分享数
     * @param travelId
     * @return
     */
    int getShareNum(Long travelId);
}
