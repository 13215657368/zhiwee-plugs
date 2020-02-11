package com.zhiwei.dao;

import com.zhiwei.po.Rotationchart;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface RotationchartMapper {


    int insert(Rotationchart record);

    int deleteByUrl(@Param("url") String url);

    List<Rotationchart> queryList();

    Integer updateSort(Rotationchart record);

    Rotationchart queryById(Integer id);
    Integer  update(Rotationchart rotationchart);




}