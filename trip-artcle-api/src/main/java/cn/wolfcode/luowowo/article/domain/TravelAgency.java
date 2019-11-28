package cn.wolfcode.luowowo.article.domain;

import cn.wolfcode.luowowo.common.domain.BaseDomain;
import lombok.*;

@Getter
@Setter
@ToString
@AllArgsConstructor
@NoArgsConstructor
public class TravelAgency extends BaseDomain {
    private Long id;

    private String nickname;

    private String headimgUrl;

    private String site;

}