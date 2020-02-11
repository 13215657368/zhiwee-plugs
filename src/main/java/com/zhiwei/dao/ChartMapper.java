package com.zhiwei.dao;

import com.zhiwei.po.Chart;
import com.zhiwei.po.vo.ChartVo;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ChartMapper {

    int insert(Chart record);

     List<ChartVo> queryList();

     int deleteByUrl(@Param("url") String url);

     List<Chart> queryByRootId(Integer  rootId);



}