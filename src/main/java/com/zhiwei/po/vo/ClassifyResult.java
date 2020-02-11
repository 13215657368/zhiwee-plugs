package com.zhiwei.po.vo;

import com.zhiwei.po.Classify;

import java.util.List;

public class ClassifyResult  {

    private Integer id;

    private String name;

    private String aUrl;

    private Integer father;

    private List<ClassifyResult> sonList;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getaUrl() {
        return aUrl;
    }

    public void setaUrl(String aUrl) {
        this.aUrl = aUrl;
    }

    public Integer getFather() {
        return father;
    }

    public void setFather(Integer father) {
        this.father = father;
    }

    public List<ClassifyResult> getSonList() {
        return sonList;
    }

    public void setSonList(List<ClassifyResult> sonList) {
        this.sonList = sonList;
    }
}
