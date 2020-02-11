package com.zhiwei.dao;

import com.zhiwei.po.SystemLog;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface SystemLogMapper {

    int insert(SystemLog record);

    List<SystemLog> queryList();

    int delete(String id);

    int  branchDelete(String[] ids);

    int   deleteListByDate(SystemLog record);



}