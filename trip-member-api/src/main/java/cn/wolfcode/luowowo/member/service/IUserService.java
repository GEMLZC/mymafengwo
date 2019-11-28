package cn.wolfcode.luowowo.member.service;

import cn.wolfcode.luowowo.common.query.Userquery;
import cn.wolfcode.luowowo.common.util.AjaxResult;
import cn.wolfcode.luowowo.member.domain.User;
import com.github.pagehelper.PageInfo;

import java.util.List;

public interface IUserService {
    /**
     * 查询全部
     * @return
     */
    List<User> query();

    /**
     * 查询用户
     * @param id
     * @return
     */
    User get(Long id);

    /**
     * 获取用户所关注的人
     * @param id
     * @return
     */
    List<User> listFollow(Long id);

    /**
     * 更新用户的总访问数
     * @param user
     */
    void updateViewNum(User user);

    void update(User user);

    void savePhone(Long id, String phone);

    PageInfo<User> queryList(Userquery qo);

    List<User> getUserByIdNotIn(List<Long> black,Long userId);

    AjaxResult setFolws(Long userId, Long id);
}
