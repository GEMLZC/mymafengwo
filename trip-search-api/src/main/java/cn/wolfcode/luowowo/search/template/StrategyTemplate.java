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

@Document(indexName=StrategyTemplate.INDEX_TYPE_NAME, type=StrategyTemplate.INDEX_TYPE_NAME)
@Getter@Setter
public class StrategyTemplate implements Serializable {
    public static final String INDEX_TYPE_NAME = "luowowo_strategy";

    @Id
    private Long id;

    @Field(analyzer="ik_max_word", searchAnalyzer="ik_max_word", type = FieldType.Text)
    private String title;

    @Field(analyzer="ik_max_word", searchAnalyzer="ik_max_word", type = FieldType.Text)
    private String subTitle;

    private Long destId;

    @Field(type = FieldType.Keyword)
    private String destName;

    private Long countryId;

    @Field(type = FieldType.Keyword)
    private String countryName;

    private Long provinceId;

    @Field(type = FieldType.Keyword)
    private String provinceName;

    private Long themeId;

    @Field(type = FieldType.Keyword)
    private String themeName;

    @Field(analyzer="ik_max_word", searchAnalyzer="ik_max_word", type = FieldType.Text)
    private String summary;

    @Field(type = FieldType.Keyword)
    private String coverUrl;

    @Field(pattern = "yyyy-MM-dd HH:mm:ss||yyyy-MM-dd||epoch_millis", type=FieldType.Date, format = DateFormat.custom)
    private Date createTime;

    private int viewnum;

    private int replynum;

    private int favornum;

    private int thumbsupnum;

}