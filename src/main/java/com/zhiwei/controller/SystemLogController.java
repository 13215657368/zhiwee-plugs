package com.zhiwei.controller;

import com.zhiwei.base.BaseController;
import com.zhiwei.po.SystemLog;
import com.zhiwei.resultBase.BaseResult;
import com.zhiwei.service.SystemLogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("/log")
public class SystemLogController  extends BaseController {


    @Autowired
    private SystemLogService  systemLogService;


    /**
     * @Author: jick
     * @Date: 2019/11/22 11:45
     * 登录日志信息
     */
    @RequestMapping("/list")
    public  String  SystemlogList(Model model){
        List<SystemLog> list  =  systemLogService.queryListService();
        model.addAttribute("list",list);
        return   "system-log";
    }



    /**
     * @Author: jick
     * @Date: 2019/11/22 14:53
     * 日志删除
     */
    @RequestMapping("/delete")
    @ResponseBody
    public BaseResult  logDeleteController(String  id){
        return   systemLogService.deleteService(id);

    }

    /**
     * @Author: jick
     * @Date: 2019/11/22 15:36
     * 批量删除
     */
    @RequestMapping("/branchDelete")
    @ResponseBody
    public  BaseResult branchDeleteControler(String  ids){
        return   systemLogService.branchDeleteService(ids);

    }


}
