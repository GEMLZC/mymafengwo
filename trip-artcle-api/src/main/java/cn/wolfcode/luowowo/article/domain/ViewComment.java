package cn.wolfcode.luowowo.article.domain;

import cn.wolfcode.luowowo.comment.domain.ViewCommentBack;
import cn.wolfcode.luowowo.common.domain.BaseDomain;
import cn.wolfcode.luowowo.member.domain.UserInfo;
import com.sun.org.apache.bcel.internal.generic.BREAKPOINT;
import lombok.*;
import org.springframework.util.StringUtils;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * Created by Xhek on 2019/11/24.
 */
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@ToString
//景点评论表
public class ViewComment extends BaseDomain {

    public static final int PRAISE = 2;//好评
    public static final int MIDDLE_REVIEW = 1;//中评
    public static final int BAD_REVIEW = 0;//差评

    private View view;//关联的景点

    private UserInfo user;//写评论的用户

    private Integer starNum;//总体星星评价

    private String content;//评价内容

    private Date createTime;//创建时间

    private Integer sceneNum;//景色星星

    private Integer serviceNum;//服务星星

    private Integer specialNum;//特色星星

    private String img;//图片

    private String[] imgUrls;

    private int type;//好评 中评 差评

    private Integer thumbsupnum;//点赞数

    private boolean flag;//是否被当前用户点赞

    private boolean hasImg;//是否有图

    private boolean goldenComment;//是否是金牌

    List<ViewCommentBack> commentBacks=new ArrayList<>();//关联的评论

    private int commentnum;//关联的评论数


    //是否有图
    public void setHasImg(boolean hasImg){
        this.hasImg=hasImg;
    }

    public boolean getHasImg(){
        if (img!=null) {
            return true;
        }else {
            return false;
        }
    }



    public String[] getImgUrls(){
        if(StringUtils.hasLength(img)){
            return img.split(",");
        }
        return null;
    }

//    public String getImg(){
//        if(imgUrls!=null){
//            return StringUtils.arrayToDelimitedString(imgUrls, ",");
//        }
//        return null;
//    }


    //获取该数据的好中差评
    String getTypeName(){
        int avg=(starNum+sceneNum+specialNum+serviceNum)/4;
        switch (type){
            case (PRAISE):
                return "好评";
            case (MIDDLE_REVIEW):
                return "中评";
            case (BAD_REVIEW):
                return "差评";
            default:
                return null;
        }
    }

    public void setType(Integer starNum,Integer sceneNum,Integer specialNum,Integer serviceNum) {
        int avg = (starNum + sceneNum + specialNum + serviceNum) / 4;
        switch (avg) {

            case 0:
            case 1:
                this.type = BAD_REVIEW;
                break;
            case 2:
            case 3:
                this.type = MIDDLE_REVIEW;
                break;
            case 4:
            case 5:
                this.type = PRAISE;
                break;
        }
    }


}
