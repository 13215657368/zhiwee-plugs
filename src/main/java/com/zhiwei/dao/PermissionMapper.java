package com.zhiwei.dao;

import com.zhiwei.po.Permission;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface PermissionMapper {


    int insert(List<Permission> list);
    int deleteByUserId(Integer userId);
}