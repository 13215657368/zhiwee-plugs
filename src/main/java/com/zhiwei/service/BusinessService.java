package com.zhiwei.service;

import com.zhiwei.dao.AreaMapper;
import com.zhiwei.dao.BackgroundImgMapper;
import com.zhiwei.dao.BusinessMapper;
import com.zhiwei.dao.ConditionerMapper;
import com.zhiwei.po.Area;
import com.zhiwei.po.BackgroundImg;
import com.zhiwei.po.Business;
import com.zhiwei.po.Conditioner;
import com.zhiwei.po.vo.*;
import com.zhiwei.resultBase.BaseResult;
import com.zhiwei.util.ExcelUtil;
import com.zhiwei.util.IdGenerator;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by jick on 2019/7/23.
 */
@Service
public class BusinessService {

    @Autowired
    private AreaMapper areaMapper;

    @Autowired
    private BusinessMapper businessMapper;

    @Autowired
     private ConditionerMapper  conditionerMapper;


    @Autowired
    private BackgroundImgMapper   backgroundImgMapper;

    /**
     * 查询城市的信息
     */
    public List<Area> queryCityService(){
        return   areaMapper.queryCity();
    }

    /**
     * 查询对应城市的县/区
     */
    public List<Area> queryAreaService(Integer parentId){
        return   areaMapper.queryArea(parentId);
    }

    /**
     * 通过name查询对应县/区
     */
    public  List<Area> queryAreaByParentIdService(String name){
        return  areaMapper.queryAreaByParentId(name);
    }

    /**
     * 格力电器经销商信息存入数据库
     */
    public BaseResult infoSaveService(Business  business){
        //  null==business.getCertificate()||""==business.getCertificate().trim()
        //非空判断
        if(null==business.getAuthNum()||""==business.getAuthNum().trim()||
                0==business.getBusinessType()||
                null==business.getCompanyName()||""==business.getCompanyName().trim()||
                null==business.getRepresent()||""==business.getRepresent().trim()||
                null==business.getTel()||""==business.getTel().trim()||
                null==business.getCity()||""==business.getCity().trim()||
                null==business.getCounty()||""==business.getCounty().trim()||
                null==business.getLocation()||""==business.getLocation().trim()||
                null==business.getLevel()||""==business.getLevel().trim()||
                null==business.getHotline()||""==business.getHotline().trim()
                ){
            business.setCity(business.getCity().trim());//去除头尾为空的字符串
            business.setCounty(business.getCounty().trim());//去除头尾为空的字符串
            return   new BaseResult(400,"信息不完整");
        }
        business.setId(IdGenerator.uuid());
        business.setAvailable(1);
        business.setType(2);

        int result =  businessMapper.insert(business);
        if(result>0){
            return  BaseResult.success();
        }
        return BaseResult.error();

    }

    /**
     * 查询格力电器代理商信息列表
     */
    public  BaseResult queryBusinessList(){
         List<Business> list=  businessMapper.queryBusinessList();
         return  BaseResult.ok(list);
    }


    /**
     * 格力电器经销商信息删除
     */
      public  BaseResult deleteService(String id){
          //删除数据库里面的信息
          int result1 = businessMapper.deleteById(id);
          if(result1>0){
              return BaseResult.success();
          }else{
              return BaseResult.error();
          }

      }


    /**
     * 格力电器批量删除
     */

    public  BaseResult BatchdeleteService(String[] ids){
        //删除数据库里面的信息
        if(ids.length>0){
            int result = businessMapper.deleteBatch(ids);
            if(result>0){
                return BaseResult.success();
            }
        }
        return  BaseResult.error();
    }

    /**
     * 根据id查询对应用户的详细信息
     */
    public Business businessInfoService(String id){
        return  businessMapper.queryBusinessById(id);
    }

    /**
     * 格力电器信息更新
     */
    public BaseResult update(Business business){
        //非空判断
        if(null==business.getAuthNum()||""==business.getAuthNum().trim()||
                0==business.getBusinessType()||
                null==business.getCompanyName()||""==business.getCompanyName().trim()||
                null==business.getRepresent()||""==business.getRepresent().trim()||
                null==business.getTel()||""==business.getTel().trim()||
                null==business.getCity()||""==business.getCity().trim()||
                null==business.getCounty()||""==business.getCounty().trim()||
                null==business.getLocation()||""==business.getLocation().trim()||
                null==business.getLevel()||""==business.getLevel().trim()||
                null==business.getHotline()||""==business.getHotline().trim()
                ){
            return   new BaseResult(400,"信息不完整");
        }
        business.setAvailable(1);
        business.setCity(business.getCity().trim());//去除头尾为空的字符串
        business.setCounty(business.getCounty().trim());//去除头尾为空的字符串
        business.setType(2);
        int result = businessMapper.update(business);
        if(result>0){
            return   BaseResult.success();
        }else {
            return  BaseResult.error();
        }

    }


    /**
     * 格力电器表格信息入库
     */
    public  BaseResult importInfo(InputStream filePath, String file) {
        List<Business> list = new ArrayList<>();
        List<Integer> results=  new ArrayList<>();
        String[] s;
        if (!file.endsWith(".xls") && !file.endsWith(".xlsx")) {
            //文件上传格式出错
            return  BaseResult.error();
        }
        Workbook workbook = null;
        try {
            //获取Workbook实例
            workbook = ExcelUtil.getWorkBook(file, filePath);


        Sheet sheet = workbook.getSheetAt(0);

        //去除sheet中的一些无效行，比如值为空但是有格式的空白行
        sheet = ExcelUtil.resetSheet(sheet);
        int lastRowNum = sheet.getLastRowNum();
        for (int i = 1; i <= lastRowNum; i++) {
            Row row = sheet.getRow(i);
            int cells = sheet.getRow(i).getPhysicalNumberOfCells();

            //获取每一行的数值，并将其填入一个字符串的数组
            s = ExcelUtil.getExcelRows(row, cells);

            Business bs = new Business();
             for(int j=0;j<s.length;j++){
                 if (j == 0)
                     //user.setInstitute(s[j]);
                     bs.setId(IdGenerator.uuid());
                 else if (j == 1)
                     bs.setAuthNum(s[1].trim());
                 else if (j == 2)
                   //  bs.setShopNum(s[2].trim());
                     bs.setCompanyName(s[2].trim());
                 else if (j == 3 )
                     //bs.setCompanyName(s[3].trim());
                     bs.setShopNum(s[3].trim());
                 else if (j == 4){
                     // bs.setBusinessType(s[j]);
                     if("卖场".equals(s[4].trim())){
                         bs.setBusinessType(1);
                     } if("专卖店".equals(s[4].trim())){
                         bs.setBusinessType(2);
                     }if("专营店".equals(s[4].trim())){
                         bs.setBusinessType(3);
                     }if("代理商".equals(s[4].trim())) {
                         bs.setBusinessType(4);
                     }

                 }

                 else if (j == 5)
                     bs.setTel(s[5].trim());
                 else if (j == 6)
                     bs.setLocation(s[6].trim());
                 else if (j == 7)
                     bs.setRepresent(s[7].trim());
                 else if (j == 8)
                     bs.setLevel(s[8].trim());
                 else if (j == 9)
                     bs.setCity(s[9].trim());//去除头尾为空的字符串。
                 else if (j == 10)
                     bs.setCounty(s[10].trim());//去除头尾为空的字符串。
                else if (j == 11)
                     bs.setRemark(s[11]);

             }
          ///  list.add(bs);
            bs.setChannelType(1);
            bs.setAvailable(1);
            bs.setType(2);
           // int op=1/0;


            //首先判断编号是否存在，否则是更新操作
            Business  b = businessMapper.queryByAuthNum(bs.getAuthNum());
            Integer result;
            if(b!=null){
                bs.setId(b.getId());
                result = businessMapper.update(bs);
            }else {
                 result= businessMapper.insert(bs);
            }
            //将结果存入集合中
            results.add(result);

        }


        //循环检验结果
        for(int i=0;i<results.size();i++){
            if(results.get(i)<=0){
                return  BaseResult.error();
            }
        }
        return  BaseResult.success();


        } catch (Exception e) {
            e.printStackTrace();
            return  BaseResult.error();
        }
    }


/**
 * 格力中央空调信息插入数据库
 */
public BaseResult conditionerInfoSaveService(Conditioner conditioner){
    //  null==business.getCertificate()||""==business.getCertificate().trim()
    //非空判断



     if(null!=conditioner.getCity()&&""!=conditioner.getCity().trim()&&
             null!=conditioner.getCounty()&&""!=conditioner.getCounty().trim()&&
             null!=conditioner.getCompanyName()&&""!=conditioner.getCompanyName().trim()&&
             null!=conditioner.getRelation()&&""!=conditioner.getRelation().trim()&&
             null!=conditioner.getTel()&&""!=conditioner.getTel().trim()&&
             null!=conditioner.getAddress()&&""!=conditioner.getAddress().trim()&&
             0==conditioner.getIsShop()&&
             null!=conditioner.getArea()&&""!=conditioner.getArea().trim()){

         conditioner.setCity(conditioner.getCity().trim());//去除头尾为空的字符串
         conditioner.setCounty(conditioner.getCounty().trim());//去除头尾为空的字符串
         return new BaseResult(400,"信息不完整");
     }

    conditioner.setId(IdGenerator.uuid());
    conditioner.setAvailable(1);
    conditioner.setType(1);

    int result =  conditionerMapper.insert(conditioner);
    if(result>0){
        return  BaseResult.success();
    }
    return BaseResult.error();


}

/**
 * 格力中央空调经销商信息
 */
public  BaseResult queryAirList(){
    List<Conditioner> list  = conditionerMapper.queryAirList();
    return  BaseResult.ok(list);
}

/**
 * 通过id查询格力中央空调的经销商信息
 */
public  Conditioner queryAirInfoByIdService(String id){
    return    conditionerMapper.queryAirInfoById(id);

}

/**
 * 格力中央空调信息更新
 */
public BaseResult airConditionerInfoUpdateService(Conditioner conditioner){

    //非空判断
    if(null!=conditioner.getCity()&&""!=conditioner.getCity().trim()&&
            null!=conditioner.getCounty()&&""!=conditioner.getCounty().trim()&&
            null!=conditioner.getCompanyName()&&""!=conditioner.getCompanyName().trim()&&
            null!=conditioner.getRelation()&&""!=conditioner.getRelation().trim()&&
            null!=conditioner.getTel()&&""!=conditioner.getTel().trim()&&
            null!=conditioner.getAddress()&&""!=conditioner.getAddress().trim()&&
            0==conditioner.getIsShop()&&
            null!=conditioner.getArea()&&""!=conditioner.getArea().trim()){

        conditioner.setCity(conditioner.getCity().trim());//去除头尾为空的字符串
        conditioner.setCounty(conditioner.getCounty().trim());//去除头尾为空的字符串
        return new BaseResult(400,"信息不完整");

    }

    conditioner.setAvailable(1);
    conditioner.setType(1);

    int result =  conditionerMapper.update(conditioner);
    if(result>0){
        return  BaseResult.success();
    }
    return BaseResult.error();

}

/**
 * 格力空调单个信息
 */
public  BaseResult  deleteAirService(String id){

     Integer result  = conditionerMapper.delete(id);

     if(result>0){
         return   BaseResult.success();
     }
     return   BaseResult.error();
}

/**
 * 批量删除
 */
public  BaseResult  deleteBranchAirService(String[] ids){
        Integer  result = conditionerMapper.deleteBatch(ids);
        if(result>0){
            return   BaseResult.success();
        }else {
            return  BaseResult.error();
        }

}




    /**
     * 格力中央空调表格信息入库
     */
    public  BaseResult importInfo2(InputStream filePath, String file) {
        List<Business> list = new ArrayList<>();
        List<Integer> results=  new ArrayList<>();
        String[] s;
        if (!file.endsWith(".xls") && !file.endsWith(".xlsx")) {
            //文件上传格式出错
            return  BaseResult.error();
        }
        Workbook workbook = null;
        try {
            //获取Workbook实例
            workbook = ExcelUtil.getWorkBook(file, filePath);


        Sheet sheet = workbook.getSheetAt(0);

        //去除sheet中的一些无效行，比如值为空但是有格式的空白行
        sheet = ExcelUtil.resetSheet(sheet);
        int lastRowNum = sheet.getLastRowNum();
        for (int i = 1; i < lastRowNum; i++) {
            Row row = sheet.getRow(i);
            int cells = sheet.getRow(i).getPhysicalNumberOfCells();

            //获取每一行的数值，并将其填入一个字符串的数组
            s = ExcelUtil.getExcelRows(row, cells);

           Conditioner air = new Conditioner();
            for(int j=0;j<s.length;j++){
                if (j == 0)
                    //user.setInstitute(s[j]);
                    air.setId(IdGenerator.uuid());
                else if (j == 1)
                    air.setCity(s[1].trim());//去除字符串
                else if (j == 2 )
                    air.setCounty(s[2].trim());//去除字符串
                else if (j == 3)
                    // bs.setBusinessType(s[j]);
                    air.setCompanyName(s[3]);
                else if (j == 4)
                    air.setRelation(s[4]);
                else if (j == 5)
                    air.setTel(s[5]);
                else if (j == 6)
                   air.setAddress(s[6]);
                else if (j == 7) {
                    if ("是".equals(s[7].trim())) {
                        air.setIsShop(1);
                    }
                    if ("否".equals(s[7].trim())) {
                        air.setIsShop(2);
                    }else {
                        air.setIsShop(1);
                    }
                }
                else if (j == 8)
                    air.setArea(s[8]);

            }
            air.setAvailable(1);
            air.setType(1);
            //首先查询数据库判断数据是否存在，如果存在则是更新操作，如果不存在则是插入操作
            Conditioner  a = conditionerMapper.queryAirInfoByCompanyName(air.getCompanyName());
            int result;
            if(a==null){
                 result= conditionerMapper.insert(air);
            }else {
                air.setId(a.getId());
                result=conditionerMapper.update(air);
            }

            //将结果存入集合中
            results.add(result);
        }
        // businessMapper.insertBatch(list);

        //循环检验结果
        for(int i=0;i<results.size();i++){
            if(results.get(i)<=0){
                return  BaseResult.error();
            }
        }
            return  BaseResult.success();
        } catch (Exception e) {
            e.printStackTrace();
            return  BaseResult.error();
        }



    }



    /**
     * 前台通过条件查询类查询对应的格力电器列表信息
     */
    public BaseResult  queryPortalListService(BusinessVo businessVo){
        businessVo.setChannelType(1);
         businessVo.setType(2);
        List<Business> list = businessMapper.queryPortalList(businessVo);
        return  BaseResult.ok(list);


    }

    /**
     * 通过编号查询
     */
    public BusinessResult queryCentifyInfoByIdService(String id){
        return   businessMapper.queryCentifyInfoById(id);

    }

    /**
     * 通过编号查询格力电器的证书信息
     */
    public BusinessResult queryAirCentifyInfoByIdService(String id){
       /* BusinessResult   businessResult =   businessMapper.queryAirCentifyInfoById(id);
        //查询对应的证书，同时将最新的证书信息存入
        List<BackgroundImg>   list  =    backgroundImgMapper.queryListByDealerType(businessResult.getBusinessType());
        businessResult.setBackground(list.get(0).getImgUrl());
        return   businessResult;*/
       return    businessMapper.queryCentifyInfoById(id);


    }


    //////////////////////////前台

    /**
     * 前台查询中央空调列表信息，条件查询
     */
    public  ConditionerResult queryAirPortalListService(ConditionerVo conditionerVo){
        //查询商家列表
         List<Conditioner> list= conditionerMapper.queryPortalList(conditionerVo);

         //查询背景图
         BackgroundImg b =  backgroundImgMapper.queryAirBackground();
        if(b.getImgUrl() ==null){
            b.setImgUrl("");
        }

        //重新封装,
        ConditionerResult  conditionerResult = new ConditionerResult();
        conditionerResult.setUrl(b.getImgUrl());
        conditionerResult.setList(list);
        return   conditionerResult;

    }










}
