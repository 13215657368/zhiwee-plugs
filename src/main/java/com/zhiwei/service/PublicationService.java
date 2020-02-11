package com.zhiwei.service;

import com.zhiwei.dao.PubinfoMapper;
import com.zhiwei.dao.PublicationMapper;
import com.zhiwei.po.Pubinfo;
import com.zhiwei.po.Publication;
import com.zhiwei.po.vo.PublicationResult;
import com.zhiwei.resultBase.BaseResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by jick on 2019/6/27.
 */
@Service
public class PublicationService {
    @Autowired
    private PublicationMapper publicationMapper;

    @Autowired
    private PubinfoMapper pubinfoMapper;

    @Autowired
    private  FileUploadService fileUploadService;

    /**
     * 刊物添加
     * @param publication
     * @return
     */
    public BaseResult  publicationAddService(Publication publication){
        if(null!=publication.getTitle()&&""!=publication.getTitle()&&
                null!=publication.getImg()&&""!=publication.getImg()){
            int result = publicationMapper.insert(publication);
            if(result>0){
                return BaseResult.success();
            }
        }
        return BaseResult.error();

    }

    /**
     * 刊物列表
     * @return
     */
    public List<Publication>  queryListService(){
        return  publicationMapper.queryList();
    }

    /**
     * 根据id删除
     */
    public  int   deleteService(Integer id){
        if(null!=id) {
            int result = publicationMapper.delete(id);
             return  result;
        }
        return  0;
    }

    /**
     * 通关关键字查询
     */
    public List<Publication> queryPubByWordsService(String title){
        return  publicationMapper.queryPubByWords(title);

    }

    /**
     * 刊物内容图片存入数据库
     */
    public  BaseResult  pubContentSaveService(Pubinfo pubinfo){
        //非空判断
        if(null==pubinfo.getUrl()||""==pubinfo.getUrl().trim()||
          null==pubinfo.getPnumber()||""==pubinfo.getPnumber().trim()){
            return  new BaseResult(400,"信息完整");
        }

        //首先先根据pagenum和pnumber查询数据库判断有没有对应的版块。如果有则更新，否则直接添加
        Pubinfo  p = pubinfoMapper.queryUrlByNumAndPageNum(pubinfo);
        int result =0;
        if(p!=null){
            fileUploadService.fileDelete(p.getUrl());//删除原来服务上的文件
            p.setUrl(pubinfo.getUrl());
           result=   pubinfoMapper.update(p);
        }else {
            //信息入库
            // pubinfo.setPagenum(0);
             result =  pubinfoMapper.insert(pubinfo);
        }


        if (result>0){
            return  BaseResult.success();
        }
        return BaseResult.error();


    }

    /**
     * 刊物主题图片，和刊物内容图片展示
     *
     */
    public PublicationResult  imgUrlInfoService(String number){

            PublicationResult  p =  new PublicationResult();

           // Publication publication =  publicationMapper.queryUrlByNum(number);

            List<String>  pubinfos = pubinfoMapper.queryUrlByNum(number);

           // p.setImgUrl(publication.getImg());
            p.setContentUrl(pubinfos);

            return   p;
    }



    /**
     * 对应内容图片删除，删除数据库里面地数据
     */
       public   BaseResult  contentImgDel(String url){

           Boolean   b = fileUploadService.fileDelete(url);

           if(null!=url||""!=url.trim()){
               int result = pubinfoMapper.deleteByUrl(url);
               if(result>0||b==true){
                   return BaseResult.success();
               }

           }
           return BaseResult.error();


       }

    /**
     * 删除标题图片
     */
    public BaseResult titleImgDel(Publication publication){
        //删除服务器上的图图片
        Boolean b  = fileUploadService.fileDelete(publication.getImg());

        //更新数据库
        publication.setImg("");
        int result = publicationMapper.updateById(publication);

        if(b==true&&result>0){
            return  BaseResult.success();
        }else {
            return BaseResult.error();
        }


    }

    /**
     * 数据库新信息更新
     */
    public BaseResult  updateService(Publication publication){

        if(null!=publication.getImg()&&""!=publication.getImg().trim()
                &&null!=publication.getTitle()&&""!=publication.getTitle().trim()
                &&null!=publication.getNumber()&&""!=publication.getNumber().trim()){
            int result =  publicationMapper.updateById(publication);

            if(result>0){
                return  BaseResult.success();
            }

        }

        return BaseResult.error();



    }


    /**
     * 通过id查询信息
     */
    public  Publication queryByIdService(Integer id){
        return  publicationMapper.queryById(id);

    }


    /**
     * 同意pnumber删除pubInfo表里面的数据
     */
    public int  contentImgDelBynum(String number){
        return  pubinfoMapper.deleteByNum(number);
    }


    /**
     * 刊物类容展示
     */
    public List<String>  queryUrlByNumService(String number){
        return   pubinfoMapper.queryUrlByNum(number);

    }



}
