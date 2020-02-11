package com.zhiwei.controller;

import com.zhiwei.base.BaseController;
import com.zhiwei.po.Video;
import com.zhiwei.po.vo.RequestPermission;
import com.zhiwei.po.vo.White;
import com.zhiwei.resultBase.BaseResult;
import com.zhiwei.service.VideoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * Created by jick on 2019/8/14.
 */
@Controller
@RequestMapping("/video")
public class VideoController extends BaseController {

    @Autowired
    private VideoService  videoService;



    /**
     * 跳转到列表页面
     */
    @RequestPermission(permissionCode = "010")
    @RequestMapping("/list")
    public String  getList(Model model){
        BaseResult bs = videoService.queryInfoListService();
        model.addAttribute("bs",bs);
        return "video-list";
    }

    /**
     * 跳转到添加页面
     */
    @RequestPermission(permissionCode = "010")
    @RequestMapping("/toAddPage")
    public String  toAddPage(){
        return "video-add";
    }


    /**
     * 视频信息入库
     */
    @RequestMapping("/save")
    @ResponseBody
    public BaseResult videoInfoSave(Video video){
        return    videoService.videoSaveService(video);
    }

    /**
     * 跳转到编辑页面
     */
    @RequestPermission(permissionCode = "010")
    @RequestMapping("/edit")
    public String videoInfoEdit(Model model,Integer id){
        BaseResult  bs = videoService.queryByIdService(id);
        model.addAttribute("bs",bs);
        return   "video-edit";
    }

    /**
     * 视频删除
     */
    @RequestMapping("/delete")
    @ResponseBody
    public   BaseResult videoDelController(Video video){
        return   videoService.videoDeleteService(video);
    }


    /**
     * 信息更新
     */
    @RequestMapping("/update")
    @ResponseBody
    public BaseResult updateController(Video video){
        return  videoService.updateSerice(video);

    }

    /**
     * 删除，服务器和数据库里面的数据
     */
    @RequestMapping("/infoDelete")
    @ResponseBody
    public BaseResult deleteController(Video video){
        return  videoService.deteteService(video);


    }

    /**
     * 状态更新
     */
    @RequestMapping("/stateUpdate")
    @ResponseBody
    public BaseResult updateStateController(Video video){
        return  videoService.updateStateService(video);
    }



    ////////////////////////////////////////////前台
    /**
     * 视频
     */
     @White
    @RequestMapping("/portal/videoList")
     @ResponseBody
    public BaseResult portalGetList(){
        BaseResult bs = videoService.queryInfoListByStateService();
        return  bs;

    }








}
