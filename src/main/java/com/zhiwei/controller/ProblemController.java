package com.zhiwei.controller;

import com.zhiwei.base.BaseController;
import com.zhiwei.po.Problem;
import com.zhiwei.po.vo.RequestPermission;
import com.zhiwei.po.vo.White;
import com.zhiwei.resultBase.BaseResult;
import com.zhiwei.service.ProblemService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * Created by jick on 2019/9/5.
 */
@Controller
@RequestMapping("/problems")
public class ProblemController  extends BaseController {


    @Autowired
    private ProblemService problemService;

    /**
     * 调到类表页面
     */
    @RequestPermission(permissionCode = "011")
    @RequestMapping("/list")
    public  String problemList(Model model){
        BaseResult  result = problemService.queryListService();
        model.addAttribute("result",result);
        return "problems-list";
    }

    /**
     * 跳转到问题新增页面
     */
    @RequestPermission(permissionCode = "011")
    @RequestMapping("/add")
    public  String  problemAdd(){
        return  "problems-add";
    }

    /**
     * 信息保存
     */
    @RequestMapping("/save")
    @ResponseBody
    public BaseResult save(Problem problem){
        return  problemService.saveService(problem);
    }

    /**
     * 跳转到编辑页面
     */
    @RequestPermission(permissionCode = "011")
    @RequestMapping("/editPage")
    public  String   edit(Integer id,Model model){
        Problem problem =  problemService.queryByIdService(id);
        model.addAttribute("problem",problem);
        return   "problems-edit";
    }

    /**
     * 更新
     * @param problem
     * @return
     */
    @RequestMapping("/update")
    @ResponseBody
    public    BaseResult   update(Problem problem){
        return   problemService.updateService(problem);
    }


    /**
     * 删除操作
     */
    @RequestMapping("/delete")
    @ResponseBody
    public  BaseResult deleteController(Integer id){
        return    problemService.deleteService(id);
    }



    /////////////////////////////////////////////////////////////////
    //前台接口
    /**
     * 返回类表
     */
    @RequestMapping("/portal/list")
    @White
    @ResponseBody
    public   BaseResult poratlList(){
        return    problemService.queryListService();
    }


    /**
     * 前台查看详情
     */
    @RequestMapping("/portal/detail")
    @White
    @ResponseBody
    public  Problem   infoDetail(Integer id){
        return   problemService.queryByIdService(id);
    }

}
