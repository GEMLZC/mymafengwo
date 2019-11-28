package cn.wolfcode.luowowo.comment.domain;

import cn.wolfcode.luowowo.member.domain.UserInfo;

import lombok.Getter;
import lombok.Setter;
import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * 问答实体
 */
@Setter
@Getter
@Document("community_question")
public class CommunityQuestion implements Serializable {
    @Id
    private String id;

    private String title;//标题
    private String tag;//标签
    private Long destId;//目的地id
    private String destName;//目的地名称
    private Integer viewnum = 0;//浏览数
    private Integer thumpsupnum = 0;//被顶数
    private Date creatTime;//创建时间
    private String context;//问题内容
    private Long userId;//用户id
    private String userName;//用户名称
    private String headImgUrl;//用户头像
    List<ImgAndTxt> imgAndTxts = new ArrayList<>();//回复图片集合
    List<CommuntiyReply> users = new ArrayList<>();//回复内容集合


}
