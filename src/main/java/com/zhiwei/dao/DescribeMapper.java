package com.zhiwei.dao;

import com.zhiwei.po.Describe;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface DescribeMapper {
    int insert(Describe describe);

    int deleteByUrl(@Param("describes") String describes);

    int  deleteByNum(@Param("pnumber")  String  pnumber);

    List<String> queryUrlByNum(@Param("pnumber")  String  pnumber);


}