package com.zhiwei.service;

import com.zhiwei.dao.ChartMapper;
import com.zhiwei.po.Chart;
import com.zhiwei.po.vo.ChartVo;
import com.zhiwei.resultBase.BaseResult;
import com.zhiwei.util.IdGenerator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ChartService {

    @Autowired
    private ChartMapper   chartMapper;

    @Autowired
    private   FileUploadService fileUploadService;

    /**
     *插入操作
     */
    public BaseResult   infoSave(Chart   chart){
          //非空判断
        if(0!=chart.getRootId()&&null!=chart.getUrl()&&""!=chart.getUrl()){

                 int result  =  chartMapper.insert(chart);
                 if (result>0){
                     return   BaseResult.success();
                 }
             }



        return   BaseResult.error();
    }


    /**
     * 通过url删除数据库里面的数据
     */
    public   BaseResult    deleteByUrlService(String  url){
        if(null!=url && ""!=url.trim()){
            //删除服务器里面的数据，
          boolean  b =   fileUploadService.fileDelete(url);
            //删除数据库里面的数据
            int  result =  chartMapper.deleteByUrl(url);
            if (result>0 || b==true){
                return   BaseResult.success();
            }

        }
        return   BaseResult.error();

    }

    /**
     * 查询
     */

    public  BaseResult  queryListService(){
        List<ChartVo> list  =   chartMapper.queryList();
        return   BaseResult.ok(list);
    }

    /**
     * 根据rootId查询
     */
    public  BaseResult queryByRootIdService(Integer rootId){
        List<Chart> list  =  chartMapper.queryByRootId(rootId);
        return   BaseResult.ok(list);

    }



}
