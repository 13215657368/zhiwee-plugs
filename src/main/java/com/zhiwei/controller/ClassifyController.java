package com.zhiwei.controller;

import com.zhiwei.base.BaseController;
import com.zhiwei.po.Classify;
import com.zhiwei.po.vo.ClassifyResult;
import com.zhiwei.po.vo.RequestPermission;
import com.zhiwei.po.vo.White;
import com.zhiwei.resultBase.BaseResult;
import com.zhiwei.service.ClassifyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/classify")
public class ClassifyController extends BaseController {

    @Autowired
    private ClassifyService classifyService;

    /**
     * 官网首页分类
     * @param model
     * @return
     */
    @RequestPermission(permissionCode = "004")
    @RequestMapping("/list")
    public String classifyList(Model model) {
        List<Classify> result = classifyService.getList();
        model.addAttribute("Classify", result);
        return "Classify-list";
        // return  model;
    }

    /**
     * 官网首页分类
     */
    @RequestMapping("/delete")
    @ResponseBody
    public BaseResult businessInfoDel(Integer id) {
        return classifyService.deleteService(id);

    }
    /**
     * 官网首页分类
     */
    @RequestMapping("/editNO")
    @ResponseBody
    public BaseResult editNO(Integer id) {
        return classifyService.editNO(id);

    }
    /**
     * 官网首页分类
     */
    @RequestMapping("/editYES")
    @ResponseBody
    public BaseResult editYES(Integer id) {
        return classifyService.editYES(id);

    }

    /**
     *  官网首页分类
     * @param model
     * @param id
     * @return
     */
    @RequestPermission(permissionCode = "004")
    @RequestMapping("/edit")
    public String businessEditPage(Model model, Integer id) {
        Classify classify = classifyService.getInfo(id);
        model.addAttribute("classify", classify);
        return "Classify-edit";
    }


    /**
     * 信息更新
     */
    @RequestMapping("/update")
    @ResponseBody
    public BaseResult businessUpdate(Classify classify) {
        BaseResult result = classifyService.update(classify);
        return result;
    }


    /**
     * 前台获取
     */
    @RequestMapping("/getAllClassify")
    @White
    @ResponseBody
    public BaseResult getAllClassify(){
        List<Classify> list=classifyService.getAllClassify();
        List<ClassifyResult> fatherList=new ArrayList<>();
        List<ClassifyResult> sonlist=new ArrayList<>();
        for (Classify mode:list) {
            ClassifyResult co=new ClassifyResult();
            co.setId(mode.getId());
            co.setName(mode.getName());
            co.setaUrl(mode.getaUrl());
            co.setFather(mode.getFather());
            if(mode.getClassifyType()==1){
                fatherList.add(co);
            }else{
                sonlist.add(co);
            }
        }
        for(ClassifyResult father:fatherList){
            for(ClassifyResult son:sonlist){
                if(son.getFather()==father.getId()){
                    if(father.getSonList()==null){
                        List<ClassifyResult> newlist=new ArrayList<>();
                        newlist.add(son);
                        father.setSonList(newlist);
                    }else{
                        father.getSonList().add(son);
                    }
                }
            }

        }
        return BaseResult.ok(fatherList);

    }
}
