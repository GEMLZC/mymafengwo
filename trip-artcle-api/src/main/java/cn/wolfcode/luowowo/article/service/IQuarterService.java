package cn.wolfcode.luowowo.article.service;

import cn.wolfcode.luowowo.article.domain.Quarter;

import java.util.List;
/**
 * 月份接口
 */
public interface IQuarterService {
    /**
     * 查询全部月份
     * @return
     */
    List<Quarter> query();


    /**
     * 所有月份集合
     * @return
     */
    List<Quarter> listAll();

    Quarter get(Long mid);

}
