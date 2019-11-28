package cn.wolfcode.luowowo.comment.domain;

import cn.wolfcode.luowowo.member.domain.UserInfo;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class CommuntiyReply extends UserInfo{
    private String context;//回复内容
}
