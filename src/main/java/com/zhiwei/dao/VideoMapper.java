package com.zhiwei.dao;

import com.zhiwei.po.Video;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface VideoMapper {


    int insert(Video  video);

    List<Video> queryInfoList();

    Video queryById(Integer id);

    int  updateUrl(Integer id);

    int update(Video video);

    int deleteById(Integer id);

    int updateState(Video video);

    List<Video> queryInfoListByState();








}