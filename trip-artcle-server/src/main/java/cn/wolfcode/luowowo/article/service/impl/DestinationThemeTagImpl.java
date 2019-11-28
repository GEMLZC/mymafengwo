package cn.wolfcode.luowowo.article.service.impl;

import cn.wolfcode.luowowo.article.domain.DestinationThemeTag;
import cn.wolfcode.luowowo.article.mapper.DestinationThemeTagMapper;
import cn.wolfcode.luowowo.article.service.IDestinationThemeTagService;
import org.apache.dubbo.config.annotation.Service;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

@Service
public class DestinationThemeTagImpl implements IDestinationThemeTagService {
    @Autowired
    private DestinationThemeTagMapper destinationThemeTagMapper;


    @Override
    public List<DestinationThemeTag> queryByThemeId(Long themeId) {
        return destinationThemeTagMapper.selectByThemeId(themeId);
    }
}
