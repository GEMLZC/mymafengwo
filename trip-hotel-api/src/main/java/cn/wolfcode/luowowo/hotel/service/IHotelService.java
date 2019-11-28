package cn.wolfcode.luowowo.hotel.service;

import cn.wolfcode.luowowo.common.query.HotelQueryObject;
import cn.wolfcode.luowowo.hotel.domain.*;
import com.github.pagehelper.PageInfo;

import java.util.List;

public interface IHotelService {
    /**
     * 获取所有的主题
     * @return
     */
    List<DestinationTheme> listHotelTheme();

    /**
     * 根据主题id获取目的地
     * @param id    主题id
     * @return
     */
    DestinationTheme selectByThemeId(Long id);

    /**
     * 根据目的地id获取酒店
     * @param id
     * @return
     */
    List<Hotel> selectHotelByDestId(Long id);

    /**
     * 根据目的地id获取所有的区域
     * @param destId
     * @return
     */
    List<DestinationArea> selectAreaByDestId(Long destId);

    /**
     * 根据目的地id获取所有的酒店标签
     * @param destId
     * @return
     */
    List<HotelTag> selectTagsByDestId(Long destId);

    DestinationArea selectAreaByAreaId(Long id);

    /**
     * 获取某个目的地下的所有酒店的品牌
     * @param destId
     * @return
     */
    List<String> selectAllBrand(Long destId);

    /**
     * 获取所有设施
     * @return
     */
    List<HotelFacilities> selectAllFacilities();

    /**
     * 高级查询
     * @param qo
     * @return
     */
    PageInfo queryForList(HotelQueryObject qo);
}
