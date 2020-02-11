package com.zhiwei.dao;

import com.zhiwei.po.Shopimage;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ShopimageMapper {
    int insert(Shopimage shopimage);
    List<Shopimage> queryByShopid(String shopid);
    int deleteById(int id);
    int deleteByNum(String shopid);
    int deleteByUrl(@Param("url") String url);

}