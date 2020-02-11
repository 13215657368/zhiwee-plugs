package com.zhiwei.base;

import org.springframework.web.bind.annotation.ModelAttribute;

import javax.servlet.http.HttpServletRequest;

/**
 * Created by jick on 2019/3/10.
 */

public class BaseController {

    @ModelAttribute
    public   void   preHandle(HttpServletRequest  request){
        request.setAttribute("ctx",request.getContextPath());////获取当前服务器路径
    }




}
