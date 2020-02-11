package com.zhiwei.dao;

import com.zhiwei.po.Pubinfo;
import com.zhiwei.po.Publication;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface PubinfoMapper {
    int insert(Pubinfo pubinfo);
    List<String>  queryUrlByNum(@Param("pnumber") String pnumber);
     Pubinfo queryUrlByNumAndPageNum(Pubinfo pubinfo);
    int deleteByUrl(@Param("url") String url);
    int deleteByNum(@Param("pnumber") String pnumber);
    List<Pubinfo>  queryUrlByNum2(@Param("pnumber") String pnumber);
    int  update(Pubinfo pubinfo);


}