package cn.wolfcode.luowowo.search.template;

import lombok.Getter;
import lombok.Setter;
import org.springframework.data.annotation.Id;
import org.springframework.data.elasticsearch.annotations.DateFormat;
import org.springframework.data.elasticsearch.annotations.Document;
import org.springframework.data.elasticsearch.annotations.Field;
import org.springframework.data.elasticsearch.annotations.FieldType;

import java.io.Serializable;
import java.util.Date;

@Document(indexName=TravelTemplate.INDEX_TYPE_NAME, type=TravelTemplate.INDEX_TYPE_NAME)
@Getter@Setter
public class TravelTemplate implements Serializable {
    public static final String INDEX_TYPE_NAME = "luowowo_travel";

    @Id
    private Long id;  //游记id

    @Field(pattern = "yyyy-MM-dd HH:mm:ss||yyyy-MM-dd||epoch_millis", type=FieldType.Date, format = DateFormat.custom)
    private Date createTime;  //创建时间

    private Long destId;  //游记地点

    @Field(index=true,store=true,type = FieldType.Keyword)
    private String destName; //游记地点名称

    @Field(index=true,analyzer="ik_max_word",store=true,searchAnalyzer="ik_max_word",type = FieldType.Text)
    private String title;  //游记标题

    @Field(index=true,analyzer="ik_max_word",store=true,searchAnalyzer="ik_max_word",type = FieldType.Text)
    private String summary; //游记简介

    private Long authorId;  //作者id

    @Field(index=true,analyzer="ik_max_word",store=true,searchAnalyzer="ik_max_word",type = FieldType.Text)
    private String authorName; //作者名

    @Field(index=true,store=true,type = FieldType.Keyword)
    private String coverUrl; //封面

    private int viewnum;  //游记查看数
    private int replynum;  //回复数
}