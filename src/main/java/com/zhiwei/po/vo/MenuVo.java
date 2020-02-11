package com.zhiwei.po.vo;

import com.zhiwei.po.Menu;

import java.util.List;

public class MenuVo {

    private Menu parent;

    private List<Menu> chirldList;


    public Menu getParent() {
        return parent;
    }

    public void setParent(Menu parent) {
        this.parent = parent;
    }

    public List<Menu> getChirldList() {
        return chirldList;
    }

    public void setChirldList(List<Menu> chirldList) {
        this.chirldList = chirldList;
    }
}
