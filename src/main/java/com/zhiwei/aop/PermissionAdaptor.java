package com.zhiwei.aop;

import com.zhiwei.exception.ParamsException;
import com.zhiwei.po.PermissionUser;
import com.zhiwei.po.User;
import com.zhiwei.po.vo.RequestPermission;
import com.zhiwei.resultBase.BaseResult;
import com.zhiwei.util.JsonUtil;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.aspectj.lang.reflect.MethodSignature;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import javax.servlet.http.HttpSession;
import java.lang.reflect.Method;

@Component
@Aspect
public class PermissionAdaptor {

  @Autowired
    private HttpSession  session;



  /**
   * @Author: jick
   * @Date: 2019/11/21 13:25
   * 定义切点的注解
   */
  @Pointcut("@annotation(com.zhiwei.po.vo.RequestPermission)")
  public  void   cut(){

  }


  @Around("cut()")
  public  Object   arround(ProceedingJoinPoint pjp)  throws Throwable{
      //获取请求方法的权限码
      MethodSignature methodSignature  = (MethodSignature) pjp.getSignature();
      Method  method =    methodSignature.getMethod();
      RequestPermission requestPermission =  method.getAnnotation(RequestPermission.class);
      String   permissionCode  =  requestPermission.permissionCode();


        //从session中获取用户信息，如果是超级管理员则放行
       User  user  =  (User) session.getAttribute("user");
       if(user.getRole()==1){
           Object   proceed  =  pjp.proceed();
           return    proceed;

       }else {
           //如果不是超级管理员则从session中获取权限吗，判断权限
           PermissionUser permissionUser = ( PermissionUser)session.getAttribute("permission");
           if(permissionUser.getpCode().contains(permissionCode)){
               Object   proceed  =  pjp.proceed();
               return    proceed;

           }else{
               throw  new  ParamsException("没有权限");

           }
       }





  }









}
