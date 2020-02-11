package com.zhiwei.controller;

import com.zhiwei.po.vo.PermissionDao;
import com.zhiwei.resultBase.BaseResult;
import com.zhiwei.service.PermissionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/permission")
public class PermissionController {

    @Autowired
    private PermissionService  permissionService;

    /**
     * 授权操作
     */
    @RequestMapping("/grant")
    @ResponseBody
    public BaseResult  grantController(PermissionDao permissionDao){
        return  permissionService.grantService(permissionDao);

    }

}
