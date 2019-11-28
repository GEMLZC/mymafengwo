package cn.wolfcode.luowowo.article.service;

import cn.wolfcode.luowowo.article.domain.DestinationThemeTag;

import java.util.List;

public interface IDestinationThemeTagService {
    /**
     * 查询相应主题id下的标签
     * @return
     */
    List<DestinationThemeTag> queryByThemeId(Long id);
}
