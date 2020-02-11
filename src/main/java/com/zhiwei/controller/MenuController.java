package com.zhiwei.controller;

import com.zhiwei.po.vo.MenuDao;
import com.zhiwei.po.vo.MenuVo;
import com.zhiwei.po.vo.White;
import com.zhiwei.resultBase.BaseResult;
import com.zhiwei.service.MenuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("/menu")
public class MenuController {

    @Autowired
    private MenuService menuService;

    /**
     * 获取ztree信息
     */
    @RequestMapping("/ztree")
    @ResponseBody
    @White
    public  BaseResult menuZtreeController(Integer userId){
        List<MenuDao> list = menuService.menuZtreeService(userId);

        if (list.size()>0){
            return BaseResult.ok(list);
        }

        return null;
    }


    /**
     * 获取菜单信息
     */
    @RequestMapping("/menuList/{userId}")
    @ResponseBody
    @White
    public  List<MenuVo>  getMenuList(@PathVariable("userId") Integer userId){
        return  menuService.getMenuList(userId);


    }

}
