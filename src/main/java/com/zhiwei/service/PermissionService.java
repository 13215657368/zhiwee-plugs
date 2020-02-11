package com.zhiwei.service;

import com.zhiwei.dao.PermissionMapper;
import com.zhiwei.po.Permission;
import com.zhiwei.po.vo.PermissionDao;
import com.zhiwei.resultBase.BaseResult;
import com.zhiwei.util.IdGenerator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

@Service
public class PermissionService {

    @Autowired
    private PermissionMapper  permissionMapper;

    /**
     * 授权
     */
    public BaseResult grantService(PermissionDao permissionDao){

        //删除以前的权限记录
        int  result = permissionMapper.deleteByUserId(permissionDao.getUserId());

        //授权


        List<Permission> permissionList =  new ArrayList<>();

        //封装
        String[] s =  permissionDao.getModelIdStr().split(",");
        //如果模块ID不为空进行循环封装
        if(s.length>0){
            for(String str :s){
                Permission  permission = new Permission();
                permission.setId(IdGenerator.uuid());
                permission.setUserId(permissionDao.getUserId());
                permission.setModelId(Integer.valueOf(str));
                permissionList.add(permission);
            }
        }

        //如果集合不是为空进行插入操作
        int result2 = 0;
        if(permissionList.size()>0){
            result2=permissionMapper.insert(permissionList);
        }



        return  result2>0 ?  BaseResult.success():BaseResult.error();





    }
}
