package com.zhiwei.controller;

import com.zhiwei.base.BaseController;
import com.zhiwei.dao.BusinessMapper;
import com.zhiwei.dao.ConditionerMapper;
import com.zhiwei.po.Area;
import com.zhiwei.po.BackgroundImg;
import com.zhiwei.po.Business;
import com.zhiwei.po.Conditioner;
import com.zhiwei.po.vo.*;
import com.zhiwei.resultBase.BaseResult;
import com.zhiwei.service.BusinessService;
import org.apache.commons.lang3.time.DateFormatUtils;
import org.apache.poi.ss.usermodel.Workbook;
import org.jeecgframework.poi.excel.ExcelExportUtil;
import org.jeecgframework.poi.excel.entity.ExportParams;
import org.jeecgframework.poi.excel.entity.enmus.ExcelType;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * Created by jick on 2019/7/22.
 */
@Controller
@RequestMapping("/business")
public class BusinessController extends BaseController {

    @Autowired
    private BusinessService businessService;

    @Autowired
    private BusinessMapper businessMapper;

    @Autowired
    private ConditionerMapper  conditionerMapper;


    /**
     * 商家信息列表
     *
     * @return
     */
    @RequestPermission(permissionCode = "009")
    @RequestMapping("/list")
    public String businessList(Model model) {
        BaseResult result = businessService.queryBusinessList();
        model.addAttribute("result", result);
        return "business-list";
        // return  model;
    }


    /**
     * 跳转到新闻列表增加页面
     *
     * @return
     */
    @RequestPermission(permissionCode = "009")
    @RequestMapping("/addPage")
    public String businessPage() {
        return "business-add";
    }

    /**
     * 查询城市列表
     */
    @RequestMapping("/cityList")
    @ResponseBody
    @White
    public List<Area> cityList() {
        return businessService.queryCityService();
    }

    /**
     * 查询城市对应的区域
     */
    @RequestMapping("/countryList")
    @ResponseBody
    @White
    public List<Area> countryList(Integer parentId) {
        return businessService.queryAreaService(parentId);
    }

    /**
     * 信息存入数据库
     */
    @RequestMapping("/save")
    @ResponseBody
    public BaseResult infoSave(Business business) {
        return businessService.infoSaveService(business);
    }

    /**
     * 代理商列表删除
     */
    @RequestMapping("/delete")
    @ResponseBody
    public BaseResult businessInfoDel(String id) {
        return businessService.deleteService(id);

    }

    /**
     * 批量列表删除
     */
    @RequestMapping("/BatchDelete")
    @ResponseBody
    public BaseResult businessInfoBatchDelete(String[] ids) {
        return businessService.BatchdeleteService(ids);

    }

    /**
     * 根据id查询对应的商家信息，用来做回显。
     */
    @RequestPermission(permissionCode = "009")
    @RequestMapping("/edit")
    public String businessEditPage(Model model, String id) {
        Business bs = businessService.businessInfoService(id);
        List<Area> country = businessService.queryAreaByParentIdService(bs.getCity());
        List<Area> cityList = businessService.queryCityService();
        model.addAttribute("bs", bs);
        model.addAttribute("cityList",cityList);
        model.addAttribute("countryList",country);
        return "business-edit";
    }

    /**
     * 格力商家信息更新
     */
    @RequestMapping("/update")
    @ResponseBody
    public BaseResult businessUpdate(Business business) {
        BaseResult result = businessService.update(business);
        return result;
    }




    /**
     * 格力电器商家信息批量导入
     */

    @ResponseBody
    @RequestMapping(value = "/importBsInfo", method = RequestMethod.POST)
    public BaseResult importUserInfo(@RequestParam("file") MultipartFile file) throws Exception {
        if (!file.isEmpty()) {
            InputStream inputStream = file.getInputStream();
            //userService.importUserInfo(inputStream, file.getOriginalFilename();
            BaseResult result = businessService.importInfo(inputStream, file.getOriginalFilename());
            return result;
        }
        return BaseResult.error();
    }




    /**
     * 将格力电器商家信息导入至Excel表格
     */
    @RequestMapping("/export")
    public void export(HttpServletRequest req, HttpServletResponse rsp) throws IOException {

        List<Business> result = new ArrayList<>();
        result =  businessMapper.queryBusinessList();
        // 导出Excel
        OutputStream os = rsp.getOutputStream();

        rsp.setContentType("application/x-download");
        // 设置导出文件名称
        rsp.setHeader("Content-Disposition",
                "attachment;filename=" + DateFormatUtils.format(new Date(), "yyyyMMddHHmmssSSS") + ".xlsx");
        ExportParams param = new ExportParams("全省授权书", "关键详细信息");
        param.setAddIndex(true);
        param.setType(ExcelType.XSSF);
        Workbook excel = ExcelExportUtil.exportExcel(param, Business.class, result);
        excel.write(os);
        os.flush();
        os.close();
    }

    /**
     * 前台通过条件查询类查询格力电器对应的列表信息
     */
    @White
    @RequestMapping("/portal/list")
    @ResponseBody
    public  BaseResult   queryPortalListCtroller(BusinessVo business){
        return  businessService.queryPortalListService(business);

    }



    /**
     * 前台通过id查询经销商的详细信息
     */
    @White
    @RequestMapping("/portal/queryById")
    @ResponseBody
    public  Business   queryPortalById(String id){
        Business bs = businessService.queryCentifyInfoByIdService(id);
        return bs;
    }



    /**
     * 前台通过id查询格力空调经销商的详细信息
     */
   /* @White
    @RequestMapping("/portal/queryAirById")
    @ResponseBody
    public  Business   queryPortalAirInfoById(String id){
        Business bs = businessService.queryAirCentifyInfoByIdService(id);
        return bs;
    }
*/

    /**
     * 跳转到格力中央空调类表
     */
    @RequestPermission(permissionCode = "009")
    @RequestMapping("/air/list")
    public String  airConditionalList(Model model) {
        BaseResult result = businessService.queryAirList();
        model.addAttribute("result", result);
        return "airConditioner-list";
    }

    /**
     * 跳转到格力中央空调添加页面
     */
    @RequestPermission(permissionCode = "009")
    @RequestMapping("/air/addPage")
    public String  airConditionalAddPage() {
        //BaseResult result = businessService.queryBusinessList();
        //model.addAttribute("result", result);
        return "airConditioner-add";
        // return  model;
    }

    //conditionerInfoSaveService
    /**
     * 中央空调信息添加
     */
    @RequestMapping("/air/add")
    @ResponseBody
    public  BaseResult airConditionalAdd(Conditioner conditioner) {
        return  businessService.conditionerInfoSaveService(conditioner);
        // return  model;
    }




    /**
     * 跳转到格力中央空调编辑页面
     */
    @RequestPermission(permissionCode = "009")
    @RequestMapping("/air/editPage")
   // @ResponseBody
    public String  airConditionalEditPage(String  id,Model model) {

        Conditioner conditioner  = businessService.queryAirInfoByIdService(id);

        List<Area> country = businessService.queryAreaByParentIdService(conditioner.getCity());
        List<Area> cityList = businessService.queryCityService();
        model.addAttribute("cityList",cityList);
        model.addAttribute("countryList",country);
        model.addAttribute("result",conditioner);
        return "airConditioner-edit";

    }

    @RequestMapping("/air/update")
    @ResponseBody
    public BaseResult airUpdateController(Conditioner conditioner){
        return  businessService.airConditionerInfoUpdateService(conditioner);
    }

    /**
     * 中央空调删除
     */
    @RequestMapping("/air/delete")
    @ResponseBody
    public BaseResult airInfoDel(String id) {
        return businessService.deleteAirService(id);
    }

    /**
     * 中央空调批量列表删除
     */
    @RequestMapping("/air/BatchDelete")
    @ResponseBody
    public BaseResult  airInfoBatchDelete(String[] ids) {
        return businessService.deleteBranchAirService(ids);
    }


    /**
     * 格力中央空调数据导入
     */
    @ResponseBody
    @RequestMapping(value = "/importBsInfo2", method = RequestMethod.POST)
    public BaseResult importUserInfo2(@RequestParam("file") MultipartFile file) throws Exception {
        if (!file.isEmpty()) {
            InputStream inputStream = file.getInputStream();
            //userService.importUserInfo(inputStream, file.getOriginalFilename();
            BaseResult result = businessService.importInfo2(inputStream, file.getOriginalFilename());
            return result;
        }
        return BaseResult.error();
    }



    /**
     * 将格力中央空调商家信息导入至Excel表格
     */
    @RequestMapping("/AirExport")
    public void AirExport(HttpServletRequest req, HttpServletResponse rsp) throws IOException {

        List<Conditioner> result = new ArrayList<>();
          result =  conditionerMapper.queryAirList();

        // 导出Excel
        OutputStream os = rsp.getOutputStream();

        rsp.setContentType("application/x-download");
        // 设置导出文件名称
        rsp.setHeader("Content-Disposition",
                "attachment;filename=" + DateFormatUtils.format(new Date(), "yyyyMMddHHmmssSSS") + ".xlsx");
        ExportParams param = new ExportParams("格力空调经销商信息", "关键详细信息");
        param.setAddIndex(true);
        param.setType(ExcelType.XSSF);
        Workbook excel = ExcelExportUtil.exportExcel(param, Conditioner.class, result);
        excel.write(os);
        os.flush();
        os.close();
    }


    //////////////////////////////////////前台
    /**
     * 查询中央空调
     */
    @RequestMapping("/AirPortalList")
    @ResponseBody
    @White
    public ConditionerResult queryAirPortalList(ConditionerVo conditionerVo){
         return   businessService.queryAirPortalListService(conditionerVo);
    }

    /**
     *
     * 查询中央空调的单个信息
     */

    @RequestMapping("/AirPortalInfo")
    @ResponseBody
    @White
    public  Conditioner  queryAirPortalInfo(String id){
        return   businessService.  queryAirInfoByIdService(id);
    }








}
