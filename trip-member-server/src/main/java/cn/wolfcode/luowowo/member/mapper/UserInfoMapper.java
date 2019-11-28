package cn.wolfcode.luowowo.member.mapper;

import cn.wolfcode.luowowo.member.domain.UserInfo;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface UserInfoMapper {
    void insert(UserInfo entity);

    UserInfo selectUseInforByPhone(String phone);

    UserInfo selectUserInfoByPhoneAndPassword(@Param("phone") String phone, @Param("password") String password);

    List<UserInfo> selectAll();

    UserInfo selectByPrimaryKey(Long userId);
}
