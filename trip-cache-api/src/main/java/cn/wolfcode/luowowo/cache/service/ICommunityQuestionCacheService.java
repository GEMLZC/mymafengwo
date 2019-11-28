package cn.wolfcode.luowowo.cache.service;

import java.util.List;

public interface ICommunityQuestionCacheService {
    /**
     * 设置图片路径
     * @param imgUrl
     * @param userId
     */
    void setImgUrl(List<String> imgUrl, Long userId);

    /**
     * 获取图片路径
     * @param
     * @param id
     * @return
     */
    List<String> getImgUrl(Long id);
}
