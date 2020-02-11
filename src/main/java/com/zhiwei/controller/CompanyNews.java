package com.zhiwei.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.sun.org.apache.bcel.internal.generic.NEW;
import com.zhiwei.base.BaseController;
import com.zhiwei.dao.NewsimgeMapper;
import com.zhiwei.po.News;
import com.zhiwei.po.Newsimge;
import com.zhiwei.po.vo.Content;
import com.zhiwei.po.vo.NewsVo;
import com.zhiwei.po.vo.RequestPermission;
import com.zhiwei.po.vo.White;
import com.zhiwei.resultBase.BaseResult;
import com.zhiwei.service.FileUploadService;
import com.zhiwei.service.NewsService;;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * Created by jick on 2019/6/12.
 */
@Controller
@RequestMapping("/news")
public class CompanyNews extends BaseController {

    @Autowired
    private NewsService  newsService;
    @Autowired
    private NewsimgeMapper  newsimgeMapper;

    @Autowired
    private FileUploadService fileUploadService;

    /**
     * 新闻列表展示
     */
    @RequestPermission(permissionCode = "002")
    @RequestMapping("/list")
    public String   newsList(Model model){
        List<News> n =  newsService.newsListService();
        model.addAttribute("news",n);
        return   "article-list";
    }





    /**
     * 跳转至新闻增加
     * @return
     */
    @RequestPermission(permissionCode = "002")
    @RequestMapping("/add")
     public  String  newsAdd(Model model,Integer id,String artnum){
         return   "article-add";
    }


    /**
     * 用来做信息回显
     */
    @RequestPermission(permissionCode = "002")
    @RequestMapping("/detail")
    public   String   showDetail(Model model,Integer id,String artnum){
        News  news=newsService.queryNewsByIdService(id);  //查询news表中的新闻信息
        List<Newsimge>  imgs =  newsService.queryUrlByNum(artnum);//查询news表中的新闻信息
        model.addAttribute("newsinfo",news);
        model.addAttribute("imgsinfo",imgs);
        return  "article-edit";
    }

    /**
     * 新闻信息录入数据库
     */
    @RequestMapping("/add/article")
    @ResponseBody
    public BaseResult addToArticleBase(News  news){
       // News  news1  =  new News();
        String   str="";
        if(news.getIntroduction().length()>83){
           str = news.getIntroduction().substring(0,80);
        }

        Date  date = new Date();
        news.setDate(date);
        news.setIntroduction(str);
        BaseResult   result =  newsService.newsSaveService(news);
        return result;

    }

    /**
     * 通过编号查新闻，判断是否已经存在
     */
    @RequestMapping("/queryByNum")
    @ResponseBody
    public  BaseResult  queryNewsByNum(News news){
         BaseResult result = newsService.queryNewsByNumService(news);
         return   result;
    }


    /**
     * 图片信息存入数据库
     */
    @RequestMapping("/img/add")
    @ResponseBody
    public  BaseResult  addNewsImgToBase(Newsimge  newsimge){
        BaseResult result=newsService.saveNewsImg(newsimge);
         return  result;
    }


    /**
     * 图片信息删除
     */
    @RequestMapping("/img/delete")
    @ResponseBody
    public   BaseResult  delNewsImg(String artnum,String pathName){
        return   newsService.deleteImgByUrlService(pathName);
    }


    /**
     * 图片信息删除(通过主键)
     */
    @RequestMapping("/img/deleteById")
    @ResponseBody
    public   BaseResult  delNewsImgById(Integer id,String pathName){
        //&&null!=pathName&&pathName.length()>0    boolean flag = fileUploadService.fileDelete(pathName);
        int result=0;
        boolean flag=false;
        if(null!=id) {
            result = newsService.newsImgDelById(id);
        }
        if(null!=pathName&&pathName.length()>0) {
            flag = fileUploadService.fileDelete(pathName);
        }

        if(result>0&&flag){
            return BaseResult.success();
        }else{
            return  BaseResult.error();
        }


    }


    /**
     *跳转到展示文章类容
     */
    @RequestPermission(permissionCode = "002")
      @RequestMapping("/show/contentPage")
    public  String  newsShowContentPage(Model model,Integer id){
        //  News news =  newsService.queryNewsByIdService(id);
          model.addAttribute("id",id);
          return  "article-show";
      }
    @RequestMapping("/show/content")
    @ResponseBody
    public  News  newsShowContent(Integer id){
        News news =  newsService.queryNewsByIdService(id);
        return    news;
    }

    /**
     * 删除新闻信息
     */
    @RequestMapping("/newsDel")
    @ResponseBody
    public BaseResult  newDelete(String number){
        int result1= newsService.delByNumService(number);//调用删除news表中信息的方法

        /**
         * 删除服务器上对应的图片信息和newsimg表中的信息
         */
        List<Newsimge>  newsImg =  newsService.queryUrlByNum(number);
        if(newsImg.size()>0){
            int result2   =  newsimgeMapper.delete(number);//删除newsImg表中的信息
            for(int i=0;i<newsImg.size();i++){
                boolean flag = fileUploadService.fileDelete(newsImg.get(i).getImgurl());
                if(flag==false||result1<=0||result2<=0){
                    return BaseResult.error();
                }
            }
            return  BaseResult.success();
        }
        if(result1>0) {
            return BaseResult.success();
        }
        return  BaseResult.error();
    }


    /**
     * 新闻信息的更新
     */
    @RequestMapping("/update")
    @ResponseBody
    public  BaseResult  newsUpdate(News news){
        String   str = news.getIntroduction().substring(0,80);
      /*  Date  date = new Date();
        news.setDate(date);*/
        news.setIntroduction(str);
        return  newsService.newsUpdateService(news);
    }

    /**
     * 新闻图片信息的更新
     */
    @RequestMapping("/img/update")
    @ResponseBody
    public  BaseResult  newsImgUpdate(Newsimge newsimge){
        return  newsService.newsImgUpdateService(newsimge);
    }


    ///////////////////////////////////////////////////////////////////////////////
    /**
     * 前台页面
     */
    /**
     * 前台新闻列表展示
     */
    @White
    @RequestMapping("/portal/NewsList")
    @ResponseBody
    public   BaseResult  portalNewsList(int  pageNo,Integer type){
   // public BaseResult  portalNewsList(Integer type){
        int pageSize = 4;
        PageHelper.startPage(pageNo, pageSize);
        List<News> list =  newsService.queryNewsByTypeService(type);
        PageInfo page = new PageInfo(list);
        return   BaseResult.success(page);


    }


    /**
     * 测试分页
     * @return
     */
    @RequestMapping("/pagelist")
    @ResponseBody
    @White
    public PageInfo   pagenewsList(Integer  pageNo){
        int pageSize = 5;
        PageHelper.startPage(pageNo, pageSize);  //startPage是告诉拦截器说我要开始分页了。分页参数是这两个。
        List<Newsimge> n =    newsimgeMapper.select();
        PageInfo page = new PageInfo(n);
        return   page;
    }


    /**
     * 前台标题展示
     * @param type
     * @return
     */
    @White
    @RequestMapping("/portal/NewsTitle")
    @ResponseBody
    public List<News> potalNewsTitle(Integer type){
        List<News> list =  newsService.queryNewsByTypeService(type);
        return   list;
    }



    @White
    @RequestMapping("/portal/content")
    @ResponseBody
    public   News  portalNewsShowContent(Integer id){
        News  news=newsService.queryNewsByIdService(id);  //查询news表中的新闻信息
      //  List<Newsimge>  imgs =  newsService.queryUrlByNum(number);//查询news表中的新闻信息
        //News news =  newsService.queryNewsByIdService(id);
      //  Content   content  = new Content();
       // content.setList(imgs);
       // content.setObject(news);
        return   news;
    }

    /**
     * 查询所有新闻信息
     */
    @White
    @RequestMapping("/portal/AllNewsTitle")
    @ResponseBody
    public  List<News> queryAllNewsCtroller(){
        return  newsService.newsListService();
    }


   /* *//**
     * 通过关键字查询新闻
     *//*
    @White
    @RequestMapping("/portal/queryByWord")
    @ResponseBody
    public  BaseResult  queryNewsByWords(String title,int pageNo){
       // return newsService.queryNewsByWordsService(title);
        int pageSize = 6;
        PageHelper.startPage(pageNo, pageSize);
        List<News> list =  newsService.queryNewsByWordsService(title);
        PageInfo<News> pageInfo = new PageInfo<News>(list);
        BaseResult  result =    BaseResult.success(pageInfo);
        return   result;

    }
*/

    /**
     * 根据时间检索
     */
    @RequestMapping("/queryByDate")
    @ResponseBody
    @White
    public  BaseResult  queryNewsByDateController(NewsVo newsVo){
        News  news  = new News();
        news.setType(newsVo.getType());
        news.setDate(newsVo.getDate());
        return   newsService.queryNewsByDateService(newsVo.getPageNo(),news);

    }



}
