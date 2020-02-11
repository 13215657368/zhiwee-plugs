package com.zhiwei.controller;

import com.zhiwei.resultBase.BaseResult;
import com.zhiwei.resultBase.FileResult;
import com.zhiwei.service.FileUploadService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by jick on 2019/3/26.
 */
@Controller
@RequestMapping("/fileUpload")
public class FileUploadController {
    @Autowired
    private FileUploadService fileUploadService;

    @RequestMapping("/save")
    @ResponseBody
    public FileResult fileResult(MultipartFile uploadFile){


       try {
           return   fileUploadService.fileUpload(uploadFile.getOriginalFilename(),uploadFile.getInputStream());

       } catch (IOException e) {
            e.printStackTrace();
        }


        return  null;
    }

    @RequestMapping("/save2")
    @ResponseBody
    public FileResult fileResult2(Model model,@RequestParam("file") MultipartFile file,
                                  HttpServletRequest request, HttpServletResponse response) throws IOException {
        String name = request.getParameter("name");// 文件名称
        InputStream inputStream = file.getInputStream();// ***获取字节流，图片保存在这里,切记这里只可以获取一次。***

           return    fileUploadService.fileUpload(name,inputStream);

    }

    /**
     * 视频上传
     */
    @RequestMapping("/videoSave")
    @ResponseBody
    public FileResult videoUploadController(MultipartFile uploadFile){


        try {

            //return   fileUploadService.fileUpload(uploadFile.getOriginalFilename(),uploadFile.getInputStream());
            return  fileUploadService.videoUpload(uploadFile.getOriginalFilename(),uploadFile.getInputStream());

        } catch (IOException e) {
            e.printStackTrace();
        }


        return  null;
    }




    /**
     * 批量上传
     * @param
     * @return
     */

    @RequestMapping("/save3")
    @ResponseBody
    public List<FileResult> muliFileResult(MultipartFile[] uploadFile){

        List<FileResult> ls  = new ArrayList<>();

        try {
            for(int i=0;i<uploadFile.length;i++){
                ls.add(fileUploadService.fileUpload(uploadFile[i].getOriginalFilename(),uploadFile[i].getInputStream()));
            }

            return   ls;

        } catch (IOException e) {
            e.printStackTrace();
        }


        return  null;
    }





    @RequestMapping("/delete")
    @ResponseBody
    public BaseResult  deleteImg(String pathName){
        boolean flag= fileUploadService.fileDelete(pathName);
        if (flag){
            return BaseResult.success();
        }else{
            return BaseResult.error();
        }
    }


    /**
     * 视频删除
     * @param pathName
     * @return
     */
    @RequestMapping("/video/delete")
    @ResponseBody
    public BaseResult  deleteVideo(String pathName){
        boolean flag= fileUploadService.videoDelete(pathName);
        if (flag){
            return BaseResult.success();
        }else{
            return BaseResult.error();
        }
    }


}
