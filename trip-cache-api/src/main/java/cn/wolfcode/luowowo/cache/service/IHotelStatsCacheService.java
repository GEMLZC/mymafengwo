package cn.wolfcode.luowowo.cache.service;

public interface IHotelStatsCacheService {
    /**
     * 收藏
     * @param hotelId
     * @param id
     * @return
     */
    boolean favor(Long hotelId, Long id);

    /**
     * 用户收藏判断
     * @param hotelId
     * @param userId
     * @return
     */
    boolean isFavor(Long hotelId, Long userId);
}
