package cn.wolfcode.luowowo.hotel.service.impl;

import cn.wolfcode.luowowo.common.query.HotelQueryObject;
import cn.wolfcode.luowowo.hotel.domain.*;
import cn.wolfcode.luowowo.hotel.mapper.*;
import cn.wolfcode.luowowo.hotel.service.IHotelService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.apache.dubbo.config.annotation.Service;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

@Service
public class HotelServiceImpl implements IHotelService{
    @Autowired
    private DestinationThemeMapper destinationThemeMapper;
    @Autowired
    private HotelMapper hotelMapper;
    @Autowired
    private DestinationAreaMapper destinationAreaMapper;
    @Autowired
    private HotelTagMapper hotelTagMapper;
    @Autowired
    private HotelFacilitiesMapper hotelFacilitiesMapper;
    public List<DestinationTheme> listHotelTheme() {
        return destinationThemeMapper.selectAll();
    }

    public DestinationTheme selectByThemeId(Long id) {
        DestinationTheme theme = destinationThemeMapper.selectByPrimaryKey(id);
        return theme;
    }

    public List<Hotel> selectHotelByDestId(Long id) {
        return hotelMapper.selectByDestId(id);
    }

    public List<DestinationArea> selectAreaByDestId(Long destId) {
        return destinationAreaMapper.selectAreaByDestId(destId);
    }

    public List<HotelTag> selectTagsByDestId(Long destId) {
        return hotelTagMapper.selectTagsByDestId(destId);
    }

    public DestinationArea selectAreaByAreaId(Long id) {
        return destinationAreaMapper.selectByPrimaryKey(id);
    }

    public List<String> selectAllBrand(Long destId) {
        return hotelMapper.selectAllBrand(destId);
    }

    public List<HotelFacilities> selectAllFacilities() {
        return hotelFacilitiesMapper.selectAll();
    }

    public PageInfo queryForList(HotelQueryObject qo) {
        PageHelper.startPage(qo.getCurrentPage(),qo.getPageSize());
        return new PageInfo(hotelMapper.queryForList(qo));
    }
}
