package com.zhiwei.dao;

import com.zhiwei.po.Productclassify;
import org.apache.ibatis.annotations.Param;
import org.apache.poi.common.usermodel.LineStyle;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ProductclassifyMapper {

    int insert(Productclassify record);

    List<Productclassify> queryByType(@Param("type") String type);

    List<Productclassify> queryByParentId(Integer parentId);

    List<Productclassify> queryList();

     Productclassify queryById(Integer id);

      int delete(Integer id);

      int update(Productclassify productclassify);

      List<Productclassify>  queryByRootIdAndType(Productclassify record);






}