package cn.wolfcode.luowowo.article.service;

import cn.wolfcode.luowowo.article.domain.TravelCommend;
import cn.wolfcode.luowowo.common.query.QueryObject;
import com.github.pagehelper.PageInfo;

import java.util.List;

public interface ITravelCommendService {
    /**
     * 保存信息
     * @param travelCommend
     */
    void save(TravelCommend travelCommend);

    /**
     * 分页查询
     * @param qo
     * @return
     */
    PageInfo<TravelCommend> query(QueryObject qo);

    /**
     * 查询前五的游记推荐
     * @return
     */
    List<TravelCommend> listTop5();
}
