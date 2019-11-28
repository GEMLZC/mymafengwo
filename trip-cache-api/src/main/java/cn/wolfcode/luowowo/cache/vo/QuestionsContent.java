package cn.wolfcode.luowowo.cache.vo;

import lombok.Getter;
import lombok.Setter;

import java.io.Serializable;

/**
 * 回答的问题
 */
@Getter
@Setter
public class QuestionsContent implements Serializable {
    private String questionId;
    private String title;//问题标题
}
