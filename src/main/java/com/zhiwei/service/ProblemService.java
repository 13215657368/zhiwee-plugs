package com.zhiwei.service;


import com.zhiwei.dao.ProblemMapper;
import com.zhiwei.po.Problem;
import com.zhiwei.resultBase.BaseResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

/**
 * Created by jick on 2019/9/5.
 */
@Service
public class ProblemService {


    @Autowired
    private ProblemMapper   problemMapper;


    /**
     * 信息保存
     */
    public BaseResult   saveService(Problem  problem){
        //非空判断
        if(null==problem.getTitle()||""==problem.getTitle().trim()||
            null==problem.getContent()||""==problem.getContent()){
            return   BaseResult.error();
        }


            Date  date  = new Date();
            problem.setCreatetime(date);


        int result =   problemMapper.insert(problem);

        if(result>0){
            return  BaseResult.success();
        }
        return BaseResult.error();

    }


    /**
     * 查询类表
     */
    public  BaseResult  queryListService(){
        List<Problem>  list   = problemMapper.queryList();
        return   BaseResult.ok(list);
    }

    /**
     * 通过id插叙详细信息
     */
    public  Problem queryByIdService(Integer id){

        return   problemMapper.queryById(id);
    }

    /**
     * 更新操作
     */
    public BaseResult updateService(Problem problem){
        //非空判断
        if(null==problem.getTitle()||""==problem.getTitle().trim()||
                null==problem.getContent()||""==problem.getContent()){
            return   BaseResult.error();
        }

        Date  date  = new Date();
        problem.setCreatetime(date);


        int result =   problemMapper.update(problem);

        if(result>0){
            return  BaseResult.success();
        }
        return BaseResult.error();

    }

    /**
     * 根据id删除
     */
    public   BaseResult  deleteService(Integer id){
        int result = problemMapper.delete(id);

        if(result>0){
            return  BaseResult.success();
        }
        return    BaseResult.error();
    }

}
