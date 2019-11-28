package cn.wolfcode.luowowo.article.service;

import cn.wolfcode.luowowo.article.domain.DestinationTheme;

import java.util.List;

/**
 * 目的地主题
 */
public interface IDestinationThemeService {
    /**
     * 查询所有主题
     * @return
     */
    List<DestinationTheme> listAll();

    /**
     * 通过id查询主题
     * @param themeId
     * @return
     */
    DestinationTheme get(Long themeId);
    /**
     * 查询除节假日的主题下的标签
     * @return
     */
    List<DestinationTheme> queryExcludeHoliday(Long themeType);

}
