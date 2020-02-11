package com.zhiwei.po;

import org.jeecgframework.poi.excel.annotation.Excel;

public class Business {

    private String id;
    @Excel(name = "授权编号")
    private String authNum;
    @Excel(name = "店铺编号")
    private String  shopNum;

    private  Integer type;

    @Excel(name = "公司名")
    private String companyName;
    @Excel(name = "法定代表人" )
    private String represent;
    @Excel(name = "联系电话")
    private String tel;
    @Excel(name = "经营类型",replace={"卖场_1","专卖店_2","专营店_3"})
    private Integer businessType;
    @Excel(name = "所在城市")
    private String city;
    @Excel(name = "区域")
    private String county;
    @Excel(name = "详细地址")
    private String location;
    @Excel(name = "星级")
    private String level;
    @Excel(name = "热线")
    private String hotline;
    @Excel(name = "备注")
    private String remark;
   // @Excel(name = "渠道类型",replace={"线上渠道_1","线下渠道_2"})
    private  Integer channelType;
  //  @Excel(name = "是否可用")
    private  Integer available;




    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getAuthNum() {
        return authNum;
    }

    public void setAuthNum(String authNum) {
        this.authNum = authNum;
    }

    public String getShopNum() {
        return shopNum;
    }

    public void setShopNum(String shopNum) {
        this.shopNum = shopNum;
    }

    public Integer getType() {
        return type;
    }

    public void setType(Integer type) {
        this.type = type;
    }

    public Integer getBusinessType() {
        return businessType;
    }

    public void setBusinessType(Integer businessType) {
        this.businessType = businessType;
    }

    public String getCompanyName() {
        return companyName;
    }

    public void setCompanyName(String companyName) {
        this.companyName = companyName;
    }

    public String getRepresent() {
        return represent;
    }

    public void setRepresent(String represent) {
        this.represent = represent;
    }

    public String getTel() {
        return tel;
    }

    public void setTel(String tel) {
        this.tel = tel;
    }

    public Integer getChannelType() {
        return channelType;
    }

    public void setChannelType(Integer channelType) {
        this.channelType = channelType;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getCounty() {
        return county;
    }

    public void setCounty(String county) {
        this.county = county;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public String getLevel() {
        return level;
    }

    public void setLevel(String level) {
        this.level = level;
    }

    public String getHotline() {
        return hotline;
    }

    public void setHotline(String hotline) {
        this.hotline = hotline;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    public Integer getAvailable() {
        return available;
    }

    public void setAvailable(Integer available) {
        this.available = available;
    }
}