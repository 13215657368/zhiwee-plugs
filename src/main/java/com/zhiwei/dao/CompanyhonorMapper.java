package com.zhiwei.dao;

import com.zhiwei.po.Companyhonor;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface CompanyhonorMapper {

    int insert(Companyhonor record);

    List<Companyhonor> queryInfo();

    int update(Companyhonor record);

    Companyhonor queryInfoById(Integer id);

    int delete(Integer id);

}