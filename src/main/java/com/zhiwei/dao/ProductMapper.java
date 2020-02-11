package com.zhiwei.dao;

import com.zhiwei.po.Chart;
import com.zhiwei.po.Product;
import com.zhiwei.po.vo.ProductVo;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ProductMapper {

     int insert(Product record);

     List<ProductVo> queryList();

     Product  queryById(Integer id);

     int  update(Product product);

     int  delete(Integer id);

     List<ProductVo>  queryFavoriteList();

     List<ProductVo>  queryListBySecondId(Integer secondId);

     ProductVo queryPortalInfoById(Integer id);

     List<ProductVo> queryProByWords(@Param("name") String name);


     List<Chart> queryChar();





}