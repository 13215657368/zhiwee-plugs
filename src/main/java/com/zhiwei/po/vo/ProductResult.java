package com.zhiwei.po.vo;

/**
 * Created by jick on 2019/7/9.
 */
public class ProductResult {
    private String   preTitle ;
    private String   nexTitle ;
    private int preId;
    private int nexId;

    public String getPreTitle() {
        return preTitle;
    }

    public void setPreTitle(String preTitle) {
        this.preTitle = preTitle;
    }

    public String getNexTitle() {
        return nexTitle;
    }

    public void setNexTitle(String nexTitle) {
        this.nexTitle = nexTitle;
    }

    public int getPreId() {
        return preId;
    }

    public void setPreId(int preId) {
        this.preId = preId;
    }

    public int getNexId() {
        return nexId;
    }

    public void setNexId(int nexId) {
        this.nexId = nexId;
    }
}
