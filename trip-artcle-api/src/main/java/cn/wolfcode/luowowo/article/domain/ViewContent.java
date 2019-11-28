package cn.wolfcode.luowowo.article.domain;

import cn.wolfcode.luowowo.common.domain.BaseDomain;
import lombok.*;

/**
 * Created by Xhek on 2019/11/24.
 */
@Setter
@Getter
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class ViewContent extends BaseDomain {
    private String content;
}
