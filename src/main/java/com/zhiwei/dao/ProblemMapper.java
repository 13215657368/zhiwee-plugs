package com.zhiwei.dao;

import com.zhiwei.po.Problem;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ProblemMapper {

    int insert(Problem record);

    List<Problem> queryList();

    Problem queryById(Integer id);

    Integer update(Problem problem);

    Integer delete(int id);



}