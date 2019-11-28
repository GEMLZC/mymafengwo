package cn.wolfcode.luowowo.member.service.impl;

import cn.wolfcode.luowowo.common.query.Userquery;
import cn.wolfcode.luowowo.common.util.AjaxResult;
import cn.wolfcode.luowowo.member.domain.User;
import cn.wolfcode.luowowo.member.mapper.UserMapper;
import cn.wolfcode.luowowo.member.service.IUserService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.apache.dubbo.config.annotation.Service;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

@Service
public class UserSericelmpl implements IUserService {
    @Autowired
    private UserMapper userMapper;

    public List<User> query() {
        List<User> users = userMapper.selectAll();
        return users;
    }

    public User get(Long id) {
        User user = userMapper.get(id);
        return user;
    }

    public List<User> listFollow(Long id) {
        List<User> users = userMapper.listFollow(id);
        return users;
    }

    @Override
    public void updateViewNum(User user) {
        userMapper.setViewNum(user);
    }

    public void update(User user) {
        userMapper.update(user);
    }

    public void savePhone(Long id, String phone) {
        userMapper.savePhone(id,phone);
    }

    public PageInfo<User> queryList(Userquery qo) {
        PageHelper.startPage(qo.getCurrentPage(),qo.getPageSize());
        List<User> list = userMapper.selectForList(qo);
        return new PageInfo<>(list);
    }

    public List<User> getUserByIdNotIn(List<Long> black,Long userId) {
        black.add(userId);
        return userMapper.getUserByIdNotIn(black);
    }

    public AjaxResult setFolws(Long userId, Long id) {
        AjaxResult ajaxResult = new AjaxResult();
        try {
            List<Long> list = userMapper.listById(userId);
            if (!list.contains(id)) {
                userMapper.setFolws(userId, id);
            }else {
                ajaxResult.mark("你已经关注过了!");
            }
        }catch (Exception e){
            e.printStackTrace();
            ajaxResult.mark("操作失败");
        }
        return ajaxResult;
    }
}
