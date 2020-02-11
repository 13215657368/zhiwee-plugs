package com.zhiwei.dao;

import com.zhiwei.po.News;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.PathVariable;

import java.util.List;

@Repository
public interface NewsMapper {
    int insert(News news);
    News queryByNum(News news);
    List<News> queryNewsList();
    News queryNewsById(Integer id);
    int deleteByNum(String number);
    int  updateByNum(News news);
    List<News> queryNewsByType(Integer type);
    List<News> queryNewsByWords(@Param("title") String title);//@Param("userPwd")
    List<News> queryNewsByDate(News news);



    
}