package com.zhiwei.dao;

import com.zhiwei.po.Companyculture;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface CompanycultureMapper {
    int insert(Companyculture record);

    List<Companyculture> queryInfo();

    Companyculture  queryInfoById(Integer id);
    int   update(Companyculture companyculture);

    int delete(Integer id);

}