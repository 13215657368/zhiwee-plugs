package com.zhiwei.controller;


import com.zhiwei.base.BaseController;
import com.zhiwei.po.vo.SystemLogs;
import com.zhiwei.util.LoginUserUtil;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;


/**
 * Created by jick on 2019/5/30.
 */
@Controller
public class Index extends BaseController {


    @SystemLogs
    @RequestMapping("/index")
    public  String   index(HttpServletRequest request){
        //从cookie中获取userId
        Integer   userId  = LoginUserUtil.releaseUserIdFromCookie(request);
        return "index";

    }
    @RequestMapping("/")
    public  String   login(HttpServletRequest request){
         //从cookie中获取userId
        Integer   userId  = LoginUserUtil.releaseUserIdFromCookie(request);

        return "index";

    }









   /* @RequestMapping("/ok")
     //@ResponseBody
    public  String  query(Model model){
         List<user> u = qu.queryUser();
      //   int j =1/0;

         for(int i=0;i<u.size();i++) {
             System.out.println(u.get(i));
         }
         model.addAttribute("info",u);

         return "/WEB-INF/index.ftl";
    }

    @RequestMapping(value = "/{id}")
    //@ResponseBody
    public   String   queryById(@PathVariable Integer id,Model model){



        user  u =  qu.queryUserById(id);

        model.addAttribute("user",u);

        return "/WEB-INF/index.ftl";
    }
*/




}
