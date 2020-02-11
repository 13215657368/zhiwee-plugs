package com.zhiwei.dao;

import com.zhiwei.po.BackgroundImg;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface BackgroundImgMapper {

    List<BackgroundImg> getList();

    int deleteById(Integer id);

    BackgroundImg getInfo(Integer id);

    int addBackgroundImg(BackgroundImg backgroundImg);

    int update(BackgroundImg backgroundImg);

    int updateByUrl(@Param("imgUrl") String imgUrl);

    int checkByType(Integer type);

    BackgroundImg checkByDealerType(Integer dealerType);

    List<BackgroundImg>  queryListByDealerType(Integer dealerType);

    BackgroundImg queryAirBackground();



}
