package com.zhiwei.controller;

import com.zhiwei.base.BaseController;
import com.zhiwei.dao.ShopMapper;
import com.zhiwei.po.Shop;
import com.zhiwei.po.Shopimage;
import com.zhiwei.po.vo.RequestPermission;
import com.zhiwei.po.vo.ShopImgResult;
import com.zhiwei.po.vo.ShopResult;
import com.zhiwei.po.vo.White;
import com.zhiwei.resultBase.BaseResult;
import com.zhiwei.service.FileUploadService;
import com.zhiwei.service.ShopService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by jick on 2019/6/13.
 */
@Controller
@RequestMapping("/shops")
public class ShopController extends BaseController {
    @Autowired
    private ShopService shopService;
    @Autowired
    private FileUploadService fileUploadService;
    @Autowired
    private   ShopMapper  shopMapper;

    /**
     * 展示shop列表
     */
    @RequestPermission(permissionCode = "008")
    @RequestMapping("/list")
    public   String    shopList(Model model){
        List<Shop> shopList = shopService.queryShopListService();
        model.addAttribute("shopList",shopList);
        return   "shop-list";
    }

    /**
     * 跳转到店铺的图片信息
     * @return
     */
    @RequestPermission(permissionCode = "008")
    @RequestMapping("/addPage")
    public  String  shopAdd(){
        return  "shop-add";
    }

    /**
     * 跳转到图片展示编辑页面
     */
    @RequestPermission(permissionCode = "008")
    @RequestMapping("/picture/show")
    public    String  showPicture(Model model,String shopid){
        List<Shopimage>  pictureList = shopService.queryImgInfoSerivce(shopid);
        model.addAttribute("pictureList",pictureList);
        return "shop-picture-show";
    }

    /**
     * 跳转到编辑页面，同时回显数据信息
     */
    @RequestPermission(permissionCode = "008")
    @RequestMapping("/detail")
    public   String   showDetail(Integer id,Model model){
        Shop shop = shopService.queryInfoById(id);
        List<Shopimage>  pictureList = shopService.queryImgInfoSerivce(shop.getNum());
        model.addAttribute("shop",shop);
        model.addAttribute("pictureList",pictureList);
        return   "shop-edit";
    }

    /**
     * 图片url存入数据库
     */
    @RequestMapping("/img/add")
    @ResponseBody
    public BaseResult shopImgAdd(Shopimage shopimage){
        return shopService.imgAddService(shopimage);
    }

    /**
     * 店铺信息入库
     */
    @RequestMapping("/shopinfo/add")
    @ResponseBody
    public BaseResult shopAdd(Shop shop){
        return shopService.shopAddService(shop);
    }

    /**
     * 通过主键删除shopimg表中的信息
     */
    @RequestMapping("/img/delete")
    @ResponseBody
    public BaseResult shopimgDelById(Integer id,String url){
        int result = shopService.deleteImgByIdService(id);
        boolean  flag = fileUploadService.fileDelete(url);
        if(null!=id&&null!=url&&url.length()>0) {
            if (result > 0 && flag == true) {
                return BaseResult.success();
            }
        }
        return  BaseResult.error();

    }

    /**
     * 删除商铺信息，同时删除shopimg表信息，服务器上的文件
     */
    @RequestMapping("/delete")
    @ResponseBody
    public BaseResult  shopDelete(String num){
        //通过num查询shopimg表中的图片url
        List<Shopimage> list = shopService.queryImgInfoSerivce(num);

        //通过遍历的方式删除服务器上的文件
        if(list.size()>0){
            int r1 = shopService.deleteImgByNumService(num);//删除shopimg数据库表中的信息
            for(int i=0;i<list.size();i++){
                boolean flag = fileUploadService.fileDelete(list.get(i).getUrl());
                if(flag==false||r1<0){
                    return  BaseResult.error();
                }
            }
        }

        //删除数据库里面的信息
        int r2 = shopService.deleteByNumService(num);
        if(r2>0){
            return BaseResult.success();
        }
        return BaseResult.error();

    }





    /**
     * 信息更新
     */
    @RequestMapping("/update")
    @ResponseBody
      public  BaseResult shopUpdate(Shop shop){
          return shopService.shopUpdateService(shop);
      }

    /**
     * 验证编号是否已经被使用
     */

    @RequestMapping("/checkNum")
    @ResponseBody
    public  BaseResult checkNum(String num){
        return shopService.queryByNumService(num);
    }

//////////////////////////////////////////////////////////////////
    /**
     * 前台使用
     */

    /**
     * 返回店铺信息，标题加图片,前台页面显示
     */
    @White
    @RequestMapping("/portal/shopList")
    @ResponseBody
    public List<Shop> shopList(){
     //   int pageSize=4;
     //   PageHelper.startPage(pageNo, pageSize);
      //  List<Shop>  shops =  shopService.queryShopListService();
      //  PageInfo<Shop>  pageInfo =  new PageInfo<Shop>(shops);
      //  BaseResult  result =  BaseResult.success(pageInfo);
        List<Shop> shops = new ArrayList<>();

        List<ShopResult>  results =  shopService.queryShopListForPortalService();

        /**
         * 遍历将拿到的imgurl替换原来的url，然后传到前台
         */
        for(ShopResult r : results){
            Shop s  = new Shop();
           String[] url=  r.getUrls().split(",");
           s.setId(r.getId());
           s.setNum(r.getNum());
           s.setShopname(r.getShopname());
           s.setImgurl(url[0]);
           shops.add(s);
        }
        return   shops;
    }

    /**
     * 通过id查询店铺的图片信息，供前台页面展示
     */
    @White
    @RequestMapping("/portal/shopImgs")
    @ResponseBody
    public  ShopImgResult  shopImgInfo(String shopid){

        String  title = shopMapper.queryByNum(shopid).getShopname();
        List<Shopimage> shopimages = shopService.queryImgInfoSerivce(shopid);
        ShopImgResult  shopImgResult =  new ShopImgResult();
        shopImgResult.setList(shopimages);
        shopImgResult.setTitle(title);
        return   shopImgResult;



    }

    /**
     * 更具url删除图片信息
     */
    @RequestMapping("/deleteByUrl")
    @ResponseBody
    public  BaseResult  deleteByUrlController(String url){
        return   shopService.deleteByUrlService(url);
    }



}
