package com.zhiwei.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.zhiwei.base.BaseController;
import com.zhiwei.po.*;
import com.zhiwei.po.vo.ProductVo;
import com.zhiwei.po.vo.SearchResult;
import com.zhiwei.po.vo.White;
import com.zhiwei.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * Created by jick on 2019/7/11.
 */
@Controller
@RequestMapping("/search")
public class SearchController  extends BaseController {

    @Autowired
    private  ProductService productService;
    @Autowired
    private NewsService  newsService;
    @Autowired
    private PublicationService  publicationService;
    @Autowired
    private ShopService  shopService;
    @Autowired
    private  JobService jobService;
    @Autowired
    private  ActiveService activeService;

    /**
     *
     */
    @White
    @RequestMapping("/result")
    @ResponseBody
    public SearchResult search(String words, @RequestParam(defaultValue = "1") Integer pageNo){
        List<News> newsList =  newsService.queryNewsByWordsService(words);
        List<ProductVo>  proList = productService.queryProByWordsService(words);
        List<Publication>  pubList =  publicationService.queryPubByWordsService(words);
        List<Shop>    shopList = shopService.queryShopByWordsService(words);
        List<Job>     jobList =  jobService.queryJobByWordsService(words);
        List<Activity>  acliveList=activeService.queryActiveByWordsService(words);


        //分页包装
        int pageSize = 1;
        PageHelper.startPage(pageNo, pageSize);

        //获取集合
        PageInfo<News> newsPageInfo = new PageInfo<News>(newsList);
        PageInfo<ProductVo>  productPageInfo = new  PageInfo<ProductVo>(proList);
        PageInfo<Publication> publicationPageInfo = new PageInfo<Publication>(pubList);
        PageInfo<Shop> shopPageInfo = new  PageInfo<Shop>(shopList);
        PageInfo<Job> jobPageInfo = new PageInfo<Job>(jobList);
        PageInfo<Activity> activityPageInfo = new  PageInfo<Activity>(acliveList);

        //
        SearchResult  searchResult  = new SearchResult();
        searchResult.setNewsPageInfo(newsPageInfo);
        searchResult.setProPageInfo(productPageInfo);
        searchResult.setPubPageInfo(publicationPageInfo);
        searchResult.setShopPageInfo(shopPageInfo);
        searchResult.setJobPageInfo(jobPageInfo);
        searchResult.setActivePageInfo(activityPageInfo);

        return  searchResult;



    }
}
