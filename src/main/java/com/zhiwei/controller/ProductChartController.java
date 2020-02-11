package com.zhiwei.controller;

import com.zhiwei.base.BaseController;
import com.zhiwei.po.Chart;
import com.zhiwei.po.vo.RequestPermission;
import com.zhiwei.po.vo.White;
import com.zhiwei.resultBase.BaseResult;
import com.zhiwei.service.ChartService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/productChart")
public class ProductChartController extends BaseController {

    @Autowired
    private ChartService  chartService;

    /**
     *跳转到列表页面
     */
    @RequestPermission(permissionCode = "003")
    @RequestMapping("/list")
    public  String   list(Model  model){
        BaseResult  result  =  chartService.queryListService();
        model.addAttribute("list",result);
        return "productChart-list";
    }


    /**
     * 跳转到录播图添加页面
     */
    @RequestPermission(permissionCode = "003")
    @RequestMapping("/addPage")
    public  String   addPage(){
        return  "productChart-add";
    }

    /**
     * 添加操作
     */
    @RequestMapping("/add")
    @ResponseBody
    public BaseResult   infoSaveController(Chart  chart){
        return    chartService.infoSave(chart);
    }

    /**
     * 删除图片
     */
    @RequestMapping("/imgDel")
    @ResponseBody
    public BaseResult   deleteImgController(String  url){
        return   chartService.deleteByUrlService(url);
    }



    ////////////////////////////////////////////////////////前台

    /**
     * 根据rootId查询
     */
    @RequestMapping("/queryByRootId")
    @White
    @ResponseBody
    public  BaseResult  queryByRootIdController(Integer rootId){
        return    chartService.queryByRootIdService(rootId);
    }


}
