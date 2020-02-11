package com.zhiwei.po;

public class Classify {

    private Integer id;

    private String name;

    private Integer state;

    private String remake;

    private Integer thisSort;

    private String aUrl;

    private Integer father;

    private Integer classifyType;


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

    public Integer getClassifyType() {
        return classifyType;
    }

    public void setClassifyType(Integer classifyType) {
        this.classifyType = classifyType;
    }

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

    public Integer getState() {
        return state;
    }

    public void setState(Integer state) {
        this.state = state;
    }

    public String getRemake() {
        return remake;
    }

    public void setRemake(String remake) {
        this.remake = remake;
    }

    public Integer getThisSort() {
        return thisSort;
    }

    public void setThisSort(Integer thisSort) {
        this.thisSort = thisSort;
    }
}
