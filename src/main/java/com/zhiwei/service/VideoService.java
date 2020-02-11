package com.zhiwei.service;

import com.zhiwei.dao.VideoMapper;
import com.zhiwei.po.Video;
import com.zhiwei.resultBase.BaseResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by jick on 2019/8/15.
 */
@Service
public class VideoService {

    @Autowired
    private VideoMapper videoMapper;

    @Autowired
    private  FileUploadService fileUploadService;


    /**
     *视频信息存入数据库
     */
    public BaseResult videoSaveService(Video video){



        if(null==video.getTitle()||""==video.getTitle().trim()||
            null==video.getUrl()||""==video.getUrl()||
            null==video.getCover()||""==video.getCover() ){
            return BaseResult.error();
        }

        video.setState(1);

        int result = videoMapper.insert(video);

        return result>0 ? BaseResult.success():BaseResult.error();

    }

    /**
     * 返回信息列表
     */
    public  BaseResult queryInfoListService(){
        List<Video>  list = videoMapper.queryInfoList();
        return  BaseResult.ok(list);
    }

    /**
     *通过id查询信息，进行回显
     */
    public BaseResult queryByIdService(Integer id){
        Video video = videoMapper.queryById(id);
        return  BaseResult.ok(video);

    }


    /**
     * 视频删除，同时更新数据库里面的url字段
     */
    public BaseResult videoDeleteService(Video video){

        //删除服务器上的视频
        Boolean b = fileUploadService.videoDelete(video.getUrl());

        if(b){
            //更新数据库
            int  result =  videoMapper.updateUrl(video.getId());
            if(result>0){
                return  BaseResult.success();
            }
        }
        return  BaseResult.error();





    }


    /**
     * 信息更新
     */
    public BaseResult  updateSerice(Video video){

        if(null!=video.getTitle()&&""!=video.getTitle().trim()&&
                null!=video.getUrl()&&""!=video.getUrl()){
            int  result = videoMapper.update(video);
            return  result>0 ? BaseResult.success(): BaseResult.error();
        }
        return  BaseResult.error();
    }

    /**
     * 信息删除
     */
    public BaseResult deteteService(Video video){


        //删除服务器上的服务器上的图片
        Boolean b = fileUploadService.videoDelete(video.getUrl());

        if(b){
            //删除数据库里面的信息
            int result = videoMapper.deleteById(video.getId());
            return  result>0 ? BaseResult.success() : BaseResult.error();
        }
        return  BaseResult.error();

    }

    /**
     * 状态更新
     */
    public  BaseResult updateStateService(Video video){
        if(null!=video.getId()&&null!=video.getState()){
           int result= videoMapper.updateState(video);
           return  result>0? BaseResult.success():BaseResult.error();
        }
        return  BaseResult.error();

    }

    /**
     * 查询转态为启用的视频
     */
    public  BaseResult queryInfoListByStateService(){
        List<Video> list= videoMapper.queryInfoListByState();
        return  BaseResult.ok(list);
    }

}
