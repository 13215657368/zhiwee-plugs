package com.zhiwei.dao;

import com.zhiwei.po.Job;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface JobMapper {
    int insert(Job job);
    List<Job> queryList();
    Job queryById(Integer id);
    int update(Job job);
    int delete(Integer id);
    List<Job> queryJobByWords(@Param("role") String role);
}