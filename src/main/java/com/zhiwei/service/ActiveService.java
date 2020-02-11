package com.zhiwei.service;

import com.zhiwei.dao.ActiveimgMapper;
import com.zhiwei.dao.ActivityMapper;
import com.zhiwei.po.Activeimg;
import com.zhiwei.po.Activity;
import com.zhiwei.resultBase.BaseResult;
import javafx.beans.property.BooleanProperty;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by jick on 2019/6/26.
 */
@Service
public class ActiveService {
    @Autowired
    private ActiveimgMapper   activeimgMapper;

    @Autowired
    private ActivityMapper  activityMapper;

    @Autowired
    private   FileUploadService  fileUploadService;


    /**
     * 图片入库
     */
     public   BaseResult  acticeImgSaveService(Activeimg activeimg){

         if(null!=activeimg.getAcid()&&null!=activeimg.getUrl()&&""!=activeimg.getUrl().trim()){
             int  result = activeimgMapper.insert(activeimg);
             if(result>0){
                 return BaseResult.success();
             }
         }
         return BaseResult.error();
     }

    /**
     * 活动信息入库
     */
    public   BaseResult   activeSaveService(Activity activity){
        if(null!=activity.getId()&&null!=activity.getTitle()&&""!=activity.getTitle()){
              int   result= activityMapper.insert(activity);
              if(result>0){
                  return BaseResult.success();
              }
        }
        return BaseResult.error();

    }

    /**
     * 展示活动信息列表
     */
    public List<Activity> activeListService(){
        return activityMapper.queryActive();
    }

    /**
     * 通过id查询活动信息
     */
    public Activity  queryActityByIdService(String id){
        return  activityMapper.queryById(id);
    }

    /**
     * 通过acid查询activeimg表中的url
     */
    public List<Activeimg>  queryImgByacidService(String acid){
        return   activeimgMapper.queryByacid(acid);
    }

    /**
     * 根据主键删除active表中的url
     */
    public int  deleteByIdService(Integer id){
        return  activeimgMapper.deleteById(id);
    }

    /**
     * 根据id更新active表中的信息
     */
    public  BaseResult updateByIdService(Activity activity){
        int result= activityMapper.updateById(activity);
        if(result>0){
            return BaseResult.success();
        }
        return BaseResult.error();

    }
    /**
     * 根据acid删除activeimg表中的url
     */
    public int  deleteByAcidService(String id){
        return  activeimgMapper.deleteByAcid(id);
    }
    /**
     * 根据id删除active表中信息
     */
    public int  deleteInfoByIdService(String id){
        return  activityMapper.deleteById(id);
    }

    /**
     * 更具类型查询信息
     */
    public   List<Activity> queryActiveByTypeService(Integer type){
        List<Activity>  list  = activityMapper.queryActiveByType(type);

        for (Activity  ac : list){
            if(null !=ac.getTitleimg() && "" != ac.getTitleimg().trim()){
                ac.setTitleimg(ac.getTitleimg().split(",")[0]);
            }else{
                ac.setTitleimg("http://www.ah-gree.com/uploadfile/nopic.gif");
            }

        }
        return   list;

    }


    /**
     * 通过关键字查询
     */
    public  List<Activity>  queryActiveByWordsService(String title){
        return   activityMapper.queryActiveByWords(title);

    }


    /**
     *
     * 通过url删除数据库里面的数据
     */
    public BaseResult deleteByUrlService(String url){
        //首先删除服务器上的数据
          boolean b = fileUploadService.fileDelete(url);
          //删除服务器上的数据
          int result =  activeimgMapper.deleteByUrl(url);

          if(b==true &&  result>0){
              return     BaseResult.success();
          }else {
              return   BaseResult.error();
          }

    }
}
