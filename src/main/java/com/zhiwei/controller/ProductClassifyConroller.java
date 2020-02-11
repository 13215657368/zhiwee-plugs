package com.zhiwei.controller;

import com.zhiwei.base.BaseController;
import com.zhiwei.dao.ProductclassifyMapper;
import com.zhiwei.po.Productclassify;
import com.zhiwei.po.vo.RequestPermission;
import com.zhiwei.po.vo.White;
import com.zhiwei.resultBase.BaseResult;
import com.zhiwei.service.FileUploadService;
import com.zhiwei.service.ProductclassifyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/productClassify")
public class ProductClassifyConroller extends BaseController {

    @Autowired
    private ProductclassifyService productclassifyService;

    @Autowired
    private ProductclassifyMapper productclassifyMapper;

    @Autowired
    private FileUploadService fileUploadService;


    /**
     * 跳转到列表页面
     */
    @RequestPermission(permissionCode = "003")
    @RequestMapping("/list")
    public String productClassifyList(Model model) {
       BaseResult  result =   productclassifyService.queryListService();
        model.addAttribute("list",result);
        return "product-classify-list";

    }


    /**
     * 跳转到类别添加页面
     */
    @RequestPermission(permissionCode = "003")
    @RequestMapping("/addPage")
    public String addPage() {
        return "product-classify-add";
    }

    /**
     * 跳转到编辑页面
     */
    @RequestPermission(permissionCode = "003")
    @RequestMapping("/editPage/{id}")
    public  String editPage(@PathVariable Integer  id,Model model){
        Productclassify p = productclassifyService.queryByIdServcie(id);
        model.addAttribute("p",p);
        return   "product-classify-edit";
    }

    /**
     * 通过id查寻
     * @param
     * @return
     */
    @RequestMapping(value = "/queryById/{id}",method = RequestMethod.GET)
    @ResponseBody
     @White
    public  Productclassify   queryByIdController(@PathVariable Integer id){
        return   productclassifyService.queryByIdServcie(id);
    }

    /**
     * 类别添加
     */
    @RequestMapping("/save")
    @ResponseBody
    public BaseResult infoSaveController(Productclassify productclassify) {
        return productclassifyService.infoSaveService(productclassify);
    }


    /**
     * 更新操作
     */

    @RequestMapping("/update")
    @ResponseBody
    public BaseResult infoUpateController(Productclassify productclassify) {
        return productclassifyService. infoUpdateService(productclassify);
    }

    /**
     * 通过类别查询
     */
    @RequestMapping(value = "/queryByType/{type}",method = RequestMethod.GET)
    @ResponseBody
    @White
    public BaseResult   queryByTypeController(@PathVariable String type){
        return   productclassifyService.queryByTypeService(type);
    }


    /**
     * 通过父类的id查询
     */
    @RequestMapping("/quertByParentId/{id}")
    @ResponseBody
    @White
    public BaseResult  queryByParentIdController(@PathVariable Integer id){
        return    productclassifyService.queryByParentIdService(id);
    }


    /**
     * 列表展示
     */
    @RequestMapping("/delete")
    @ResponseBody
    public BaseResult  queryListController(Productclassify productclassify){
        //删除服务器上的图片
        if(null !=productclassify.getCover() && "" !=productclassify.getCover()){
          boolean b =   fileUploadService.fileDelete(productclassify.getCover());
        }

        return    productclassifyService.deleteService(productclassify.getId());
    }

    /**
     * 根据rootId和type查询
     */
    @RequestMapping("/queryByRootIdAndType")
    @ResponseBody
    public List<Productclassify>  queryByRootIdAndTypeController(Productclassify productclassify){
         return    productclassifyMapper.queryByRootIdAndType(productclassify);
    }








}
