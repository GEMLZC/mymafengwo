package cn.wolfcode.luowowo.article.service;

import cn.wolfcode.luowowo.article.domain.NewDestination;
import cn.wolfcode.luowowo.common.query.NewDestinationQuery;
import com.github.pagehelper.PageInfo;

import java.util.List;

public interface INewDestinationService {
    /**
     * 分页查询
     * @return
     */
    PageInfo<NewDestination> query(NewDestinationQuery qo);
}
