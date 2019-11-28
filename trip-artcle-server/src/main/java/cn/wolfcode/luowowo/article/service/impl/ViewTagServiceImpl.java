package cn.wolfcode.luowowo.article.service.impl;

import cn.wolfcode.luowowo.article.domain.ViewTag;
import cn.wolfcode.luowowo.article.mapper.ViewTagMapper;
import cn.wolfcode.luowowo.article.service.IViewService;
import cn.wolfcode.luowowo.article.service.IViewTagService;
import lombok.AllArgsConstructor;
import org.apache.dubbo.config.annotation.Service;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

/**
 * Created by Xhek on 2019/11/23.
 */
@Service
public class ViewTagServiceImpl implements IViewTagService {
    @Autowired
    private ViewTagMapper viewTagMapper;


    @Override
    public List<ViewTag> listAllViewTagsByDestId(Long destId) {
        return viewTagMapper.selectByDestId(destId);
    }
}
