package com.zhiwei.dao;

import com.zhiwei.po.Activity;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ActivityMapper {
    int insert(Activity record);
    List<Activity> queryActive();
    Activity queryById(@Param("id") String id);
    int updateById(Activity activity);
    int deleteById(@Param("id") String id);
    List<Activity> queryActiveByType(Integer type);
    List<Activity>  queryActiveByWords(@Param("title") String title);

}