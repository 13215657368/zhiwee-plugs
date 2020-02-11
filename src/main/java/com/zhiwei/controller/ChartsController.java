package com.zhiwei.controller;

import com.zhiwei.base.BaseController;
import com.zhiwei.dao.ProductMapper;
import com.zhiwei.po.Chart;
import com.zhiwei.po.vo.White;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("/chartp")
public class ChartsController extends BaseController {


    @Autowired
    private ProductMapper productMapper;


    /**
     * 跳转到报表页面
     */
     @RequestMapping("/list")
     public  String  toPage(){
        return  "charts";

     }


     @RequestMapping("/info")
     @ResponseBody
     @White
     public List<Chart> getInfo(){
         return productMapper.queryChar();
     }


}
