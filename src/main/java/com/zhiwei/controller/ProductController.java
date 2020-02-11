package com.zhiwei.controller;


import com.zhiwei.base.BaseController;
import com.zhiwei.dao.DescribeMapper;
import com.zhiwei.dao.ParamsMapper;
import com.zhiwei.dao.ProductImgMapper;
import com.zhiwei.po.Describe;
import com.zhiwei.po.Params;
import com.zhiwei.po.Product;
import com.zhiwei.po.ProductImg;
import com.zhiwei.po.vo.RequestPermission;
import com.zhiwei.po.vo.White;
import com.zhiwei.resultBase.BaseResult;
import com.zhiwei.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import java.util.List;

/**
 * Created by jick on 2019/6/14.
 */
@Controller
@RequestMapping("/pro")
public class ProductController extends BaseController {


    @Autowired
    private   ProductService   productService;

    @Autowired
    private ProductImgMapper  productImgMapper;

    @Autowired
    private DescribeMapper  describeMapper;

    @Autowired
    private  ParamsMapper  paramsMapper;




    /*
      * 跳转到产品列表界面
     */
    @RequestPermission(permissionCode = "003")
    @RequestMapping("/list")
   // @ResponseBody
   // @White
    public   String   proList(Model  model){
         BaseResult  result = productService.queryListServcie();
        // return   result;
         model.addAttribute("result",result);
         return "product-list";

    }


    /**
     * 商品信息录入
     */
    @RequestMapping("/save")
    @ResponseBody
    public   BaseResult  infoSaveController(Product product){
        return    productService.infoSaveServcie(product);

    }



    /**
     * 跳转到商品添加界面
     */
    @RequestPermission(permissionCode = "003")
    @RequestMapping("/addPage")
    public   String  proAdd(){
        return "product-add";
    }


    /**
     *商品图片信息存入数据库
     */
    @RequestMapping("/imgSave")
    @ResponseBody
    public  BaseResult   proImgSaveController(ProductImg productImg){
        return     productService.proImgSaveService(productImg);

    }

    /**
     * 商品描述图片信息存入数据库
     */
    @RequestMapping("/urlSave")
    @ResponseBody
    public BaseResult imgSave(Describe describe){


        return  productService.proDescribeImgSaveService(describe);
    }

    /**
     * 商品规格图片信息存入数据库
     */
    @RequestMapping("/paramUrlSave")
    @ResponseBody
    public BaseResult paramImgSave(Params  params){

        return  productService.proParamImgSaveService(params);
    }






    /**
     * 商品图片删除
     */
    @RequestMapping("/img/delete")
    @ResponseBody
    public BaseResult imgDel(String pathName){
        return  productService.imgDelService(pathName);
    }


    /**
     * 跳转到编辑页面
     */
    @RequestPermission(permissionCode = "003")
    @RequestMapping("/editPage")
    public   String   editPageController(Model model,Integer id){
        Product  product  = productService.queryByIdService(id);
        List<String>  list1 =  productImgMapper.queryByNum(product.getNumber());
        List<String>  list2 =  describeMapper.queryUrlByNum(product.getNumber());
        List<String>  list3 =  paramsMapper.queryUrlByNum(product.getNumber());
        model.addAttribute("proImg",list1);
        model.addAttribute("describeImg",list2);
        model.addAttribute("paramImg",list3);
        model.addAttribute("pro",product);
        return   "product-edit";
    }

    /**
     * 信息更新操作
     */
    @RequestMapping("/update")
    @ResponseBody
    public   BaseResult  updateController(Product product){
        return   productService.infoUpdateServcie(product);
    }

    //infoUpdateServcie


    /**
     * 商品删除
     */
    @RequestMapping("/delete")
    @ResponseBody
    public  BaseResult  deleteService(Integer id){
        return   productService. deleteService(id);
    }


    /**
     * 查找最受欢迎的商品
     */
    @RequestMapping("/favoriteList")
    @ResponseBody
    @White
    public  BaseResult queryFavoriteListController(){
        return   productService.queryFavoriteListService();
    }


    /**
     * 通过二级分类获取商品列表
     */
    @RequestMapping("/queryLitBySecond")
    @White
    @ResponseBody
    public  BaseResult  queryListBySecondIdController(int pageNo,int secondId){
        return     productService.queryListBySecondIdService(pageNo,secondId);

    }

    /**
     * 前台查看商品的详情
     */
    @RequestMapping("/queryPortalInfo")
    @White
    @ResponseBody
    public   BaseResult  queryPortalInfoByIdController(Integer id){
        return    productService.queryPortalInfoByIdService(id);
    }





}
