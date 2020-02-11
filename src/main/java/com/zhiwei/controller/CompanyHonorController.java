package com.zhiwei.controller;

import com.zhiwei.base.BaseController;
import com.zhiwei.dao.CompanyhonorMapper;
import com.zhiwei.po.Companyhonor;
import com.zhiwei.po.vo.RequestPermission;
import com.zhiwei.po.vo.White;
import com.zhiwei.resultBase.BaseResult;
import com.zhiwei.service.CompanyHonorService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("/companyHonor")
public class CompanyHonorController extends BaseController {

    @Autowired
    private CompanyHonorService  companyHonorService;

    /**
     * 返回类表页
     * @return
     */
    @RequestPermission(permissionCode = "007")
    @RequestMapping("/list")
    public String  list(Model model){
        List<Companyhonor> list  =  companyHonorService.queryListServie();
        model.addAttribute("list",list);
        return "company-honor-list";
    }

    @RequestPermission(permissionCode = "007")
    @RequestMapping("/addPage")
    public  String  addPage(){
        return "company-honor";
    }

    /**
     * 跳转到编辑页面
     * @return
     */
    @RequestPermission(permissionCode = "007")
    @RequestMapping("/content")
    public  String  showContent(Model model,Integer id){
         Companyhonor  companyhover  =  companyHonorService.queryInfoByIdService(id);
        model.addAttribute("companyhover",companyhover);
        return "company-honor-edit";
    }


    /**
     * 添加与更新
     * @return
     */
    @RequestMapping("/saveOrUpdate")
    @ResponseBody
    public BaseResult saveOrUpdateController(Companyhonor companyhover){
        return     companyHonorService.saveOrUpdateService(companyhover);
    }


    @RequestMapping("/check")
    @ResponseBody
    public List<Companyhonor>  check(){
        List<Companyhonor> list  =companyHonorService.queryListServie();
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
        return  companyHonorService.deleteService(id);
    }



    /////////////////////////////////////////////////////////////
    //前台页面展示
    @RequestMapping("/portal/content")
    @ResponseBody
    @White
    public    Companyhonor portalShowContent(){
        List<Companyhonor>  companyhonors = companyHonorService.queryListServie();
        return  companyhonors.get(0);
    }

}
