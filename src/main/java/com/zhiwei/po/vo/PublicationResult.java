package com.zhiwei.po.vo;

import java.util.List;

/**
 * Created by jick on 2019/8/13.
 */
public class PublicationResult {
    private  String imgUrl;
    private List<String>  contentUrl;


    public String getImgUrl() {
        return imgUrl;
    }

    public void setImgUrl(String imgUrl) {
        this.imgUrl = imgUrl;
    }

    public List<String> getContentUrl() {
        return contentUrl;
    }

    public void setContentUrl(List<String> contentUrl) {
        this.contentUrl = contentUrl;
    }
}
