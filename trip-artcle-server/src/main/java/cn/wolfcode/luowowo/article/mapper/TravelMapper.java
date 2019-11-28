package cn.wolfcode.luowowo.article.mapper;

import cn.wolfcode.luowowo.article.domain.Travel;
import cn.wolfcode.luowowo.common.query.TravelQuery;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface TravelMapper {
    int deleteByPrimaryKey(Long id);

    int insert(Travel record);

    Travel selectByPrimaryKey(Long id);

    List<Travel> selectAll();

    List<Travel> selectForList(TravelQuery qo);

    int updateByPrimaryKey(Travel record);

    void updateState(@Param("id") Long id, @Param("state") Long state);

    List<Travel> selectByDestId(TravelQuery qo);

    List<Travel> selectByUserId(Long userId);

    /**
     * 添加点赞数
     * @param travelId
     */
    void addthumbsupnum(Long travelId);

    void updateShareNum(@Param("travelId") Long travelId, @Param("num") int num);

    int selectShareNumById(Long id);

}