package com.xie.dto;

import java.io.Serializable;

/**
 * 封装前台提交的json
 */
public class PageInfo implements Serializable {

    private int pageNo;
    private int pageSize;

    public int getPageNo() {
        return pageNo;
    }

    public void setPageNo(int pageNo) {
        this.pageNo = pageNo;
    }

    public int getPageSize() {
        return pageSize;
    }

    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }

    @Override
    public String toString() {
        return "pageInfo{" +
                "pageNo='" + pageNo + '\'' +
                ", pageSize='" + pageSize + '\'' +
                '}';
    }
}
