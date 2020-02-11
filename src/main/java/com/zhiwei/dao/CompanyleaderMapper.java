package com.zhiwei.dao;

import com.zhiwei.po.Companyleader;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface CompanyleaderMapper {

    int insert(Companyleader record);
    int update(Companyleader record);
    List<Companyleader> queryInfo();
    Companyleader queryInfoById(Integer id);
    int delete(Integer id);
}