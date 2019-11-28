package cn.wolfcode.luowowo.website.controller;

import cn.wolfcode.luowowo.article.domain.Destination;
import cn.wolfcode.luowowo.article.domain.StrategyDetail;
import cn.wolfcode.luowowo.article.domain.Travel;
import cn.wolfcode.luowowo.article.service.IDestinationService;
import cn.wolfcode.luowowo.article.service.IStrategyDetailService;
import cn.wolfcode.luowowo.article.service.ITravelService;
import cn.wolfcode.luowowo.member.domain.UserInfo;
import cn.wolfcode.luowowo.member.service.IUserInfoService;
import cn.wolfcode.luowowo.search.service.IDestinationSearchService;
import cn.wolfcode.luowowo.search.service.IStrategySearchService;
import cn.wolfcode.luowowo.search.service.ITravelSearchService;
import cn.wolfcode.luowowo.search.service.IUserInfoSearchService;
import cn.wolfcode.luowowo.search.template.DestinationTemplate;
import cn.wolfcode.luowowo.search.template.StrategyTemplate;
import cn.wolfcode.luowowo.search.template.TravelTemplate;
import cn.wolfcode.luowowo.search.template.UserInfoTemplate;
import org.apache.dubbo.config.annotation.Reference;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("/elasticsearch")
public class ElasticsearchController {
    @Reference
    private IStrategyDetailService strategyDetailService;
    @Reference
    private IUserInfoService userInfoService;
    @Reference
    private IDestinationService destinationService;
    @Reference
    private ITravelService travelService;

    @Reference
    private IStrategySearchService strategyTemplateService;
    @Reference
    private ITravelSearchService travelTemplateService;
    @Reference
    private IUserInfoSearchService userInfoTemplateService;
    @Reference
    private IDestinationSearchService destinationTemplateService;

    @RequestMapping("/init")
    @ResponseBody
    public String init() {
        List<StrategyDetail> details = strategyDetailService.query();
        for (StrategyDetail detail : details) {
            Long destId = detail.getDest().getId();

            StrategyTemplate template = new StrategyTemplate();

            template.setId(detail.getId());
            template.setTitle(detail.getTitle());
            template.setSubTitle(detail.getSubTitle());
            template.setDestId(destId);
            template.setDestName(detail.getDest().getName());
            template.setThemeId(detail.getTheme().getId());
            template.setThemeName(detail.getTheme().getName());
            template.setSummary(detail.getSummary());
            template.setCreateTime(detail.getCreateTime());
            template.setViewnum(detail.getViewnum());
            template.setFavornum(detail.getFavornum());
            template.setReplynum(detail.getReplynum());
            template.setThumbsupnum(detail.getThumbsupnum());
            template.setCoverUrl(detail.getCoverUrl());

            Destination dest = destinationService.getCountry(destId);
            template.setCountryId(dest.getId());
            template.setCountryName(dest.getName());

            dest = destinationService.getProvince(destId);
            if (dest != null) {
                template.setProvinceId(dest.getId());
                template.setProvinceName(dest.getName());
            }

            strategyTemplateService.save(template);
        }

        //=========================================

        List<Travel> travels = travelService.list();
        for (Travel travel : travels) {
            TravelTemplate template = new TravelTemplate();
            template.setId(travel.getId());
            template.setAuthorId(travel.getAuthor().getId());
            template.setAuthorName(travel.getAuthor().getNickname());
            template.setDestId(travel.getDest().getId());
            template.setDestName(travel.getDest().getName());
            template.setTitle(travel.getTitle());
            template.setCreateTime(travel.getCreateTime());
            template.setCoverUrl(travel.getCoverUrl());
            template.setSummary(travel.getSummary());
            template.setReplynum(travel.getReplynum());
            template.setViewnum(travel.getViewnum());

            travelTemplateService.save(template);
        }

        //=========================================

        List<UserInfo> users = userInfoService.query();
        for (UserInfo user : users) {
            UserInfoTemplate template = new UserInfoTemplate();
            template.setId(user.getId());
            template.setNickname(user.getNickname());
            template.setDestName(user.getCity());
            template.setInfo(user.getInfo());
            template.setHeadUrl(user.getHeadImgUrl());
            template.setLevel(user.getLevel());

            userInfoTemplateService.save(template);
        }

        //=========================================

        List<Destination> dests = destinationService.query();
        for (Destination dest : dests) {
            DestinationTemplate template = new DestinationTemplate();
            template.setId(dest.getId());
            template.setName(dest.getName());
            template.setCoverUrl(dest.getCoverUrl());
            template.setInfo(dest.getInfo());

            destinationTemplateService.save(template);
        }

        return "ok";
    }
}
