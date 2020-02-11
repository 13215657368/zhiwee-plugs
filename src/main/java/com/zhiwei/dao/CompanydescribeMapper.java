package com.zhiwei.dao;

import com.zhiwei.po.Companydescribe;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface CompanydescribeMapper {

    int insert(Companydescribe companydescribe);

    List<Companydescribe>   queryInfo();

    Companydescribe queryInfoById(Integer id);

    int  update(Companydescribe companydescribe);

    int delete(Integer id);




}