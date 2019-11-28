package cn.wolfcode.luowowo.website.controller;

import cn.wolfcode.luowowo.article.domain.Destination;
import cn.wolfcode.luowowo.article.domain.Region;
import cn.wolfcode.luowowo.article.service.IDestinationService;
import cn.wolfcode.luowowo.article.service.IRegionService;
import cn.wolfcode.luowowo.cache.service.IHotelStatsCacheService;
import cn.wolfcode.luowowo.common.query.HotelQueryObject;
import cn.wolfcode.luowowo.common.util.AjaxResult;
import cn.wolfcode.luowowo.hotel.domain.*;
import cn.wolfcode.luowowo.hotel.service.IHotelService;
import cn.wolfcode.luowowo.member.domain.UserInfo;
import cn.wolfcode.luowowo.website.annotation.LoginUser;
import cn.wolfcode.luowowo.website.annotation.RequiredLogin;
import com.github.pagehelper.PageInfo;
import org.apache.dubbo.config.annotation.Reference;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.*;

@Controller
@RequestMapping("/hotel")
public class HotelController {
    @Reference
    private IHotelService hotelService;
    @Reference
    private IDestinationService destinationService;
    @Reference
    private IRegionService regionService;
    @Reference
    private IHotelStatsCacheService hotelStatsCacheService;
    @RequestMapping("")
    public String hotel(Model model){
        //dest国内
        List<Destination> list = destinationService.queryByRegionIdTop12(-1L);
        model.addAttribute("dest",list);
        /*//其他区域hotRegions
        model.addAttribute("hotRegions", regionService.queryHostRegion());*/
        //destinationTheme
        model.addAttribute("destinationTheme",hotelService.listHotelTheme());
        //hotCity,为了不改原来的表,所以做假数据,有酒店的那一部分
        Destination destination1 = destinationService.selectByPrimaryKey(3261L);
        Destination destination2 = destinationService.selectByPrimaryKey(249L);
        List<Destination> hotCity=new ArrayList<>();
        hotCity.add(destination1);
        hotCity.add(destination2);
        model.addAttribute("hotCity",hotCity);
        //hotRegions
        List<Map<String,Object>> hotRegions=new ArrayList<>();
        //获取所有区域
        List<Region> regions = regionService.queryHostRegion();
        for(Region r:regions){
            Map<String,Object> map=new HashMap<>();
            map.put("regionName",r.getName());
            HashSet<Destination> set = new HashSet<>();
            Long[] refIds = r.getRefIds();
            for(int i=0;i<refIds.length;i++){
                Destination destination = destinationService.selectByPrimaryKey(refIds[i]);
                set.add(destination);
            }
            map.put("citys",set);
            hotRegions.add(map);
        }
        model.addAttribute("hotRegions",hotRegions);
        return "/hotel/hotel";
    }
    @RequestMapping("/theme")
    public String theme(Model model,Long id){
        DestinationTheme destinationTheme = hotelService.selectByThemeId(id);
        Long[] destIds = destinationTheme.getDestIds();
        List<Destination> list=new ArrayList<>();
        if(destIds!=null){
            for(int i=0;i<destIds.length;i++){
                Destination destination=destinationService.selectByPrimaryKey(destIds[i]);
                list.add(destination);
            }
        }
        //list
        model.addAttribute("list",list);
        return "/hotel/hotelTpl";
    }
    @RequestMapping("/hotHotel")
    public String hotHotel(Model model,Long id){
        List<Hotel> hotels = hotelService.selectHotelByDestId(id);
        //hotels
        model.addAttribute("hotels",hotels);
        return "/hotel/hotelTpl1";
    }

    /**
     * 通过目的地id进入酒店详情页面
     * @param model
     * @param destId    目的地id
     * @param destName  搜索框中的目的地是不带id的
     * @return
     */
    @RequestMapping("/dingjiudian")
    public String hotelDeatil(Model model,Long destId, @ModelAttribute("destName") String destName){
        //先判断是否有destId
        if(destId==null){
            //在判断destName是否有值
            if(destName!=null){
                //通过名称查出目的地
                Destination destination=destinationService.selectByName(destName);
                if(destination!=null){
                    getHotelDetail(model,destination.getId());
                }
            }
        }else {
            getHotelDetail(model,destId);
        }

        return "/hotel/dingjiudian";
    }
    @RequestMapping("/areaDeatil")
    public String areaDeatil(Model model,Long id){
        if(id!=-1){
            DestinationArea destinationArea=hotelService.selectAreaByAreaId(id);
            model.addAttribute("a",destinationArea);
        }
        return "/hotel/dingjiudianTpl1";
    }
    private void getHotelDetail(Model model,Long destId){
        //目的地的信息--需要名字和info
        Destination destination = destinationService.selectByPrimaryKey(destId);
        model.addAttribute("dest",destination);
        //土司
        List<Destination> toast = destinationService.queryByParentId(destination.getParent().getId());
        model.addAttribute("toast",toast);
        //该目的地下的所有区域
        List<DestinationArea> areas=hotelService.selectAreaByDestId(destId);
        model.addAttribute("areas",areas);
        //获取该目的地下的所有酒店标签
        List<HotelTag> hotelTags=hotelService.selectTagsByDestId(destId);
        model.addAttribute("tags",hotelTags);
        //获取目的地通个parentId下的其他目的地
        List<Destination> destinations=destinationService.selectByParentId(destination.getParent().getId());
        destinations.remove(destination);
        model.addAttribute("destinations",destinations);
        //brand
        List<String> brands=hotelService.selectAllBrand(destId);
        model.addAttribute("brand",brands);
        //facilities
        List<HotelFacilities> hotelFacilities=hotelService.selectAllFacilities();
        model.addAttribute("facilities",hotelFacilities);
    }
    @RequestMapping("/queryForHotel")
    public String queryForHotel(Model model, HotelQueryObject qo,@LoginUser UserInfo userInfo){
        PageInfo pageInfo=hotelService.queryForList(qo);
        if (userInfo != null) {
            //是否需要过滤没有收藏的酒店
            //查询redis中用户收藏是否含有该酒店
            List<Hotel> list = pageInfo.getList();
            Iterator<Hotel> it = list.iterator();
            while(it.hasNext()){
                Hotel hotel = it.next();
                boolean isFavor = hotelStatsCacheService.isFavor(hotel.getId(), userInfo.getId());
                hotel.setFavour(isFavor);
                if(qo.getFavour()==1){
                    if(!isFavor){
                        it.remove();
                        pageInfo.setTotal(pageInfo.getTotal()-1);
                    }
                }
            }
        }
        model.addAttribute("pageInfo",pageInfo);
        model.addAttribute("hotelNum",pageInfo.getTotal());
        return "/hotel/dingjiudianTpl2";
    }
    @RequestMapping("favor")
    @ResponseBody
    @RequiredLogin
    public Object favor(Long hotelId, @LoginUser UserInfo userInfo) {
        AjaxResult result = new AjaxResult();
        //调用service的方法直接返回一个布尔类型的值，这样直接给AjaxResult的success赋值
        boolean success = hotelStatsCacheService.favor(hotelId, userInfo.getId());
        result.setSuccess(success);
        /*StrategyStats strategyStats = hotelStatsCacheService.getByStrategyId(strategyId);*/
        /*//热门排行榜收藏分数加一
        hotelStatsCacheService.addRank(RedisKey.STRATEGY_STATS_HOT_SORT, 1, strategyId);*/
/*
        return result.addData(strategyStats.getFavornum());*/
        return result;
    }
}
