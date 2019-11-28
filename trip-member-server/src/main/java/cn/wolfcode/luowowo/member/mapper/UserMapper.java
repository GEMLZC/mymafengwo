package cn.wolfcode.luowowo.member.mapper;

import cn.wolfcode.luowowo.common.query.Userquery;
import cn.wolfcode.luowowo.member.domain.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface UserMapper {

    List<User> selectAll();

    User get(Long id);

    List<User> listFollow(Long id);

    /**
     * 设置用户总访问数
     * @param user
     */
    void setViewNum(User user);

    void update(User user);

    void savePhone(@Param("id") Long id, @Param("phone") String phone);


    List<User> selectForList(Userquery qo);

    List<User> getUserByIdNotIn(List<Long> black);

    void setFolws( @Param("userId") Long userId,@Param("id") Long id);

    List<Long> listById(Long userId);
}
