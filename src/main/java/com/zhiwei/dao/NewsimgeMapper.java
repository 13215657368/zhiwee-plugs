package com.zhiwei.dao;

import com.zhiwei.po.Newsimge;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface NewsimgeMapper {

    int insert(Newsimge newsimge);
    int   delete(String artnum);
    List<Newsimge> queryUrlByNum(String artnum);
    int  updateByNum(Newsimge newsimge);
    int  deleteById(Integer id);
    int  deleteByUrl(@Param("imgurl") String  imgurl);
    List<Newsimge> select();



}