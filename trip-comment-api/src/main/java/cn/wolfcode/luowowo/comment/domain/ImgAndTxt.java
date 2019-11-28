package cn.wolfcode.luowowo.comment.domain;

import cn.wolfcode.luowowo.common.domain.BaseDomain;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.io.Serializable;

/**
 * 返回给问题列表的图片和内容
 */
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class ImgAndTxt extends BaseDomain{
    private String imgUrl;//图片url
    private String txt;//内容
}
