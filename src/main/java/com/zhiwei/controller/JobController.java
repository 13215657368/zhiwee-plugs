package com.zhiwei.controller;

import com.zhiwei.base.BaseController;
import com.zhiwei.po.Job;
import com.zhiwei.po.vo.RequestPermission;
import com.zhiwei.po.vo.White;
import com.zhiwei.resultBase.BaseResult;
import com.zhiwei.service.JobService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.util.HtmlUtils;

import java.util.List;

/**
 * Created by jick on 2019/6/12.
 */
@Controller
@RequestMapping("/jobs")
public class JobController extends BaseController {
    @Autowired
    private JobService jobService;


    /**
     * 职位列表展示
     */
    @RequestPermission(permissionCode = "006")
    @RequestMapping("/list")
    public   String  jobList(Model model){
        List<Job> jobs = jobService.jobsListService();
        model.addAttribute("jobList",jobs);
        return  "job-list";
    }

    @RequestPermission(permissionCode = "006")
    @RequestMapping("/addPage")
    public   String   jobAdd(){
        return  "job-add";
    }

    /**
     * 回显数据
     */
    @RequestPermission(permissionCode = "006")
    @RequestMapping("/detail")
    public   String   jobDetail(Model model,Integer id){
        Job  job = jobService.jobInfoService(id);
        model.addAttribute("job" ,job);
        return  "job-edit";
    }

    /**
     * 职位添加
     */
    @RequestMapping("/add")
    @ResponseBody
    public BaseResult jobAddToBase(Job job){
         BaseResult  result=  jobService.jobAddService(job);
         return    result;
    }

    //jobInfoUpdateService

    /**
     * 职位信息添加
     */
    @RequestMapping("/update")
    @ResponseBody
    public BaseResult jobUpdate(Job job){
        BaseResult  result=  jobService.jobInfoUpdateService(job);
        return    result;
    }

    /**
     * 列表删除
     */
    @RequestMapping("/delete")
    @ResponseBody
    public BaseResult jobDelete(Integer id){
        BaseResult  result=  jobService.deleteService(id);
        return    result;
    }

    //////////////////////////////////////////////////////////////////
    /**
     * 前台页面展示
     */

    /**
     * 展示的职位列表
     * @return
     */
    @White
    @RequestMapping("/portal/list")
    @ResponseBody
    public   List<Job>  jobPortalList(){
        List<Job> jobs = jobService.jobsListService();
        return   jobs;
    }

    /**
     * 展示职位的详细信息
     */
    @White
    @RequestMapping("/portal/jobInfo")
    @ResponseBody
    public   Job   jobInfo(Integer id){
        Job  job = jobService.jobInfoService(id);
        return   job;
    }

    @White
    @RequestMapping("/portal/jobInfoTest")
    @ResponseBody
    public   Job  jobInfoTest(Integer id){
        Job  job = jobService.jobInfoService(id);
        return   job;
    }






}
