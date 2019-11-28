package cn.wolfcode.luowowo.article.domain;

import lombok.*;

import java.io.Serializable;

@Getter
@Setter
@ToString
@AllArgsConstructor
@NoArgsConstructor
public class StrategyCollect implements Serializable{
    private Long userid;

    private Long strategyid;


}