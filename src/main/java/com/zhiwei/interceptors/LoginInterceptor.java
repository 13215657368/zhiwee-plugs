package com.zhiwei.interceptors;


import com.zhiwei.dao.PermissionUserMapper;
import com.zhiwei.dao.SystemLogMapper;
import com.zhiwei.po.PermissionUser;
import com.zhiwei.po.SystemLog;
import com.zhiwei.po.User;
import com.zhiwei.po.vo.SystemLogs;
import com.zhiwei.po.vo.White;
import com.zhiwei.service.UserService;
import com.zhiwei.util.IdGenerator;
import com.zhiwei.util.LoginUserUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.lang.reflect.Method;
import java.net.InetAddress;
import java.util.Date;

/**
 * Created by jick on 2019/3/10.
 */
public class LoginInterceptor extends HandlerInterceptorAdapter {
    @Autowired
    private UserService userService;

    @Autowired
    private SystemLogMapper   systemLogMapper;


    @Autowired
    private PermissionUserMapper permissionUserMapper;




    @Override
    public boolean preHandle(HttpServletRequest request,
                             HttpServletResponse response,
                             Object handler) throws Exception {
        //判断用户是否登录
        if (handler instanceof HandlerMethod) {
            HandlerMethod handlerMethod = (HandlerMethod) handler;
            Method method = handlerMethod.getMethod();
            boolean flag = method.isAnnotationPresent(White.class);

            boolean  logFlag =  method.isAnnotationPresent(SystemLogs.class);

            if (!flag) {
                Integer userId = LoginUserUtil.releaseUserIdFromCookie(request);

               if (userId == 0) {
                   String header = request.getHeader("userIdStr");
                   if( header != null){
                       userId = Integer.valueOf(request.getHeader("userIdStr"));
                   }

               }
                //   AssertUtil.isNotLogin(null==userId || null==userService.queryById(userId), CrmConstant.USER_NOT_LOGIN_MSG);
                if (0 == userId || null == userService.queryByIdService(userId)) {
                    response.sendRedirect(request.getContextPath() + "/admin/index");
                    return false;
                }

                //获取session，判断session是否为空
                Object  session = request.getSession().getAttribute("permission");
                if(session ==null){
                   //查询数据库，拿到里面的权限码存入到session中
                    request.getSession().setAttribute("permission",permissionUserMapper.selectByUserId(userId));

                }
               // Object  session2 = request.getSession().getAttribute("permission");

                //request.getSession().setAttribute(CrmConstant.USER_PERMISSIONS,permissions);

                //记录日志
                if(logFlag){
                   SystemLog systemLog  =  new  SystemLog();
                    User  user  = (User)request.getSession().getAttribute("user");
                    String remoteAddr=request.getRemoteAddr();

                    systemLog.setId(IdGenerator.uuid());
                    systemLog.setLoginUser(user.getUsername());
                    systemLog.setRemoteIp(remoteAddr);
                    systemLog.setTime(new Date());

                    systemLogMapper.insert(systemLog);




                }



                return true;
            }



            return true;
        }
        response.sendRedirect(request.getContextPath() + "/admin/index");
        return false;

    }
}
