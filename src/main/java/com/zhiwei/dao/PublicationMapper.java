package com.zhiwei.dao;

import com.zhiwei.po.Publication;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface PublicationMapper {

    int insert(Publication publication);
    List<Publication> queryList();
    int  delete(Integer id);
    List<Publication> queryPubByWords(@Param("title") String title);
    Publication queryUrlByNum(@Param("number") String number);
    Publication queryById(Integer id);
    Integer updateById(Publication publication);





}