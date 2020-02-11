package com.zhiwei.controller;

import com.zhiwei.base.BaseController;
import com.zhiwei.po.Rotationchart;
import com.zhiwei.po.vo.RequestPermission;
import com.zhiwei.po.vo.White;
import com.zhiwei.resultBase.BaseResult;
import com.zhiwei.service.RotationchartService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.management.relation.RelationService;

@Controller
@RequestMapping("/chart")
public class RotationChartController  extends BaseController {

    @Autowired
    private RotationchartService  rotationchartService;

    @RequestPermission(permissionCode = "001")
    @RequestMapping("/list")
    public   String   list(Model model){
        BaseResult  result  =  rotationchartService.queryListService();
        model.addAttribute("result",result);
        return   "RotationChart-list";
    }

    @RequestPermission(permissionCode = "001")
    @RequestMapping("/addPage")
    public  String  addPage(){
        return   "RotationChart-add";
    }


    /**
     * 新增
     * @param rotationchart
     * @return
     */
    @RequestMapping("/save")
    @ResponseBody
    public BaseResult   infoSaveController(Rotationchart rotationchart){
        return      rotationchartService.infoSaveService(rotationchart);
    }

    @RequestMapping("/img/delete")
    @ResponseBody
    public   BaseResult  deleteByUrlController(String url){
        return   rotationchartService.deleteByUrlService(url);

    }


////////////////////////////////////////////////////////前台

    /**
     * 前台展示轮播图
     * @return
     */
    @RequestMapping("/portalList")
    @White
    @ResponseBody
    public    BaseResult  portalList(){
        BaseResult  result  =  rotationchartService.queryListService();
        return    result;
    }


    /**
     * 排序
     * @return
     */
    @RequestMapping("/sort")
    @ResponseBody
    public  BaseResult  sortController(int sortCode,int id){
       return    rotationchartService.sortService(sortCode,id);
    }


    /**
     * 跳转到编辑页面
     */
    @RequestMapping("/edit")
    public  String  editPage(Integer id,Model model){
        Rotationchart rotationchart  =  rotationchartService.queryByIdService(id);
        model.addAttribute("rotationchart",rotationchart);
        return  "RotationChart-show";
    }

    /**
     * 更新
     */
    @RequestMapping("/update")
    @ResponseBody
    public  BaseResult  updateController(Rotationchart rotationchart){
        return   rotationchartService.updateService(rotationchart);
    }





}
