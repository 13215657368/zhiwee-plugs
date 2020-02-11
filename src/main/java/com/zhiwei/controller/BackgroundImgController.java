package com.zhiwei.controller;

import com.zhiwei.base.BaseController;
import com.zhiwei.po.BackgroundImg;
import com.zhiwei.po.vo.RequestPermission;
import com.zhiwei.po.vo.White;
import com.zhiwei.resultBase.BaseResult;
import com.zhiwei.service.BackgroundImgService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("/backgroundImg")
public class BackgroundImgController extends BaseController {

    @Autowired
    private BackgroundImgService backgroundImgService;

    /**
     * 代理商分类列表查询
     * @param model
     * @return
     */
    @RequestPermission(permissionCode = "009")
    @RequestMapping("/list")
    public String businessList(Model model) {
        List<BackgroundImg> result = backgroundImgService.getList();
        model.addAttribute("BackgroundImg", result);
        return "backgroundImg-list";
        // return  model;
    }

    /**
     * 代理商分类删除
     */
    @RequestMapping("/delete")
    @ResponseBody
    public BaseResult businessInfoDel(BackgroundImg backgroundImg) {
        return backgroundImgService.deleteService(backgroundImg);
    }

    /**
     *  代理商分类编辑
     * @param model
     * @param id
     * @return
     */
    @RequestPermission(permissionCode = "009")
    @RequestMapping("/edit")
    public String businessEditPage(Model model, Integer id) {
        BackgroundImg background = backgroundImgService.getInfo(id);
        model.addAttribute("background", background);
        return "backgroundImg-edit";
    }


    /**
     * 代理商分类增加跳转
     * @return
     */
    @RequestPermission(permissionCode = "009")
    @RequestMapping("/add")
    public  String  newsAdd(Model model){
        return   "backgroundImg-add";
    }


    /**
     * 增加
     */
    @RequestMapping("/addModel")
    @ResponseBody
    public BaseResult BackgroundImg_add(BackgroundImg backgroundImg) {
        BaseResult result = backgroundImgService.addBackgroundImg(backgroundImg);
        return result;
    }


    /**
     * 更新
     */
    @RequestMapping("/update")
    @ResponseBody
    public BaseResult businessUpdate(BackgroundImg backgroundImg) {
        BaseResult result = backgroundImgService.update(backgroundImg);
        return result;
    }


    /**
     * 单张图片信息删除
     */
    @RequestMapping("/img/delete")
    @ResponseBody
    public BaseResult imgDelete(String imgUrl) {
       // BaseResult result = backgroundImgService.update(backgroundImg);
        //return result;
        return  backgroundImgService.imgDeleteService(imgUrl);
    }


    /**
     * 通过type唯一性检测
     */
    @White
    @RequestMapping("/checkByType")
    @ResponseBody
    public  BaseResult checkByTypeController(Integer type){
        return    backgroundImgService.checkByTypeService(type);

    }

    /**
     * 通过dealerType验证唯一性
     */
    @White
    @RequestMapping("/checkByDealerType")
    @ResponseBody
    public  BaseResult checkByDealerTypeController(Integer dealerType){
        return    backgroundImgService.checkByDealerTypeService(dealerType);

    }



}
