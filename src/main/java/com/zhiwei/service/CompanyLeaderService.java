package com.zhiwei.service;

import com.zhiwei.dao.CompanyleaderMapper;
import com.zhiwei.po.Companyleader;
import com.zhiwei.resultBase.BaseResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

@Service
public class CompanyLeaderService {

    @Autowired
    CompanyleaderMapper  companyleaderMapper;

    /**
     * 信息保存与更新
     */
    public BaseResult saveOrUpdateService(Companyleader companyleader){
        int result;
        //添加操作
        Date date  = new Date();
        companyleader.setCreatetime(date);
        if(companyleader.getId()==null){
            result =  companyleaderMapper.insert(companyleader);
        }else{
            result=companyleaderMapper.update(companyleader);
        }

        if(result>0){
            return   BaseResult.success();
        }
        return   BaseResult.error();

    }


    /**
     * 查询类表信息
     */
    public List<Companyleader> queryListServie(){
        List<Companyleader>   companycultureList =  companyleaderMapper.queryInfo();
        return    companycultureList;
    }

    /**
     * 通过id查询信息
     */
    public Companyleader queryInfoByIdService(Integer id){
        Companyleader  companyleader =  companyleaderMapper.queryInfoById(id);
        return  companyleader;
    }

    /**
     * 删除
     */
    public   BaseResult  deleteService(Integer  id){
        int  result = companyleaderMapper.delete(id);

        if(result>0){
            return   BaseResult.success();
        }else {
            return BaseResult.error();
        }



    }





}


