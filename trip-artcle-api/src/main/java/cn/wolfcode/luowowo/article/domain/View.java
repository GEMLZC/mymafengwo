package cn.wolfcode.luowowo.article.domain;

import cn.wolfcode.luowowo.common.domain.BaseDomain;


import lombok.*;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.util.StringUtils;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.prefs.BackingStoreException;

/**
 * Created by Xhek on 2019/11/23.
 */
@Getter@Setter
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class View extends BaseDomain{
    public static final Integer HOT_NOT=0;//非热门
    public static final Integer HOT_IS= 1; //热门

    public static final Integer VIEW_MAIN= 0; //广州景点用来存储summary
    public static final Integer VIEW_MUST= 1; //必去
    public static final Integer VIEW_HOT= 2; //热门
    public static final Integer VIEW_REF= 3; //内部景点



    private String name;//景点名字

    private String engName;//景点英文名

    private Destination dest;//关联的目的地

    private String img;//图片

    private String[] imgUrls;

    private int hot;//是否热门

    private String info;//简介//显示在list界面

    private String tel;//电话

    private String link;//网址

    private String takeTime;//建议用时

    private String summary;//梗概//detail页面显示

    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date lastUpdateTime;//最后更新时间

    private View parent;//关联的父景点

    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date createTime;//创建时间

    private Integer commentnum;//点评数

    private Integer favornum;//收藏数

    private Integer visitnum;//去过数

    private Integer type;//类型

    private List<View> children=new ArrayList<>();//子景点








    private ViewContent viewContent;

    public String[] getImgUrls(){
        if(StringUtils.hasLength(img)){
            return img.split(",");
        }
        return null;
    }

    public String getImg(){
        if(imgUrls!=null){
            return StringUtils.arrayToDelimitedString(imgUrls, ",");
        }
        return null;
    }



}
