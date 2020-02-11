package com.zhiwei.dao;

import com.zhiwei.po.Area;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface AreaMapper {
    List<Area> queryCity();

    List<Area> queryArea(Integer parentId);

    List<Area> queryAreaByParentId(@Param("name") String name);


}