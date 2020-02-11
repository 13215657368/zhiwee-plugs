package com.zhiwei.service;

import com.zhiwei.dao.PermissionUserMapper;
import com.zhiwei.dao.UserMapper;
import com.zhiwei.modle.UserModel;
import com.zhiwei.po.PermissionUser;
import com.zhiwei.po.User;
import com.zhiwei.resultBase.BaseResult;
import com.zhiwei.util.CookieUtil;
import com.zhiwei.util.IdGenerator;
import com.zhiwei.util.Md5Util;
import com.zhiwei.util.UserIDBase64;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.jws.soap.SOAPBinding;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Date;
import java.util.List;


/**
 * Created by jick on 2019/6/28.
 */
@Service
public class UserService {
    @Autowired
    private UserMapper userMapper;

    @Autowired
    private PermissionUserMapper permissionUserMapper;


    /**
     * 通过用户名查询，判断是否账号信息
     */
    public BaseResult login(String username, String password, Integer p, HttpServletRequest request, HttpServletResponse response) {
        //User  user  =userMapper.queryByName(username);
        User u = new User();
        u.setUsername(username);
        u.setState(1);
        User user = userMapper.queryByNameAndState(u);
        //密码加密
        String secPasswd = Md5Util.getMd5WithSalt(password, username);
        if (null == user || !secPasswd.equals(user.getPassword())) {
            return new BaseResult(300, "该账号不存在或密码错误");
        } else {


            /**
             * 用户的账号名称存入session中
             */
            request.getSession().setAttribute("user", user);


            /**
             * 保存密码
             */

            UserModel userModel = new UserModel();
            userModel.setUserIdStr(UserIDBase64.encoderUserID(user.getId()));//存入id加密字符串

            //信息存入cookie
            Cookie userCookie = new Cookie("userIdStr", userModel.getUserIdStr());
            // userCookie.setMaxAge(4*7*24*60*60);
            //是否保存密码
            if (1 == p) {
                userCookie.setMaxAge(1800);
            }
            //设置cookie存取路径
            userCookie.setPath("/");

            //将Cookie加到response中
            response.addCookie(userCookie);

            response.setHeader("userIdStr", userModel.getUserIdStr());
            return new BaseResult(200, "登录成功");

        }

    }

    /**
     * 通过id查用户
     */
    public User queryByIdService(Integer id) {
        return userMapper.queryById(id);
    }

    /**
     * 用户退出
     */
    public void loginOut(HttpServletRequest request, HttpServletResponse response) {
        //清除cookie
        CookieUtil.deleteCookie("userIdStr", request, response);
        //清除session
        request.getSession().removeAttribute("permission");
        request.getSession().removeAttribute("user");
        try {
            response.sendRedirect(request.getContextPath() + "/admin/index");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    /**
     * 密码更新
     */
    public BaseResult updatePasswdService(User user, HttpServletRequest request, HttpServletResponse response) {
        try {
            if (null != user.getPassword() && "" != user.getPassword().trim()) {
                user.setPassword(Md5Util.getMd5WithSalt(user.getPassword(), user.getUsername()));
                int result = userMapper.updateById(user);
                if (result > 0) {
                    //判断是否是修改本账号密码
                    User u = (User) request.getSession().getAttribute("user");
                    if (null != u && u.getId() == user.getId()) {
                        //清除cookie
                        CookieUtil.deleteCookie("userIdStr", request, response);
                        //清除session
                          request.getSession().removeAttribute("user");
                          request.getSession().removeAttribute("permission");
                         // response.sendRedirect(request.getContextPath() + "/admin/index");
                          return    new BaseResult(200,"密码修改成功，请重新登录");
                    }


                    return new BaseResult(200,"密码修改成功");
                }
            }
        } catch (Exception e) {
            e.printStackTrace();

        }

        return BaseResult.error();

    }

    /**
     * @Author: jick
     * @Date: 2019/11/19 10:08
     * 添加用户
     */
    public BaseResult adminAddService(User user) {
        //非空判断
        if (null != user.getUsername().trim() && user.getUsername().length() > 0
                && null != user.getPassword() && user.getPassword().length() > 0
                && 0 != user.getRole() && 0 != user.getSex()
                && null != user.getEmail() && user.getEmail().length() > 0) {

            //查询数据库，判断该用户名是否重复
            User user1 = userMapper.queryByName(user.getUsername());
            if (null != user1) {
                return new BaseResult(203, "用户名已存在！请重新选择");
            }

            //密码加密
            user.setPassword(Md5Util.getMd5WithSalt(user.getPassword(), user.getUsername()));
            user.setCreateTime(new Date());
            user.setState(1);
            user.setRole(user.getRole());

            int result = userMapper.insert(user);

            if (result > 0)
                return BaseResult.success();
        }

        return new BaseResult(204, "添加失败");

    }


    /**
     * @Author: jick
     * @Date: 2019/11/19 11:36
     * 查询用户列表
     */
    public List<User> getUserListService() {
        return userMapper.queryList();
    }


    /**
     * @Author: jick
     * @Date: 2019/11/19 13:48
     * 状态更新
     */
    public BaseResult stateUpdateService(User user) {

        int result = userMapper.update(user);
        return result > 0 ? BaseResult.success() : BaseResult.error();
    }

    /**
     * @Author: jick
     * @Date: 2019/11/19 14:50
     * 用户信息更新
     */
    public BaseResult adminInfoUpdate(User user) {


        //非空判断
        if (null != user.getUsername().trim() && user.getUsername().length() > 0
                && 0 != user.getRole() && 0 != user.getSex()
                && null != user.getEmail() && user.getEmail().length() > 0) {


            //查询数据库，判断该用户名是否重复
            User user1 = userMapper.queryByName(user.getUsername());
            if (null != user1 && user1.getId() != user.getId()) {
                return new BaseResult(203, "用户名已存在！请重新选择");
            }

            //密码加密
            //  if(null !=user.getPassword() && user.getPassword().length()>0)
            //  user.setPassword(Md5Util.getMd5WithSalt(user.getPassword(),user.getUsername()));
            // user.setCreateTime(new Date());
            user.setState(1);
            user.setRole(user.getRole());
            int result = userMapper.updateById(user);


            if (result > 0)
                return BaseResult.success();
        }

        return new BaseResult(204, "更新失败");


    }


    /**
     * @Author: jick
     * @Date: 2019/11/19 16:02
     * 账号删除
     */
    public BaseResult adminDeleteService(Integer id) {
        int result = userMapper.delete(id);

        return result > 0 ? BaseResult.success() : BaseResult.error();


    }


    /**
     * @Author: jick
     * @Date: 2019/11/20 14:55
     * 管理员授权
     */
    public BaseResult adminGrantService(PermissionUser permissionUser) {

        //非空判断

        //将以前的授权记录删除。
        permissionUserMapper.deleteByUserId(permissionUser.getUserId());

        permissionUser.setId(IdGenerator.uuid());
        int result = permissionUserMapper.insert(permissionUser);

        if (result > 0) {
            return BaseResult.success();
        }

        return BaseResult.error();


    }

    /**
     * @Author: jick
     * @Date: 2019/11/20 15:32
     * 根据用户id查询权限关系
     */
    public PermissionUser queryPermissionByUserId(Integer userId) {
        return permissionUserMapper.selectByUserId(userId);
    }


}
