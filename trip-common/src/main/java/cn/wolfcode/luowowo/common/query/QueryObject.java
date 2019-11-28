package cn.wolfcode.luowowo.common.query;

import lombok.Getter;
import lombok.Setter;
import org.springframework.util.StringUtils;

import java.io.Serializable;

@Setter@Getter
public class QueryObject implements Serializable {
    private int currentPage = 1;
    private int pageSize = 2;

    private String keyword;

    private String orderBy;

    protected String empty2Null(String s) {
        return StringUtils.hasLength(s) ? s : null;
    }

    public String getKeyword() {
        return empty2Null(keyword);
    }

}
