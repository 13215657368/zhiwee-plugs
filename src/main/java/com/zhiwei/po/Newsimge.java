package com.zhiwei.po;

public class Newsimge {
    private Integer id;

    private String artnum;

    private String imgurl;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getArtnum() {
        return artnum;
    }

    public void setArtnum(String artnum) {
        this.artnum = artnum == null ? null : artnum.trim();
    }

    public String getImgurl() {
        return imgurl;
    }

    public void setImgurl(String imgurl) {
        this.imgurl = imgurl == null ? null : imgurl.trim();
    }
}