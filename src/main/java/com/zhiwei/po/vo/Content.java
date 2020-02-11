package com.zhiwei.po.vo;

import java.util.List;

/**
 * Created by jick on 2019/7/2.
 */
public class Content {
    private List<?> list;
    private  Object object;

    public List<?> getList() {
        return list;
    }

    public void setList(List<?> list) {
        this.list = list;
    }

    public Object getObject() {
        return object;
    }

    public void setObject(Object object) {
        this.object = object;
    }

    @Override
    public String toString() {
        return "Content{" +
                "list=" + list +
                ", object=" + object +
                '}';
    }
}
