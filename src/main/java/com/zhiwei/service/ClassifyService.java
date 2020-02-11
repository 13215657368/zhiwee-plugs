package com.zhiwei.service;


import com.zhiwei.dao.ClassifyMapper;
import com.zhiwei.po.Classify;
import com.zhiwei.resultBase.BaseResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ClassifyService {

    @Autowired
    private ClassifyMapper classifyMapper;

    public List<Classify> getList(){
        return classifyMapper.getList();
    }

    public BaseResult deleteService(Integer id) {
        //删除数据库里面的信息
        int result1 = classifyMapper.deleteById(id);
        if(result1>0){
            return BaseResult.success();
        }else{
            return BaseResult.error();
        }
    }

    public Classify getInfo(Integer id) {
        return classifyMapper.getInfo(id);
    }

    public BaseResult editYES(Integer id) {
        //启用
        int result1 = classifyMapper.editYES(id);
        if(result1>0){
            return BaseResult.success();
        }else{
            return BaseResult.error();
        }
    }

    public BaseResult editNO(Integer id) {
        //禁用
        int result1 = classifyMapper.editNO(id);
        if(result1>0){
            return BaseResult.success();
        }else{
            return BaseResult.error();
        }
    }

    public BaseResult update(Classify classify) {

        //禁用
        int result1 = classifyMapper.update(classify);
        if(result1>0){
            return BaseResult.success();
        }else{
            return BaseResult.error();
        }
    }

    public List<Classify> getAllClassify() {
        return classifyMapper.getAllClassify();
    }
}
