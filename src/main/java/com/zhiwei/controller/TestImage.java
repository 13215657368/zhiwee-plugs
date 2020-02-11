package com.zhiwei.controller;

import com.zhiwei.base.BaseController;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;
import java.awt.*;
import java.io.File;
import java.io.IOException;
import java.util.UUID;

/**
 * Created by jick on 2019/6/18.
 */
@Controller
@RequestMapping("/image")
public class TestImage  extends BaseController {

    @RequestMapping("/index")
    public   String  imageIndex(){
        return   "TestImg";
    }

    /**
     * 功能描述: <br>
     * 〈文件上传〉
     *
     * @ClassName: UploadController
     * @Author: hf
     * @Version: 1.0.0
     * @Date: 2019/02/14 9:55
     * @Param: [session 获取文件夹绝对路径, file 上传的文件]
     * @return: java.lang.Object
     *
     */
    @RequestMapping(value = "/upload", method = RequestMethod.POST, produces = "text/html;charset=utf-8")
    public Object upload(HttpSession session, @RequestParam("uploadFile") MultipartFile file) {
        //标识是否上传成功
        boolean bool = false;
        //获取要上传的目标文件夹绝对路径、webapp下
        ServletContext context = session.getServletContext();
        String realPath = context.getRealPath("/upload");


        //重新定义文件名、避免名称重复
        String fileName = UUID.randomUUID().toString().replace("-", "").substring(0, 15) + "_file_" + file.getOriginalFilename();
        try {
            //上传文件至指定位置
            file.transferTo(new File(realPath + "/" + fileName));
            bool=true;
        } catch (IOException e) {
            e.printStackTrace();
        }
        return bool ? "success" : "fail";
    }

}
