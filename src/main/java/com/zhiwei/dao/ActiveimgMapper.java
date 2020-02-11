package com.zhiwei.dao;

import com.zhiwei.po.Activeimg;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ActiveimgMapper {

    int insert(Activeimg activeimg);
    List<Activeimg> queryByacid(@Param("acid") String acid);
    int deleteById(Integer id);
    int deleteByAcid(@Param("acid") String acid);
    int deleteByUrl(@Param("url")    String url);

}