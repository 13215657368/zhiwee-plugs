package com.zhiwei.service;


import com.zhiwei.controller.CompanyCultureController;
import com.zhiwei.dao.CompanycultureMapper;
import com.zhiwei.po.Companyculture;
import com.zhiwei.resultBase.BaseResult;
import jdk.nashorn.internal.objects.NativeUint8Array;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import sun.security.x509.CertificatePolicyMap;

import java.util.Date;
import java.util.List;

@Service
public class CompanycultureService {

    @Autowired
    private CompanycultureMapper  companycultureMapper;

    /**
     * 信息保存与更新
     */
    public   BaseResult   saveOrUpdateService(Companyculture companyculture){
        int result;
        //添加操作
        Date date  = new Date();
        companyculture.setCreatetime(date);
        if(companyculture.getId()==null){
            result =  companycultureMapper.insert(companyculture);
        }else{
            result=companycultureMapper.update(companyculture);
        }

        if(result>0){
            return   BaseResult.success();
        }
        return   BaseResult.error();

    }


    /**
     * 查询类表信息
     */
    public List<Companyculture> queryListServie(){
        List<Companyculture>   companycultureList =  companycultureMapper.queryInfo();
        return    companycultureList;
    }

    /**
     * 通过id查询信息
     */
    public  Companyculture queryInfoByIdService(Integer id){
         Companyculture companyculture =  companycultureMapper.queryInfoById(id);
         return  companyculture;
    }

    /**
     * 删除
     */
    public   BaseResult  deleteService(Integer  id){
        int  result = companycultureMapper.delete(id);

        if(result>0){
            return   BaseResult.success();
        }else {
            return BaseResult.error();
        }



    }


}
