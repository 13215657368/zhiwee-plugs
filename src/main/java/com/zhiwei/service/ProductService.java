package com.zhiwei.service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.zhiwei.dao.DescribeMapper;
import com.zhiwei.dao.ParamsMapper;
import com.zhiwei.dao.ProductImgMapper;
import com.zhiwei.dao.ProductMapper;
import com.zhiwei.po.*;
import com.zhiwei.po.vo.ProductVo;
import com.zhiwei.resultBase.BaseResult;
import javafx.beans.value.ObservableNumberValue;
import org.dom4j.dtd.ElementDecl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.xml.crypto.dsig.keyinfo.RetrievalMethod;
import java.util.Collections;
import java.util.List;

/**
 * Created by jick on 2019/6/24.
 */
@Service
public class ProductService {

    @Autowired
    private ProductMapper productMapper;
    @Autowired
    private FileUploadService fileUploadService;

    @Autowired
    private DescribeMapper describeMapper;

    @Autowired
    private ProductImgMapper  productImgMapper;

    @Autowired
    private ParamsMapper paramsMapper;


    /**
     *
     * 信息录入数据库
     */
    public   BaseResult    infoSaveServcie(Product product){

        //非空判断
        if(null!=product.getName()&&""!=product.getName().trim()){
            if(product.getDbp() !=null) {
                if (product.getDbp().equals("1"))
                    product.setDbp("变频冷暖");
                if (product.getDbp().equals("2"))
                    product.setDbp("定频冷暖");
                if (product.getDbp().equals("3"))
                    product.setDbp("定频单冷");
            }

            int result =   productMapper.insert(product);
            if(result>0){
                return   BaseResult.success();
            }
        }
        return   BaseResult.error();

    }

    /**
     * 查询信息，返回值列表
     */
    public BaseResult  queryListServcie(){
        List<ProductVo> list =   productMapper.queryList();

        for (ProductVo p: list){

            String[]  level  =  p.getLevel().split(":");
            if(level.length>1){
                p.setLevel(level[1]);
            }else {
                p.setLevel("");
            }

            String[]  area  =   p.getArea().split(":");
            if(area.length>1){
                p.setArea(area[1]);
            }else{
                p.setArea("");
            }

            String[]  color =  p.getColor().split(":");
            if(color.length>1){
                p.setColor(color[1]);
            }else{
                p.setColor("");
            }

        }


        return   BaseResult.ok(list);



    }





    /**商品图片存入数据库
     */

    public BaseResult proImgSaveService(ProductImg productImg) {

        String[] urlStrs =  productImg.getUrl().split(",");

        for (int i = 0; i < urlStrs.length; i++) {
           productImg.setUrl(urlStrs[i]);//将拼接后的地址重新赋值
            Integer result =  productImgMapper.insert(productImg);
            if (result == 0) {
                return BaseResult.error();
            }
        }
        return BaseResult.success();


    }










    /**
     * 商品描述图片信息存入数据库
     */
    public BaseResult proDescribeImgSaveService(Describe describe) {

        String[] urlStrs = describe.getDescribes().split(",");

        for (int i = 0; i < urlStrs.length; i++) {
            describe.setDescribes(urlStrs[i]);//将拼接后的地址重新赋值
            Integer result = describeMapper.insert(describe);
            if (result == 0) {
                return BaseResult.error();
            }
        }
        return BaseResult.success();


    }

    /**
     * 商品规格参数图片信息存入数据库
     */
    public BaseResult proParamImgSaveService(Params params) {

        String[] urlStrs = params.getParams().split(",");

        for (int i = 0; i < urlStrs.length; i++) {
            params.setParams(urlStrs[i]);//将拼接后的地址重新赋值
            Integer result = paramsMapper.insert(params);
            if (result == 0) {
                return BaseResult.error();
            }
        }
        return BaseResult.success();


    }

    /**
     * 删除数据库中和服务器图片的url
     */
    public BaseResult imgDelService(String pathName) {
        int r1 = describeMapper.deleteByUrl(pathName);
        int r2 = paramsMapper.deleteByUrl(pathName);
        int r3 = productImgMapper.deleteByUrl(pathName);
        //调用删除服务器文件方法
        boolean flag = fileUploadService.fileDelete(pathName);

        if (r1 > 0 && flag == true) {
            return BaseResult.success();
        }
        if (r2 > 0 && flag == true) {
            return BaseResult.success();
        }
        if (r3 > 0 && flag == true) {
            return BaseResult.success();
        } else {
            return BaseResult.error();
        }


    }

    /**
     * 通过id查询信息
     */
    public   Product queryByIdService(Integer id){
        Product  product  =  productMapper.queryById(id);

        String[]  level  =  product.getLevel().split(":");
        if(level.length>1){
            product.setLevel(level[1]);
        }else {
            product.setLevel("");
        }

        String[]  area  =   product.getArea().split(":");
        if(area.length>1){
            product.setArea(area[1]);
        }else{
            product.setArea("");
        }

        String[]  color =  product.getColor().split(":");
        if(color.length>1){
            product.setColor(color[1]);
        }else{
            product.setColor("");
        }


        return  product;
    }

    /**
     * 更新操作
     */

    /**
     *
     * 信息录入数据库
     */
    public   BaseResult    infoUpdateServcie(Product product){

        //非空判断
        if(null!=product.getName()&&""!=product.getName().trim()){
            if(product.getDbp() !=null) {
                if (product.getDbp().equals("1"))
                    product.setDbp("变频冷暖");
                if (product.getDbp().equals("2"))
                    product.setDbp("定频冷暖");
                if (product.getDbp().equals("3"))
                    product.setDbp("定频单冷");
            }

            int result =   productMapper.update(product);
            if(result>0){
                return   BaseResult.success();
            }
        }
        return   BaseResult.error();

    }

    /**
     * 产品删除
     */
    public  BaseResult   deleteService(Integer id){
        //1删除数据库四张标表里面的数据
        //2 删除服务器里面的数据
        Product  product  =  productMapper.queryById(id);

        //删除服务器上的文件
        List<String>  productImgs = productImgMapper.queryByNum(product.getNumber());
        for(String url:productImgs){
             fileUploadService.fileDelete(url);
        }


        List<String>  prodescibs =  describeMapper.queryUrlByNum(product.getNumber());
        for(String url:prodescibs){
            fileUploadService.fileDelete(url);
        }


        List<String> params  =  paramsMapper.queryUrlByNum(product.getNumber());

        for(String url:params){
            fileUploadService.fileDelete(url);
        }


        //删除数据库里面的数据
       int r1=    productImgMapper.deleteByNum(product.getNumber());
       int r2=  describeMapper.deleteByNum(product.getNumber());
       int r3=   paramsMapper.deleteByNum(product.getNumber());
       int r4=  productMapper.delete(id);

       if(r1>0&&r2>0&&r3>0&&r4>0){
           return  BaseResult.success();
       }else {
           return   BaseResult.error();
       }



    }


    /**
     * 获取最受欢迎的数据
     * @return
     */
    public   BaseResult  queryFavoriteListService(){
        List<ProductVo> list  =   productMapper.queryFavoriteList();


        //截取一张图片
        for (ProductVo p : list){
           if(p.getUrl() !=null && p.getUrl().trim() !="")
               p.setUrl(p.getUrl().split(",")[0]);
        }

        return   BaseResult.ok(list);

    }


    /**
     * 通过二级分类获取商品列表
     */
    public   BaseResult  queryListBySecondIdService(int pageNo,int secondId){


        int pageSize = 3;
        PageHelper.startPage(pageNo, pageSize);

        List<ProductVo>   list  = productMapper.queryListBySecondId(secondId);
        //对url切割重新赋值
        for(ProductVo  p : list){
            p.setUrl(p.getUrl().split(",")[0]);
        }

        PageInfo page = new PageInfo(list);
        return   BaseResult.success(page);

    }


    /**
     * 前台通过id查询详情信息
     */
    public    BaseResult queryPortalInfoByIdService(Integer id){
        ProductVo  productVo =  productMapper.queryPortalInfoById(id);
        if(null==productVo.getUrl()){
            productVo.setUrl("");
        }if(null==productVo.getDescribes()){
            productVo.setDescribes("");
        }if(null==productVo.getParams()){
            productVo.setParams("");
        }

        String[]  level  =  productVo.getLevel().split(":");
        if(level.length==1)
            productVo.setLevel("");

        String[]  area  =  productVo.getArea().split(":");
        if(area.length==1)
            productVo.setArea("");

        String[]  color =  productVo.getColor().split(":");
        if(color.length==1)
            productVo.setColor("");




        /*
        *
        * String[]  level  =  product.getLevel().split(":");
        if(level.length>1){
            product.setLevel(level[1]);
        }else {
            product.setLevel("");
        }

        String[]  area  =   product.getArea().split(":");
        if(area.length>1){
            product.setArea(area[1]);
        }else{
            product.setArea("");
        }

        String[]  color =  product.getColor().split(":");
        if(color.length>1){
            product.setColor(color[1]);
        }else{
            product.setColor("");
        }
        *
        *
        *
        * */

        return   BaseResult.ok(productVo);


    }

    /**
     * 更具关键字查询
     */
    public  List<ProductVo> queryProByWordsService(String name){

        List<ProductVo> list =  productMapper.queryProByWords(name);

        for (ProductVo  p : list){
              if(p.getUrl() !=null && p.getUrl().trim() !=""){
                  p.setUrl(p.getUrl().split(",")[0]);
              }else{
                  p.setUrl("");
              }

              }
            return    list;
        }


}
