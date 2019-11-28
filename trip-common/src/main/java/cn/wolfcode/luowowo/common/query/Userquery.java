package cn.wolfcode.luowowo.common.query;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class Userquery extends QueryObject{
     /*当前用户id*/
     Long userinfoId=-1L;
     /*访问者id*/
     Long userId=1L;
}
