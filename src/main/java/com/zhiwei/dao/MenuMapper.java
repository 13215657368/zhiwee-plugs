package com.zhiwei.dao;

import com.zhiwei.po.Menu;
import com.zhiwei.po.vo.MenuDao;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public interface MenuMapper {

    List<MenuDao> queryMenuList(Integer userId);

    List<Menu>  queryByParentId(Map<String,Object> param);

    List<Menu> queryRootMenu(Map<String,Object> param);



}
