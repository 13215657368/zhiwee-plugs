package com.zhiwei.controller;

import com.zhiwei.base.BaseController;
import com.zhiwei.po.Companyculture;
import com.zhiwei.po.Companydescribe;
import com.zhiwei.po.vo.RequestPermission;
import com.zhiwei.po.vo.White;
import com.zhiwei.resultBase.BaseResult;
import com.zhiwei.service.CompanycultureService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;


@Controller
@RequestMapping("/companyCulture")
public class CompanyCultureController extends BaseController {

    @Autowired
    private CompanycultureService companycultureService;

    @RequestPermission(permissionCode = "007")
    @RequestMapping("/list")
    public String  list(Model model){
        List<Companyculture> list   = companycultureService.queryListServie();
        model.addAttribute("list",list);
        return "company-culture-list";
    }


    @RequestMapping("/check")
    @ResponseBody
    public  List<Companyculture> check(){
        List<Companyculture> list  = companycultureService.queryListServie();
        return   list;
    }

    @RequestPermission(permissionCode = "007")
    @RequestMapping("/addPage")
    public  String  addPage(){
        return "company-culture";
    }


    /**
     * 更新与添加
     * @param companyculture
     * @return
     */
    @RequestMapping("/saveOrUpdate")
    @ResponseBody
    public BaseResult saveOrUpdateController(Companyculture companyculture){
        return      companycultureService.saveOrUpdateService(companyculture);
    }


    /**
     * 跳转到编辑页面
     * @param model
     * @param id
     * @return
     */
    @RequestPermission(permissionCode = "007")
    @RequestMapping("/content")
    public  String  showContent(Model model,Integer id){

       Companyculture  companyculture= companycultureService.queryInfoByIdService(id);
        model.addAttribute("companyculture", companyculture);
        return "company-culture-edit";
    }


    /**
     * 删除操作，使用restful风格
     * @param id
     * @return
     */
    @RequestMapping("/delete/{id}")
    @ResponseBody
    public  BaseResult deleteController(@PathVariable Integer id){
        return   companycultureService.deleteService(id);
    }


    /////////////////////////////////////////////////////////////
    //前台页面展示
    @RequestMapping("/portal/content")
    @ResponseBody
    @White
    public   Companyculture  portalShowContent(){

        List<Companyculture> companycultures = companycultureService.queryListServie();
        return companycultures.get(0);
    }





}
