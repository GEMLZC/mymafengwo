package cn.wolfcode.luowowo.search.query;

import cn.wolfcode.luowowo.common.query.QueryObject;

import lombok.Getter;
import lombok.Setter;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;

@Getter
@Setter
public class SearchQueryObject extends QueryObject {
    public static final int CONDITION_UNABROAD = 1;
    public static final int CONDITION_ABROAD = 2;
    public static final int CONDITION_THEME = 3;

    public static final int SEARCH_ALL = -1;
    public static final int SEARCH_DEST = 0;
    public static final int SEARCH_STRATEGY = 1;
    public static final int SEARCH_TRAVEL = 2;
    public static final int SEARCH_USER = 3;

    private Integer type = -1;

    private Integer searchType = SEARCH_ALL;

    private Long typeValue = -1L;

    public SearchQueryObject() {
        setOrderBy("viewnum");
    }

    public Pageable getPageable() {
        return PageRequest.of(getCurrentPage() - 1, getPageSize(), Sort.Direction.DESC, getOrderBy());
    }

    public Pageable getPageableWithouSort() {
        return PageRequest.of(getCurrentPage() - 1, getPageSize());
    }
}
