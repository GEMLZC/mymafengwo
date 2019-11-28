package cn.wolfcode.luowowo.article.domain;

import lombok.*;

import java.io.Serializable;

@Getter
@Setter
@ToString
@AllArgsConstructor
@NoArgsConstructor
public class TravelCollect implements Serializable{
    private Long userid;

    private Long travelid;


}