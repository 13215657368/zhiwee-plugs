package com.zhiwei.service;

import com.zhiwei.dao.SystemLogMapper;
import com.zhiwei.po.SystemLog;
import com.zhiwei.resultBase.BaseResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class SystemLogService {

    @Autowired
    private SystemLogMapper  systemLogMapper;



    /**
     * @Author: jick
     * @Date: 2019/11/22 14:46
     * 查询日志列表
     */
    public List<SystemLog>   queryListService(){
        return    systemLogMapper.queryList();
    }



    /**
     * @Author: jick
     * @Date: 2019/11/22 14:47
     * 删除日志
     */
    public BaseResult  deleteService(String   id){

        int   result =0;

        if(null !=id &&  id.length()>0)
            result =  systemLogMapper.delete(id);

            return   result>0 ?    BaseResult.success() :  BaseResult.error();

    }


    /**
     * @Author: jick
     * @Date: 2019/11/22 15:36
     * 批量删除
     */
    public  BaseResult  branchDeleteService(String  ids){

        int result = 0;

        if(null != ids && ids.length()>0){
            String[] id =  ids.split(",");
            result =  systemLogMapper.branchDelete(id);

        }

        return   result >0 ?  BaseResult.success() : BaseResult.error();

    }



}
