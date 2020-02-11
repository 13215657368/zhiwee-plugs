package com.zhiwei.dao;

import com.zhiwei.po.Conditioner;
import com.zhiwei.po.vo.ConditionerVo;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ConditionerMapper {

    int insert(Conditioner conditioner);

    List<Conditioner> queryAirList();

    Conditioner  queryAirInfoById(@Param("id") String id);

    Integer update(Conditioner conditioner);

    Integer delete(@Param("id") String id);

    int deleteBatch(String[] ids);

     Conditioner queryAirInfoByCompanyName(@Param("companyName") String companyName);

     List<Conditioner>  queryPortalList(ConditionerVo  conditionerVo);




}