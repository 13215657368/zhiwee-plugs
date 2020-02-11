package com.zhiwei.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by jick on 2019/6/26.
 */

@Controller
public class Test  {


    @RequestMapping("/test")
    public String test(){
        //D:\IdeaProjects\day06\CompanyWebPage\src\main\webapp\WEB-INF\view\index.ftl
        //D:\IdeaProjects\day06\CompanyWebPage\src\main\webapp\WEB-INF\view\portal\index.ftl
        return  "portal/index";
    }


}
