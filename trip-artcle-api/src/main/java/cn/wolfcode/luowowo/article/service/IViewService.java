package cn.wolfcode.luowowo.article.service;

import cn.wolfcode.luowowo.article.domain.View;
import cn.wolfcode.luowowo.common.query.QueryObject;
import com.github.pagehelper.PageInfo;

import java.util.List;

/**
 * Created by Xhek on 2019/11/23.
 */
public interface IViewService {



    /**
     * 分页查询景点
     * @param qo
     * @return
     */
    PageInfo query(QueryObject qo);

    /**
     * 通过destId 和type获取需要景点列表
     * @param destId
     * @param type
     * @return
     */
    List<View> queryByDestAndType(Long destId,int type);

    /**
     * 通过景点id获取风景
     * @param viewId
     * @return
     */
    View get(Long viewId);

    /**
     * 通过景点id查询子景点
     * @param qo
     * @return
     */
    PageInfo getByParentId(QueryObject qo);
}
