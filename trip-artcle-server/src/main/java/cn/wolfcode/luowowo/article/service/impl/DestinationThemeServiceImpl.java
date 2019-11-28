package cn.wolfcode.luowowo.article.service.impl;

import cn.wolfcode.luowowo.article.domain.DestinationTheme;
import cn.wolfcode.luowowo.article.mapper.DestinationThemeMapper;
import cn.wolfcode.luowowo.article.service.IDestinationThemeService;
import org.apache.dubbo.config.annotation.Service;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

@Service
public class DestinationThemeServiceImpl implements IDestinationThemeService {
    @Autowired
    private DestinationThemeMapper destinationThemeMapper;

    @Override
    public List<DestinationTheme> listAll() {
        return destinationThemeMapper.selectAll();
    }

    @Override
    public DestinationTheme get(Long themeId) {
        return destinationThemeMapper.selectByPrimaryKey(themeId);}

    @Override
    public List<DestinationTheme> queryExcludeHoliday(Long themeType){
        return destinationThemeMapper.selectExcludeTheme(themeType);
    }

}
