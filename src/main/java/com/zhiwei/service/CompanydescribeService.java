package com.zhiwei.service;


import com.zhiwei.dao.CompanydescribeMapper;
import com.zhiwei.po.Companydescribe;
import com.zhiwei.resultBase.BaseResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

@Service
public class CompanydescribeService {

    @Autowired
    private CompanydescribeMapper  companydescribeMapper;


    /**
     * 信息录入与更新
     * @return
     */
    public BaseResult saveOrUpdateService(Companydescribe companydescribe){

        Date  date  = new Date();
        companydescribe.setCreatetime(date);
        int  result;

        if(companydescribe.getId()==null){
            //调用插入接口
            result =   companydescribeMapper.insert(companydescribe);
        }else{
            //更新操作
            result =   companydescribeMapper.update(companydescribe);
        }

        if(result>0){
            return     BaseResult.success();
        }else {
            return   BaseResult.error();
        }

    }

    /**
     * 通过id查询信息
     */
    public Companydescribe queryInfoByIdService(Integer id){
        Companydescribe companydescribe =  companydescribeMapper.queryInfoById(id);
        return companydescribe;
    }

    /**
     * 查询类表信息
     */
    public   List<Companydescribe>  queryListServie(){
        List<Companydescribe>  companydescribeList  =  companydescribeMapper.queryInfo();
        return   companydescribeList;
    }

    /**
     * 删除
     */
    public   BaseResult  deleteService(Integer  id){
        int  result = companydescribeMapper.delete(id);

        if(result>0){
            return   BaseResult.success();
        }else {
            return BaseResult.error();
        }



    }

}
