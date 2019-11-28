package cn.wolfcode.luowowo.article.domain;

import cn.wolfcode.luowowo.common.domain.BaseDomain;
import lombok.*;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * Created by Xhek on 2019/11/23.
 */
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class ViewTag extends BaseDomain {

    private String name;//tag名字

}
