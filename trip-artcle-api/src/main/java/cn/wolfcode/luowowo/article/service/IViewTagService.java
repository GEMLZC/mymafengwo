package cn.wolfcode.luowowo.article.service;

import cn.wolfcode.luowowo.article.domain.ViewTag;

import java.util.List;

/**
 * Created by Xhek on 2019/11/23.
 */
public interface IViewTagService {

    List<ViewTag> listAllViewTagsByDestId(Long destId);
}
