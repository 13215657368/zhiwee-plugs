package com.zhiwei.controller;

import com.zhiwei.base.BaseController;
import com.zhiwei.po.Companyleader;
import com.zhiwei.po.vo.RequestPermission;
import com.zhiwei.po.vo.White;
import com.zhiwei.resultBase.BaseResult;
import com.zhiwei.service.CompanyLeaderService;
import com.zhiwei.service.CompanydescribeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("/companyLeader")
public class CompanyLeaderController  extends BaseController {

    @Autowired
    private CompanyLeaderService  companyLeaderService;

    /**
     * 返回类表页
     * @param model
     * @return
     */
    @RequestPermission(permissionCode = "007")
    @RequestMapping("/list")
    public String  list(Model model){
        List<Companyleader> list  =  companyLeaderService.queryListServie();
        model.addAttribute("list",list);
        return "company-leader-list";
    }



    @RequestPermission(permissionCode = "007")
    @RequestMapping("/addPage")
    public  String  addPage(){
        return "company-leader";
    }

    /**
     * 跳转到编辑页面
     * @return
     */
    @RequestPermission(permissionCode = "007")
    @RequestMapping("/content")
    public  String  showContent(Model model,Integer id){
        Companyleader companyleader  =  companyLeaderService.queryInfoByIdService(id);
        model.addAttribute("companyleader",companyleader);
        return "company-leader-edit";
    }

    /**
     * 添加与更新
     * @param companyleader
     * @return
     */
    @RequestMapping("/saveOrUpdate")
    @ResponseBody
    public BaseResult saveOrUpdateController(Companyleader companyleader){
        return     companyLeaderService.saveOrUpdateService(companyleader);
    }


    @RequestMapping("/check")
    @ResponseBody
    public List<Companyleader>  check(){
        List<Companyleader> list  =companyLeaderService.queryListServie();
        return   list;
    }

    /**
     * 删除操作，使用restful风格
     * @param id
     * @return
     */
    @RequestMapping("/delete/{id}")
    @ResponseBody
    public  BaseResult deleteController(@PathVariable Integer id){
        return   companyLeaderService.deleteService(id);
    }




    /////////////////////////////////////////////////////////////
    //前台页面展示
    @RequestMapping("/portal/content")
    @ResponseBody
    @White
    public   Companyleader portalShowContent(){
        List<Companyleader> companyleaders = companyLeaderService.queryListServie();
        return  companyleaders.get(0);
    }


}
