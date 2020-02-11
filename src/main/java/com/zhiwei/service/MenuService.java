package com.zhiwei.service;

import com.zhiwei.dao.MenuMapper;
import com.zhiwei.po.Menu;
import com.zhiwei.po.vo.MenuDao;
import com.zhiwei.po.vo.MenuVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class MenuService {
    @Autowired
    private MenuMapper  menuMapper;


    /**
     * ztree信息
     */
    public List<MenuDao> menuZtreeService(Integer userId){
        return menuMapper.queryMenuList(userId);

    }


    /**
     * 获取菜单信息
     */
    public List<MenuVo>  getMenuList(Integer userId){
        //获取顶级菜单
        Map<String,Object> param = new HashMap<>();
        param.put("userId",userId);
        param.put("parentId",0);
        List<Menu> rootMenu =  menuMapper.queryRootMenu(param);

        List<MenuVo> list = new ArrayList<>();

        //根据父级目录查询子目录
        for(Menu m : rootMenu){
            MenuVo  menuVo =  new MenuVo();
            menuVo.setParent(m);
            Map<String,Object> param2 = new HashMap<>();
            param2.put("parentId",m.getId());
            param2.put("userId",userId);
            List<Menu>  childList =  menuMapper.queryByParentId(param2);
            menuVo.setChirldList(childList);
            list.add(menuVo);
        }

        return  list;

    }


}
