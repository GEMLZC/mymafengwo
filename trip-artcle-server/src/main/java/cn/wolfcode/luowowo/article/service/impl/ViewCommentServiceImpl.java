package cn.wolfcode.luowowo.article.service.impl;

import cn.wolfcode.luowowo.article.domain.View;
import cn.wolfcode.luowowo.article.domain.ViewComment;
import cn.wolfcode.luowowo.article.mapper.ViewCommentMapper;
import cn.wolfcode.luowowo.article.mapper.ViewMapper;
import cn.wolfcode.luowowo.article.service.IViewCommentService;
import cn.wolfcode.luowowo.comment.domain.ViewCommentBack;
import cn.wolfcode.luowowo.common.query.QueryObject;
import cn.wolfcode.luowowo.common.util.AjaxResult;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import lombok.AllArgsConstructor;
import org.apache.dubbo.config.annotation.Service;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.Date;
import java.util.List;

/**
 * Created by Xhek on 2019/11/24.
 */
@Service
public class ViewCommentServiceImpl implements IViewCommentService {
    @Autowired
    private ViewCommentMapper commentMapper;
    @Autowired
    private ViewMapper viewMapper;

    @Override
    public PageInfo query(QueryObject qo) {
        PageHelper.startPage(qo.getCurrentPage(),qo.getPageSize());
        List<ViewComment> list = commentMapper.queryForList(qo);
        return new PageInfo(list);
    }

    @Override
    public AjaxResult save(ViewComment comment) {
        AjaxResult result = new AjaxResult();
        try {

            Long viewId = comment.getView().getId();
            View view = viewMapper.selectByPrimaryKey(viewId);
            comment.setView(view);
            comment.setCreateTime(new Date());
            if (comment.getStarNum()==null){
                comment.setStarNum(0);
            }
            if (comment.getSceneNum()==null){
                comment.setSceneNum(0);
            }
            if (comment.getSpecialNum()==null){
                comment.setSpecialNum(0);
            }
            if (comment.getServiceNum()==null){
                comment.setServiceNum(0);
            }

            comment.setType(comment.getStarNum(),comment.getSceneNum(),comment.getSpecialNum(),comment.getServiceNum());

            if (comment.getImg()!=null){
                comment.setHasImg(true);
            }else {
                comment.setHasImg(false);
            }

            comment.setThumbsupnum(0);
            commentMapper.insert(comment);
        }catch (Exception e){
            e.printStackTrace();
            result.mark(e.getMessage());
        }

        return result;
    }

    @Override
    public ViewComment get(Long commentId) {
       return commentMapper.selectByPrimaryKey(commentId);
    }

    @Override
    public void update(ViewComment viewComment) {
        commentMapper.updateByPrimaryKey(viewComment);
    }

    @Override
    public List<ViewComment> getByUserId(Long uid) {

        return commentMapper.selectByUserId(uid);
    }


}
