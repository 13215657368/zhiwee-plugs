package com.zhiwei.service;

import com.zhiwei.dao.JobMapper;
import com.zhiwei.po.Job;
import com.zhiwei.resultBase.BaseResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by jick on 2019/6/27.
 */
@Service
public class JobService {
    @Autowired
    private JobMapper  jobMapper;


    /**
     * 职位信息入库
     * @param job
     * @return
     */

    public BaseResult  jobAddService(Job job){

        //非空判断
        if(null!=job.getRole()&&""!=job.getRole().trim() &&null!=job.getLocation()&&""!=job.getLocation().trim()
                &&!"0".equals(job.getEducation())&&null!=job.getDate()&&""!=job.getDate().trim() &&null!=job.getDetails()&&""!=job.getDetails().trim()){
          //  String htmlEscape = HtmlUtils.htmlEscape(job.getDetails(), "UTF-8");
           // job.setDetails(htmlEscape);
            int   result  =  jobMapper.insert(job);
            if(result>0){
                return   BaseResult.success();
            }

        }
        return  BaseResult.error();


    }

    /**
     * 职位列表展示
     */
    public List<Job> jobsListService(){
           return jobMapper.queryList();
    }

    /**
     * 通过i来查询信息，做回显
     */
    public  Job jobInfoService(Integer id){
        if(null!=id){
            return  jobMapper.queryById(id);
        }else{
            return  null;
        }
    }

    /**
     * 根据id来对信息进行更新
     */
    public   BaseResult  jobInfoUpdateService(Job job){
        //非空判断
        if(null!=job.getRole()&&""!=job.getRole().trim() &&null!=job.getLocation()&&""!=job.getLocation().trim()
                &&!"0".equals(job.getEducation())&&null!=job.getDate()&&""!=job.getDate().trim() &&null!=job.getDetails()&&""!=job.getDetails().trim()){
            int   result  =  jobMapper.update(job);
            if(result>0){
                return   BaseResult.success();
            }
        }
        return  BaseResult.error();
    }

    /**
     * 通过主键来删除信息
     */
    public  BaseResult  deleteService(Integer id){
        if(null!=id){
            int   result = jobMapper.delete(id);
            if(result>0){
                return  BaseResult.success();
            }
        }
        return  BaseResult.error();

    }

    /**
     * 通过关键字搜索
     */
    public List<Job> queryJobByWordsService(String role){
        return  jobMapper.queryJobByWords(role);
    }

}
