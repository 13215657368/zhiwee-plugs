package com.zhiwei.po;

import org.jeecgframework.poi.excel.annotation.Excel;

public class Conditioner {
    private String id;


    //   @Excel(name = "公司名")
    @Excel(name = "区域")
    private String city;

    private Integer cityId;
    @Excel(name = "县级" )
    private String county;

    private Integer countyId;
     @Excel(name = "公司名称")
    private String companyName;
     @Excel(name = "联系人")
    private String relation;
     @Excel(name = "电话")
    private String tel;
      @Excel(name = "地址")
    private String address;
     @Excel(name = "是否为中央空调",replace = {"是_1","否_2"})
    private Integer isShop;
    @Excel(name = "面积")
    private String area;

    private  Integer available;

    private  Integer type;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public Integer getCityId() {
        return cityId;
    }

    public void setCityId(Integer cityId) {
        this.cityId = cityId;
    }

    public String getCounty() {
        return county;
    }

    public void setCounty(String county) {
        this.county = county;
    }

    public Integer getCountyId() {
        return countyId;
    }

    public void setCountyId(Integer countyId) {
        this.countyId = countyId;
    }

    public String getCompanyName() {
        return companyName;
    }

    public void setCompanyName(String companyName) {
        this.companyName = companyName;
    }

    public String getRelation() {
        return relation;
    }

    public void setRelation(String relation) {
        this.relation = relation;
    }

    public String getTel() {
        return tel;
    }

    public void setTel(String tel) {
        this.tel = tel;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public Integer getIsShop() {
        return isShop;
    }

    public void setIsShop(Integer isShop) {
        this.isShop = isShop;
    }

    public String getArea() {
        return area;
    }

    public void setArea(String area) {
        this.area = area;
    }

    public Integer getAvailable() {
        return available;
    }

    public void setAvailable(Integer available) {
        this.available = available;
    }

    public Integer getType() {
        return type;
    }

    public void setType(Integer type) {
        this.type = type;
    }
}