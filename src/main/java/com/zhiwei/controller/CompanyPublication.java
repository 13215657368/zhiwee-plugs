package com.zhiwei.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.zhiwei.base.BaseController;
import com.zhiwei.dao.PubinfoMapper;
import com.zhiwei.dao.PublicationMapper;
import com.zhiwei.po.Pubinfo;
import com.zhiwei.po.Publication;
import com.zhiwei.po.vo.PublicationResult;
import com.zhiwei.po.vo.RequestPermission;
import com.zhiwei.po.vo.White;
import com.zhiwei.resultBase.BaseResult;
import com.zhiwei.service.FileUploadService;
import com.zhiwei.service.PublicationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * Created by jick on 2019/6/13.
 */
@Controller
@RequestMapping("/publication")
public class CompanyPublication   extends BaseController {

    @Autowired
    private PublicationService publicationService;

    @Autowired
    private PubinfoMapper   pubinfoMapper;

    @Autowired
    private FileUploadService fileUploadService;
    /**
     * 跳到刊物列表展示页面
     * @return
     */
    @RequestPermission(permissionCode = "007")
    @RequestMapping("/list")
    public   String  pubList(Model model){
        List<Publication> list =  publicationService.queryListService();
        model.addAttribute("pubList",list);
        return   "publication-list";
    }

    /**
     * 调到刊物管理界面，界面
     */
    @RequestPermission(permissionCode = "007")
    @RequestMapping("/addPage")
    public   String pubAdd(){
        return  "publication-add";
    }

    /**
     * 刊物添加
     */
    @White
    @RequestMapping("/add")
    @ResponseBody
    public BaseResult pubAddController(Publication publication){
       return   publicationService.publicationAddService(publication);
    }

    /**
     * 刊物删除
     */
    @RequestMapping("/delete")
    @ResponseBody
    public BaseResult pubDeleteController(Publication publication){
         int result1=   publicationService.deleteService(publication.getId());
         boolean  flag1 = fileUploadService.fileDelete(publication.getImg());


         //通过number查询pubInfo数据库里面的url
            PublicationResult pub=    publicationService.imgUrlInfoService(publication.getNumber());


            for(String url:pub.getContentUrl()){
                boolean  flag2 = fileUploadService.fileDelete(url);
                if (flag2==false){
                    return  BaseResult.error();
                }
            }
            //删除数据库里面的内容
            int  result2 = publicationService.contentImgDelBynum(publication.getNumber());

            if(result1>0&&result2>0&&flag1==true){
                return BaseResult.success();
            }
               return BaseResult.error();

    }

    /**
     * 刊物内容存入数据库
     */
    @RequestMapping("/pubContent/save")
    @ResponseBody
    public   BaseResult pubContentSave(Pubinfo pubinfo){
         return  publicationService.pubContentSaveService(pubinfo);
    }

    /**
     * 调到刊物的图片列表页面
     */
    @RequestPermission(permissionCode = "007")
    @RequestMapping("/picture/show")
    public  String  pubImgList(String number,Model model){
        PublicationResult result  = publicationService.imgUrlInfoService(number);
        model.addAttribute("result",result);
        return  "publication-picture-show";

    }

    /**
     * 刊物的内容列表删除
     */
    @RequestMapping("/img/delete")
    @ResponseBody
    public BaseResult pubImgDelete(String url){
        return  publicationService.contentImgDel(url);
    }

    /**
     * 刊物的主题图片删除（单张）
     */
    @RequestMapping("/titleImg/delete")
    @ResponseBody
    public  BaseResult pubTitleImgDelete(Publication publication){
        return publicationService.titleImgDel(publication);

    }

    /**
     * 刊物信息更新
     */
    @RequestMapping("/update")
    @ResponseBody
    public  BaseResult publicationInfUpdate(Publication publication){
        return publicationService.updateService(publication);

    }



    /**
     * 跳转到编辑
     */
    @RequestPermission(permissionCode = "007")
    @RequestMapping("/detail")
    public String editPage(Integer id,Model model){

        Publication publication = publicationService.queryByIdService(id);
        List<Pubinfo> result  = pubinfoMapper.queryUrlByNum2(publication.getNumber());
        model.addAttribute("pub",publication);
        model.addAttribute("pictureList",result);
        return   "publication-edit";
    }




    //////////////////////////////////////////////////////////////////////////////////////
    /**
     * 前台页面
     */
    /**
     * 前台页面效果展示
     * @param pageNo
     * @return
     */
    @White
    @RequestMapping("/portal/list")
    @ResponseBody
    public   BaseResult  pubInfoList(int  pageNo){
        int pageSize = 4;
        PageHelper.startPage(pageNo, pageSize);
        List<Publication> list =  publicationService.queryListService();
        PageInfo<Publication> pageInfo = new PageInfo<Publication>(list);
        BaseResult  result =    BaseResult.success(pageInfo);
        return   result;
    }


    /**
     * 刊物类容展示
     */
    @White
    @RequestMapping("/portal/content")
    @ResponseBody
    public   BaseResult  pubContent(String number){
        List<String> urls = publicationService.queryUrlByNumService(number);
        return    BaseResult.ok(urls);
    }




}
