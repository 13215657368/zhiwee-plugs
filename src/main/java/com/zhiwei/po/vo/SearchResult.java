package com.zhiwei.po.vo;

import com.github.pagehelper.PageInfo;
import com.zhiwei.po.*;

/**
 * Created by jick on 2019/7/11.
 */
public class SearchResult {
    PageInfo<News> newsPageInfo;
    PageInfo<ProductVo> proPageInfo;
    PageInfo<Publication> pubPageInfo;
    PageInfo<Shop> shopPageInfo;
    PageInfo<Job> jobPageInfo;
    PageInfo<Activity> activePageInfo;

    public PageInfo<News> getNewsPageInfo() {
        return newsPageInfo;
    }

    public void setNewsPageInfo(PageInfo<News> newsPageInfo) {
        this.newsPageInfo = newsPageInfo;
    }

    public PageInfo<ProductVo> getProPageInfo() {
        return proPageInfo;
    }

    public void setProPageInfo(PageInfo<ProductVo> proPageInfo) {
        this.proPageInfo = proPageInfo;
    }

    public PageInfo<Publication> getPubPageInfo() {
        return pubPageInfo;
    }

    public void setPubPageInfo(PageInfo<Publication> pubPageInfo) {
        this.pubPageInfo = pubPageInfo;
    }

    public PageInfo<Shop> getShopPageInfo() {
        return shopPageInfo;
    }

    public void setShopPageInfo(PageInfo<Shop> shopPageInfo) {
        this.shopPageInfo = shopPageInfo;
    }

    public PageInfo<Job> getJobPageInfo() {
        return jobPageInfo;
    }

    public void setJobPageInfo(PageInfo<Job> jobPageInfo) {
        this.jobPageInfo = jobPageInfo;
    }

    public PageInfo<Activity> getActivePageInfo() {
        return activePageInfo;
    }

    public void setActivePageInfo(PageInfo<Activity> activePageInfo) {
        this.activePageInfo = activePageInfo;
    }
}
