package com.zhiwei.controller;

import com.sun.org.apache.xpath.internal.operations.Mod;
import com.zhiwei.base.BaseController;
import com.zhiwei.dao.UserMapper;
import com.zhiwei.po.PermissionUser;
import com.zhiwei.po.User;
import com.zhiwei.po.vo.RequestPermission;
import com.zhiwei.po.vo.White;
import com.zhiwei.resultBase.BaseResult;
import com.zhiwei.service.UserService;
import com.zhiwei.util.IdGenerator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.jws.WebParam;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * Created by jick on 2019/6/28.
 */
@Controller
@RequestMapping("/admin")
public class UserController extends BaseController {
    @Autowired
    private UserService userService;


    @RequestMapping("/index")
    public  String    index(){
        return    "login";
    }



    @RequestMapping("/login")
    @ResponseBody
    public BaseResult  login(User user,Integer p, HttpServletRequest  request, HttpServletResponse response){

        System.out.println(p);
        return  userService.login(user.getUsername(),user.getPassword(),p, request,response);
    }

    @RequestMapping("/logout")
    @ResponseBody
    public void  logout( HttpServletRequest  request, HttpServletResponse response){
        userService.loginOut(request,response);
    }



    /**
     * @Author: jick
     * @Date: 2019/11/24 19:10
     * 密码更新
     */
    @RequestMapping("/updatePwd")
    @ResponseBody
    public  BaseResult   updatePassword(User user,HttpServletRequest request,HttpServletResponse response){
        return    userService.updatePasswdService(user,request,response);
    }






    /**
     * @Author: jick
     * @Date: 2019/11/19 9:33
     * 跳转到管理员添加页面
     */
    @RequestPermission
    @RequestMapping("/addPage")
    public  String  adminAddPageController(){
        return  "admin-add";

    }


    /**
     * @Author: jick
     * @Date: 2019/11/19 10:19
     * 添加新的用户
     */
    @RequestMapping("/add")
    @ResponseBody
    public   BaseResult  adminAddController(User user){
       return   userService.adminAddService(user);
    }



    /**
     * @Author: jick
     * @Date: 2019/11/19 11:38
     * 获取用户列表
     */
    @RequestPermission
    @RequestMapping("/list")
    //@ResponseBody
    public String  userListController(Model  model){
         List<User> users = userService.getUserListService();
         model.addAttribute("list",users);
        return    "admin-list";
    }


    /**
     * @Author: jick
     * @Date: 2019/11/19 13:51
     * 状态更新
     */
    @RequestMapping("/state")
    @ResponseBody
    public  BaseResult  stateUpdateController(User user){
         return  userService.stateUpdateService(user);
    }

    /**
     * @Author: jick
     * @Date: 2019/11/19 14:16
     * 跳转到编辑页面
     */
    @RequestPermission
    @RequestMapping(value = "/editPage/{id}")
    public String   editPage(Model  model,@PathVariable("id") Integer id){
        User  user  =   userService.queryByIdService(id);
        model.addAttribute("user",user);
        return     "admin-edit";

    }


    /**
     * @Author: jick
     * @Date: 2019/11/19 15:02
     * 更新操作
     */
    @RequestMapping("/update")
    @ResponseBody
    public  BaseResult infoUpdate(User user){
        return  userService.adminInfoUpdate(user);
    }


    /**
     * @Author: jick
     * @Date: 2019/11/19 16:05
     * 账号删除
     */
    @RequestMapping("/delete")
    @ResponseBody
    public  BaseResult adminDeleteController(Integer id){
       return   userService.adminDeleteService(id);
    }


    /**
     * @Author: jick
     * @Date: 2019/11/19 16:56
     * 跳转到角色授权界面
     */
    @RequestMapping("/permissionPage")
      public String  permissionPage(Model model,  String username){

        if(!"-".equals(username)){
            model.addAttribute("username",username.split("-")[0]);
            model.addAttribute("id",username.split("-")[1]);
            if(null != userService.queryPermissionByUserId(Integer.parseInt(username.split("-")[1]))){
                model.addAttribute("pcode",userService.queryPermissionByUserId(Integer.parseInt(username.split("-")[1])).getpCode());
            }else{
                model.addAttribute("pcode","null");
            }

        }else {
            model.addAttribute("username","请选择管理员");
            model.addAttribute("id",null);
            model.addAttribute("pcode","null");

        }

        return  "permission-add";
    }


    /**
     * @Author: jick
     * @Date: 2019/11/20 15:02
     * 角色授权
     */
    @RequestMapping("/grant")
    @ResponseBody
    public   BaseResult  adminGrantController(PermissionUser  permissionUser){
        return    userService.adminGrantService(permissionUser);

    }





    /**
     * @Author: jick
     * @Date: 2019/11/22 14:51
     * 跳转到修改密码页面
     */
    @RequestMapping(value = "/changPwdPage/{id}")
    public  String    changePassword(Model model,@PathVariable("id") String id){
        if(null !=id &&  id.length()>0){
            String[]  info =  id.split("-");
            model.addAttribute("id",info[0]);
            model.addAttribute("username",info[1]);
        }

       return    "change-password";
    }



}
