package com.zhiwei.dao;

import com.zhiwei.po.Params;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ParamsMapper {


    int insert(Params params);

    int deleteByUrl(@Param("params") String   params);

    int deleteByNum(@Param("pnumber")  String  pnumber);

    List<String> queryUrlByNum(@Param("pnumber")  String  pnumber);

}