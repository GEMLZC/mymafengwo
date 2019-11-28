package cn.wolfcode.luowowo.search.template;

import lombok.Getter;
import lombok.Setter;
import org.springframework.data.annotation.Id;
import org.springframework.data.elasticsearch.annotations.Document;
import org.springframework.data.elasticsearch.annotations.Field;
import org.springframework.data.elasticsearch.annotations.FieldType;

import java.io.Serializable;

@Document(indexName=UserInfoTemplate.INDEX_TYPE_NAME,type=UserInfoTemplate.INDEX_TYPE_NAME)
@Getter@Setter
public class UserInfoTemplate implements Serializable {
    public static final String INDEX_TYPE_NAME = "luowowo_userinfo";

    @Id
    //@Field 每个文档的字段配置（类型、是否分词、是否存储、分词器 ）
    private Long id;  //攻略id

    @Field(index=true,analyzer="ik_max_word",store=true,searchAnalyzer="ik_max_word",type = FieldType.Text)
    private String nickname;

    @Field(index=true,store=true,type = FieldType.Keyword)
    private String destName;

    @Field(index=true,analyzer="ik_max_word",store=true,searchAnalyzer="ik_max_word",type = FieldType.Text)
    private String info;

    private int travelnum;
    private int replynum;
    private int fansnum;
    private int level;

    @Field(index=true,store=true,type = FieldType.Keyword)
    private String headUrl;
}
