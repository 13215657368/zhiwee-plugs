package com.zhiwei.dao;

import com.zhiwei.po.Shop;
import com.zhiwei.po.vo.ShopResult;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ShopMapper {
    int insert(Shop record);
    List<Shop> queryShopList();
    int deleteBynum(String num);
    Shop queryInfoById(Integer id);
    int  update(Shop shop);
    Shop queryByNum(String num);
    List<Shop> queryShopByWords(@Param("shopname") String shopname);
    List<ShopResult> queryShopListForPortal();
}