package com.zhiwei.dao;

import com.zhiwei.po.ProductImg;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ProductImgMapper {


    int insert(ProductImg record);

    int deleteByUrl(@Param("url") String url);

    List<String>  queryByNum(@Param("pnumber") String queryByNum);

    int deleteByNum(@Param("pnumber") String pnumber);


}