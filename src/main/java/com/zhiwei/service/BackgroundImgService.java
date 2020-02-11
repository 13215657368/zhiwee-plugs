package com.zhiwei.service;

import com.zhiwei.dao.BackgroundImgMapper;
import com.zhiwei.po.BackgroundImg;
import com.zhiwei.resultBase.BaseResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BackgroundImgService {

    @Autowired
    private BackgroundImgMapper backgroundImgMapper;

    @Autowired
    private  FileUploadService  fileUploadService;



    public List<BackgroundImg> getList(){
        return backgroundImgMapper.getList();
    }

    public BaseResult deleteService(BackgroundImg backgroundImg) {


        //删除服务器里面的数据
        Boolean  b = fileUploadService.fileDelete(backgroundImg.getImgUrl());

        if(b){
            //删除数据库里面的信息
            int result1 = backgroundImgMapper.deleteById(backgroundImg.getId());
            if(result1>0){
                return BaseResult.success();
            }else{
                return BaseResult.error();
            }
        }
        return   BaseResult.error();
    }

    public BackgroundImg getInfo(Integer id) {
        return backgroundImgMapper.getInfo(id);
    }

    public BaseResult addBackgroundImg(BackgroundImg backgroundImg) {

        //首先判断数据库里面类型是否存在，如果存在则更新操作
        BackgroundImg result =  backgroundImgMapper.checkByDealerType(backgroundImg.getDealerType());
        int result1;

        if(result !=null){
            //更新操作
            backgroundImg.setId(result.getId());
            //删除服务上的原图
            boolean b = fileUploadService.fileDelete(result.getImgUrl());
            result1= backgroundImgMapper.update(backgroundImg);

        }else{
            //向数据库里面存入信息
            result1 = backgroundImgMapper.addBackgroundImg(backgroundImg);
        }
        if(result1>0){
            return BaseResult.success();
        }else{
            return BaseResult.error();
        }
    }

    public BaseResult update(BackgroundImg backgroundImg) {

        int  result1=0;


        //首先判断数据库里面类型是否存在，如果存在则更新操作
        BackgroundImg result =  backgroundImgMapper.checkByDealerType(backgroundImg.getDealerType());


        /**
         * 1、如果类型存在，则进行更新操作，同时删除原来的类型
         * 2、如果就是本身类型，直接进行更新操作
         * 3、如果类型不存在，则直接将本身信息更新为所需的类型。
         */

        //如果存在是更新原来数据操作
        if(result != null){

            if(result.getId() != backgroundImg.getId()){

                //   boolean b = fileUploadService.fileDelete(result.getImgUrl());
                result1 = backgroundImgMapper.update(backgroundImg);
                //删除以前的记录
                backgroundImgMapper.deleteById(result.getId());
            }else{
                result1 = backgroundImgMapper.update(backgroundImg);
            }

        }else{
            //更新操作
            result1 = backgroundImgMapper.update(backgroundImg);
        }

        if(result1>0){
            return BaseResult.success();
        }else{
            return BaseResult.error();
        }
    }


    /**
     * 图片删除
     */
    public  BaseResult imgDeleteService(String url){

        //删除服务器上的图片
        Boolean bo = fileUploadService.fileDelete(url);

        if (bo){
            //跟新数据库里面的数据
            int result = backgroundImgMapper.updateByUrl(url);
            if(result>0){
                return  BaseResult.success();
            }
            return BaseResult.error();
        }
        return   BaseResult.error();


    }


    /**
     * 通过type检验唯一性
     */
    public BaseResult checkByTypeService(Integer type){
        int result =  backgroundImgMapper.checkByType(type);

        //通过type判断返回值，给出对应结果集
        if(type==1){
            if(result>0){
                return  BaseResult.error();
            }
        }
        if(type==2){
            if(result>=3){
                return  BaseResult.error();
            }
        }


        return   BaseResult.success();

    }


    /**
     * 通过dealerType验证唯一性
     */
    public BaseResult checkByDealerTypeService(Integer dealerType){
        BackgroundImg result =  backgroundImgMapper.checkByDealerType(dealerType);

        if(result != null){
            return  BaseResult.error();
        }
        return   BaseResult.success();

    }

}
