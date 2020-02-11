package com.zhiwei.controller;

import com.zhiwei.base.BaseController;
import com.zhiwei.dao.UrlInfoMapper;
import com.zhiwei.po.UrlInfo;
import com.zhiwei.po.vo.White;
import com.zhiwei.resultBase.BaseResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class UrlController extends BaseController {

    @Autowired
    private UrlInfoMapper urlInfoMapper;


    @RequestMapping("/getUrlInfo")
    @White
    public BaseResult getUrlController(){
        UrlInfo urlInfo =   urlInfoMapper.query();
        return   BaseResult.ok(urlInfo);
    }



}
