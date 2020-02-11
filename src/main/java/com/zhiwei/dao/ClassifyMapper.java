package com.zhiwei.dao;

import com.zhiwei.po.Classify;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ClassifyMapper {

    List<Classify> getList();

    int deleteById( Integer id);

    Classify getInfo(Integer id);

    int editYES(Integer id);

    int editNO(Integer id);

    int update(Classify classify);

    List<Classify> getAllClassify();
}
