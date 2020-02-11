package com.zhiwei.service;

import com.zhiwei.dao.CompanyhonorMapper;
import com.zhiwei.po.Companyhonor;
import com.zhiwei.resultBase.BaseResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

@Service
public class CompanyHonorService {

    @Autowired
    private CompanyhonorMapper companyhonorMapper;




    /**
     * 信息保存与更新
     */
    public BaseResult saveOrUpdateService(Companyhonor companyhonor){
        int result;
        //添加操作
        Date date  = new Date();
        companyhonor.setCreatetime(date);
        if(companyhonor.getId()==null){
            result =  companyhonorMapper.insert(companyhonor);
        }else{
            result=companyhonorMapper.update(companyhonor);
        }

        if(result>0){
            return   BaseResult.success();
        }
        return   BaseResult.error();

    }


    /**
     * 查询类表信息
     */
    public List<Companyhonor> queryListServie(){
        List<Companyhonor>   companyhonorList =  companyhonorMapper.queryInfo();
        return    companyhonorList;
    }

    /**
     * 通过id查询信息
     */
    public Companyhonor queryInfoByIdService(Integer id){
        Companyhonor   companyhonor=  companyhonorMapper.queryInfoById(id);
        return  companyhonor;
    }

    /**
     * 删除
     */
    public   BaseResult  deleteService(Integer  id){
        int  result =companyhonorMapper.delete(id);

        if(result>0){
            return   BaseResult.success();
        }else {
            return BaseResult.error();
        }



    }


}
