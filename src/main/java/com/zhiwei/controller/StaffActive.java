package com.zhiwei.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.sun.prism.impl.shape.BasicRoundRectRep;
import com.zhiwei.base.BaseController;
import com.zhiwei.po.Activeimg;
import com.zhiwei.po.Activity;
import com.zhiwei.po.vo.ActiveImgRestlt;
import com.zhiwei.po.vo.RequestPermission;
import com.zhiwei.po.vo.White;
import com.zhiwei.resultBase.BaseResult;
import com.zhiwei.service.ActiveService;
import com.zhiwei.service.FileUploadService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Date;
import java.util.List;

/**
 * Created by jick on 2019/6/12.
 */
@Controller
@RequestMapping("/active")
public class StaffActive  extends BaseController {

    @Autowired
    private ActiveService   activeService;
    @Autowired
    private FileUploadService fileUploadService;

    /**
     * 跳转到活动信息展示列表
     */
    @RequestPermission(permissionCode = "005")
    @RequestMapping("/list")
    public   String   activeList(Model model){
        List<Activity> ac = activeService.activeListService();
        model.addAttribute("acList",ac);
        return "activePicture-list";
    }

    /**
     * 跳转到活动发布页面
     */
    @RequestPermission(permissionCode = "005")
    @RequestMapping("/addPage")
    public   String   activeAdd(){
        return  "activePicture-add";
    }

    /**
     * 图片信息入库
     */
    @RequestMapping("/img/add")
    @ResponseBody
    public BaseResult activeImgSave(Activeimg activeimg){
        return activeService.acticeImgSaveService(activeimg);
    }

    /**
     * 活动信息入库
     */
    @RequestMapping("/info/add")
    @ResponseBody
    public BaseResult activeSave(Activity activity){
         Activity a = new Activity();
         a.setId(activity.getId());
         a.setTitleimg(activity.getTitleimg());
         a.setTitle(activity.getTitle());
         a.setDate(new Date());
         a.setType(activity.getType());
        return activeService.activeSaveService(a);
    }

    /**
     * 跳转到编辑页面,同时信息回显
     */
    @RequestPermission(permissionCode = "005")
    @RequestMapping("/edit")
    public   String   ActiveDetail(Model model,String id){
       Activity ac =  activeService.queryActityByIdService(id);
       List<Activeimg>  img = activeService.queryImgByacidService(id);
        model.addAttribute("ac",ac);
        model.addAttribute("img",img);
        return   "activePicture-edit";
    }

    /**
     *根据id删除图片
     */

    /**
     * 图片信息删除(通过主键)
     */
    @RequestMapping("/img/deleteById")
    @ResponseBody
    public   BaseResult  delNewsImgById(Integer id,String pathName){
        //&&null!=pathName&&pathName.length()>0    boolean flag = fileUploadService.fileDelete(pathName);
       if(null!=id&&null!=pathName&&pathName.length()>0) {
            int result =  activeService.deleteByIdService(id);
           boolean flag = fileUploadService.fileDelete(pathName);
            if(result>0&&flag==true){
                return BaseResult.success();
            }
        }
        return BaseResult.error();
    }

    /**
     * 根据id更新activity表的信息
     */
      @RequestMapping("/info/update")
      @ResponseBody
    public  BaseResult  activeUpdateController(Activity activity){
         Activity a  = new Activity();
          a.setTitle(activity.getTitle());
          a.setId(activity.getId());
          a.setDate(new Date());
          a.setTitleimg(activity.getTitleimg());
          a.setType(activity.getType());
          return activeService.updateByIdService(a);
      }

    /**
     * 删除active变activeimg表中的数据，同时删除服务器上的图片
     */
    @RequestMapping("/delete")
    @ResponseBody
    public  BaseResult  activeDeleteController(String id){
        //查询对应id的url（id就是activeimg中的acid）
        List<Activeimg> activeimgs = activeService.queryImgByacidService(id);

        //循环删除服务器上文件
        for(int i=0;i<activeimgs.size();i++){
            boolean flag = fileUploadService.fileDelete(activeimgs.get(i).getUrl());
            if(flag==false){
                return BaseResult.error();
            }
        }
        int   result1 = activeService.deleteByAcidService(id);//删除表activeimg表中的信息
        int   result2 = activeService.deleteInfoByIdService(id);

        if(result1>0&&result2>0){
            return BaseResult.success();
        }
        return BaseResult.error();

    }

    /**
     * 判断id是否存在
     */
    /**
     * 跳转到编辑页面,同时信息回显
     */
    @RequestMapping("/id")
    @ResponseBody
    public   BaseResult   ActiveId(Model model,String id){
          Activity ac = activeService.queryActityByIdService(id);
          if(null!=ac){
              return   BaseResult.error();//如果不为空，说明编号已经存在
        }else{//否则说明编号不存在
              return  BaseResult.success();
          }
    }

    /**
     * 根据类型查询信息
     */
    @White
    @RequestMapping("/portal/activeInfo")
    @ResponseBody
    public  List<Activity> activityByTypeCtrl(Integer  type){
        return  activeService.queryActiveByTypeService(type);
    }

    /**
     * 根据id查询activ表中的图片信息
     */
    //queryImgByacidService
    @White
    @RequestMapping("/portal/imgInfo")
    @ResponseBody
    public ActiveImgRestlt queryImgInfoById(String acid){
        String title = activeService.queryActityByIdService(acid).getTitle();//查标题
        Date  date = activeService.queryActityByIdService(acid).getDate();//查询时间
        List<Activeimg >  list = activeService.queryImgByacidService(acid);//查图片集合
        ActiveImgRestlt ac = new ActiveImgRestlt();
        ac.setTitle(title);
        ac.setDate(date);
        ac.setList(list);
        return  ac;
    }


    /**
     * 查询员工风采信息
     */
    @White
    @RequestMapping("/portal/staffActive")
    @ResponseBody
    public  BaseResult staffActivity(int pageNo){
        int pageSize = 4;
        PageHelper.startPage(pageNo, pageSize);
        List<Activity> list=  activeService.queryActiveByTypeService(1);
        PageInfo<Activity> pageInfo = new PageInfo<Activity>(list);
        BaseResult  result =    BaseResult.success(pageInfo);
        return   result;
    }

    /**
     * 查询员工风采的轮播图信息
     */

    /**
     * 根据url删除服务器以及数据库里面的图片数据
     */
    @RequestMapping("/deleteByUrl")
    @ResponseBody
    public  BaseResult  delete1ByUrlController(String  url){
        return  activeService.deleteByUrlService(url);
    }





}
