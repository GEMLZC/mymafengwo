package cn.wolfcode.luowowo.search.template;

import lombok.Getter;
import lombok.Setter;
import org.springframework.data.annotation.Id;
import org.springframework.data.elasticsearch.annotations.DateFormat;
import org.springframework.data.elasticsearch.annotations.Document;
import org.springframework.data.elasticsearch.annotations.Field;
import org.springframework.data.elasticsearch.annotations.FieldType;

import java.util.Date;

/**
 * Created by Xhek on 2019/11/26.
 */
@Document(indexName = ViewCommentTemplate.INDEX_TYPE_NAME,type = ViewCommentTemplate.INDEX_TYPE_NAME)
@Getter
@Setter
public class ViewCommentTemplate {
    public static final String INDEX_TYPE_NAME = "luowowo_view";

    @Id
    private Long id;//点评id

    private Long viewId;//景点id

    @Field(index=true,analyzer="ik_max_word",store=true,searchAnalyzer="ik_max_word",type = FieldType.Text)
    private String content;//内容

    private Integer conditionId;//条件查询

}
