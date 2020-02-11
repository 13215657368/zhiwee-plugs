package com.zhiwei.dao;

import com.zhiwei.po.PermissionUser;
import org.springframework.stereotype.Repository;

@Repository
public interface PermissionUserMapper {
    int insert(PermissionUser permissionUser);

    PermissionUser  selectByUserId(Integer userId);

    int update(PermissionUser permissionUser);

    int deleteByUserId(Integer userId);


}