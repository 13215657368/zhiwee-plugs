package com.zhiwei.po.vo;

import com.zhiwei.po.Product;

/**
 * Created by jick on 2019/8/9.
 */
public class ProductVo extends Product {
    private  String classifyName;
    private  String   url;

    private  String  describes;

    private  String   params;



    public String getClassifyName() {
        return classifyName;
    }

    public void setClassifyName(String classifyName) {
        this.classifyName = classifyName;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public String getDescribes() {
        return describes;
    }

    public void setDescribes(String describes) {
        this.describes = describes;
    }

    public String getParams() {
        return params;
    }

    public void setParams(String params) {
        this.params = params;
    }
}
