package com.zhiwei.service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.sun.org.apache.bcel.internal.generic.NEW;
import com.zhiwei.dao.NewsMapper;
import com.zhiwei.dao.NewsimgeMapper;
import com.zhiwei.po.News;
import com.zhiwei.po.Newsimge;
import com.zhiwei.resultBase.BaseResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by jick on 2019/6/18.
 */
@Service
public class NewsService {

    @Autowired
    private NewsMapper  newsMapper;


    @Autowired
    private NewsimgeMapper   newsimgeMapper;

    @Autowired
    private    FileUploadService  fileUploadService;


    /**
     * 调用insert插入方法
     */


    public BaseResult  newsSaveService(News  news){
        //非空判断
        if(news.getTitle()!=null&&news.getDate()!=null&&news.getType()!=0 &&news.getContent()!=null&&news.getNumber()!=null
                &&news.getTitle().length()>0&&news.getContent().length()>0&&news.getNumber().length()>0){
           int  result =   newsMapper.insert(news);

           if(result>0){
               return BaseResult.success();
           }
        }
            return    BaseResult.error();
    }


    /**
     * 通过编号查询新闻，判断是否重复
     */
    public   BaseResult  queryNewsByNumService(News news){
        if(null!=news.getNumber()){
            News  result =  newsMapper.queryByNum(news);
            System.out.println(result);
            //如果值大于0.说明该编号的新闻已存在
            if (null!=result){
                return BaseResult.error();
            }

        }
        return   BaseResult.success();

    }


    /**
     * 新闻图片信息存入之数据库
     */
    public    BaseResult  saveNewsImg(Newsimge newsimge){


        //判读是否插入成功，给出反馈
        if(newsimge.getImgurl()!=null&&newsimge.getImgurl().trim()!=""
                &&null!=newsimge.getArtnum()&&""!=newsimge.getArtnum()) {


            String[]  strs =  newsimge.getImgurl().split(",");
            for(String  str :  strs){
                newsimge.setImgurl(str);
                //调用图片插入函数
                int  result  =  newsimgeMapper.insert(newsimge);
                if (result ==0) {
                    return BaseResult.success();
                }

            }
            return   BaseResult.success();
        }
        return BaseResult.error();

    }


    /**
     * 新闻图片信息删除
     */
    public  int  newsImgDel(String artnum){

            int  result  =  newsimgeMapper.delete(artnum);
           return  result;

    }
    public   BaseResult  deleteImgByUrlService(String pathName){
               if(null !=pathName && "" != pathName.trim()){
                   //删除服务器上的图片
                   boolean   b =   fileUploadService.fileDelete(pathName);
                    //删除数据库里面的图片
                   int  result = newsimgeMapper.deleteByUrl(pathName);

                   if(b==true &&  result>0){
                       return   BaseResult.success();
                   }
               }
               return   BaseResult.error();
    }



    /**返回新闻列表
     */

    public  List<News>  newsListService(){
        //调用接口
         List<News>  list = newsMapper.queryNewsList();
        //字符串切割，重新设置url
        for (News  n : list){
            if(null !=n.getUrl() && "" != n.getUrl().trim()){
                n.setUrl(n.getUrl().split(",")[0]);
            }else {
                n.setUrl("http://www.ah-gree.com:8811/gree.jpg");
            }
        }
        return   list;

    }

    /**
     * 通过id新闻信息
     */
    public   News queryNewsByIdService(Integer id){

           if (null!=id) {
               return newsMapper.queryNewsById(id);
           }else{
               return null;
           }

    }

    /**
     * 通过id删除新闻信息
     */
    public   int delByNumService(String  number){

        //判断numbershi是否为空
        if (null!=number&&number.length()>0){
            //调用删除接口
            int result1   =  newsMapper.deleteByNum(number);//删除news表中的新闻信息
            return result1;
           /* if(result1>0){
                return BaseResult.success();
            }*/
        }
        return 0;


    }

    /**
     * 通过num查询url
     */
     public List<Newsimge> queryUrlByNum(String artnum){
         if(null!=artnum){
             return   newsimgeMapper.queryUrlByNum(artnum);
         }
         return  null;
     }

    /**
     * 新闻信息更新
     */
    public  BaseResult newsUpdateService(News news){
        //非空判断
        if(news.getTitle()!=null&&news.getType()!=0 &&news.getContent()!=null&&news.getNumber()!=null
                &&news.getTitle().length()>0&&news.getContent().length()>0&&news.getNumber().length()>0){
            int   result =  newsMapper.updateByNum(news);
            if(result>0){
                return   BaseResult.success();
            }
        }

        return BaseResult.error();
    }

    /**
     * 新闻图片信息更新
     */
    public  BaseResult newsImgUpdateService(Newsimge  newsimge){
        int   result =  newsimgeMapper.updateByNum(newsimge);
        if(result>0){
            BaseResult.success();
        }
        return BaseResult.error();
    }

    /**
     * 通过逐渐删除图片
     */

    public  int  newsImgDelById(Integer id){


        int  result  =  newsimgeMapper.deleteById(id);
        return  result;

    }

    /**********************************************
     * 前台页面
     */
    public  List<News>  queryNewsByTypeService(Integer  type){
        List<News> list    =   newsMapper.queryNewsByType(type);

        //字符串切割，重新设置url
        for (News  n : list){
            if(null !=n.getUrl() && "" != n.getUrl().trim()){
                n.setUrl(n.getUrl().split(",")[0]);
            }else {
                n.setUrl("http://www.ah-gree.com:8811/gree.jpg");
            }
        }

        return   list;

    }

    /**通过关键字查询新闻
     *
     */
    public  List<News>  queryNewsByWordsService(String title){
        return  newsMapper.queryNewsByWords(title);
    }


    /**
     * 更具时间查询
     */
     public  BaseResult  queryNewsByDateService(int pageNo,News  news){

         List<News>  list  =  newsMapper.queryNewsByDate(news);

         //字符串切割，重新设置url
         for (News  n : list){
             if(null !=n.getUrl() && "" != n.getUrl().trim()){
                 n.setUrl(n.getUrl().split(",")[0]);
             }else {
                 n.setUrl("http://www.ah-gree.com:8811/gree.jpg");
             }
         }

         int pageSize = 8;
         PageHelper.startPage(pageNo, pageSize);
         PageInfo<News> pageInfo = new PageInfo<News>(list);
         BaseResult  result =    BaseResult.success(pageInfo);
         return   result;

    }

}
