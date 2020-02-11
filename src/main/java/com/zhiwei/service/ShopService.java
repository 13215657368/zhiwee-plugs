package com.zhiwei.service;

import com.zhiwei.dao.ShopMapper;
import com.zhiwei.dao.ShopimageMapper;
import com.zhiwei.po.Shop;
import com.zhiwei.po.Shopimage;
import com.zhiwei.po.vo.ShopResult;
import com.zhiwei.resultBase.BaseResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by jick on 2019/6/27.
 */
@Service
public class ShopService {
    @Autowired
    private ShopimageMapper shopimageMapper;

    @Autowired
    private ShopMapper shopMapper;

    @Autowired
    private   FileUploadService fileUploadService;


    /**
     * 图片信息的url存入数据库
     */
    public BaseResult imgAddService(Shopimage shopimage){
        if(null!=shopimage.getShopid()&&shopimage.getShopid().length()>0
                &&null!=shopimage.getUrl()&&shopimage.getUrl().length()>0){
            int result= shopimageMapper.insert(shopimage);
            if(result>0){
                return  BaseResult.success();
            }
        }
        return BaseResult.error();

    }
    /**
     * 店铺信息入库
     */
    public BaseResult shopAddService(Shop shop){
        if(null!=shop.getNum()&&""!=shop.getNum().trim()&&
                null!=shop.getShopname()&&""!=shop.getShopname().trim()){
            int result= shopMapper.insert(shop);
            if(result>0){
                return  BaseResult.success();
            }
        }
        return BaseResult.error();

    }

    /**
     * 根据shopid查询图片信息
     */
    public List<Shopimage> queryImgInfoSerivce(String shopid){
        return   shopimageMapper.queryByShopid(shopid);
    }

    /**
     * 店铺列表，后台
     */
    public List<Shop> queryShopListService(){
        return shopMapper.queryShopList();
    }

    /**
     * 店铺类表，前台使用
     */
    public   List<ShopResult> queryShopListForPortalService(){
        return   shopMapper.queryShopListForPortal();
    }

    /**
     * 通过主键删除shopimg表中的信息
     */
    public  int deleteImgByIdService(Integer id){
        return   shopimageMapper.deleteById(id);
    }

    /**
     * 通过Num删除shopimg表中的信息
     */
    public  int deleteImgByNumService(String num){
        return   shopimageMapper.deleteByNum(num);
    }


    /**
     * 通过num删除shop表中的信息
     */
    public  int deleteByNumService(String num){
        return   shopMapper.deleteBynum(num);
    }

    /**
     * 通过主键查询对应的店铺信息
     */
    public Shop queryInfoById(Integer id){
        if(null!=id) {
            return shopMapper.queryInfoById(id);
        }else{
            return null;
        }
    }

    /**
     * 店铺信息更新
     */
    public  BaseResult shopUpdateService(Shop shop){

        if(null!=shop.getShopname()&&shop.getShopname().length()>0) {
            int result = shopMapper.update(shop);
            if (result > 0) {
                return BaseResult.success();
            }
        }
        return BaseResult.error();

    }

    /**
     * 通过num查询数据库，判断此编号是否存在
     */
    public BaseResult  queryByNumService(String num){
        Shop shop =    shopMapper.queryByNum(num);
        if(null!=shop){//如果非空说明该编号已经被使用
            return BaseResult.error();
        }
        return  BaseResult.success();

    }

    /**
     * 通过关键字查询
     */
    public List<Shop>  queryShopByWordsService(String shopname){
        return  shopMapper.queryShopByWords(shopname);

    }

    /**
     * 更加url删除数据库与服务器上的图片信息
     */
    public  BaseResult   deleteByUrlService(String url){
        //删除服务器上的图片
        boolean   b =    fileUploadService.fileDelete(url);

        //删除数据库里面的信息
        int  result =    shopimageMapper.deleteByUrl(url);

        if(b==true && result>0){
            return  BaseResult.success();
        }else{
            return  BaseResult.error();
        }


    }

}
