package com.zhiwei.dao;

import com.zhiwei.po.Business;
import com.zhiwei.po.vo.BusinessResult;
import com.zhiwei.po.vo.BusinessVo;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface BusinessMapper {
    int insert(Business business);
    List<Business> queryBusinessList();
    int deleteById(@Param(value="id") String id);
    int deleteBatch(String[] ids);
    Business queryBusinessById(@Param(value="id") String id);
    int update(Business business);
    int insertBatch(List<Business> list);
    List<Business> queryPortalList(BusinessVo businessVo);
  /*  Integer queryBusinessByNum(@Param("authNum") String authNum);*/
    BusinessResult queryCentifyInfoById(@Param(value="id") String id);
    BusinessResult queryAirCentifyInfoById(@Param(value="id") String id);

      Business queryByAuthNum(@Param(value = "authNum") String authNum);

    Integer updateByAuthNum(Business business);


    //批量插入
    Integer insertInfoBranch(List<Business> list);







}