package com.zhiwei.controller;

import com.zhiwei.base.BaseController;
import com.zhiwei.dao.CompanydescribeMapper;
import com.zhiwei.po.Companydescribe;
import com.zhiwei.po.vo.RequestPermission;
import com.zhiwei.po.vo.White;
import com.zhiwei.resultBase.BaseResult;
import com.zhiwei.service.CompanydescribeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("/companyDescribe")
public class CompanyDescribeController  extends BaseController {

    @Autowired
    private CompanydescribeService  companydescribeService;





    /**
     * 跳转到编辑页面
     * @param model
     * @param id
     * @return
     */
    @RequestPermission(permissionCode = "007")
    @RequestMapping("/content")
    public  String  showContent(Model model,Integer id){

            Companydescribe companydescribe = companydescribeService.queryInfoByIdService(id);
            model.addAttribute("companydescribe", companydescribe);
            return "company-describe-edit";
    }

    @RequestPermission(permissionCode = "007")
    @RequestMapping("/addPage")
    public  String  addPage(){
        return "company-describe";
    }

    /**
     * 返回类表页
     * @param model
     * @return
     */
    @RequestPermission(permissionCode = "007")
    @RequestMapping("/list")
    public String  showList(Model model){
        List<Companydescribe> list  =companydescribeService.queryListServie();
        model.addAttribute("list",list);
        return "company-describe-list";
    }


    @RequestMapping("/check")
    @ResponseBody
    public List<Companydescribe>  check(){
        List<Companydescribe> list  = companydescribeService.queryListServie();
        return   list;
    }




    @RequestMapping("/saveOrUpdate")
    @ResponseBody
    public BaseResult saveOrUpdateController(Companydescribe companydescribe){
           return     companydescribeService.saveOrUpdateService(companydescribe);
    }


    /**
     * 删除操作，使用restful风格
     * @param id
     * @return
     */
    @RequestMapping("/delete/{id}")
    @ResponseBody
    public  BaseResult deleteController(@PathVariable Integer id){
        return   companydescribeService.deleteService(id);
    }



    /////////////////////////////////////////////////////////////
    //前台页面展示
    @RequestMapping("/portal/content")
    @ResponseBody
    @White
    public   Companydescribe  portalShowContent(){

        List<Companydescribe> companydescribes = companydescribeService.queryListServie();
        return companydescribes.get(0);
    }




}
