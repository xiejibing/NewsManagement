package com.xie.dto;

import java.util.List;

/**
 * 后台管理系统的新闻列表页
 */
public class Page {

    private Integer pageNo;//当前页编号
    private Integer pageSize;//当前页显示条数
    private Integer totalSize;//总共新闻条数
    private List<NewsData> dataList;//新闻
    private Integer totalPages;//新闻页数

    public Page(Integer pageNo, Integer pageSize){
        if (pageNo<=0)
            this.pageNo = 1;
        else
            this.pageNo = pageNo;
        if (pageSize<=0)
            this.pageSize =10;//默认每页显示１0条

        else
            this.pageSize=pageSize;
    }

    public Integer getPageNo() {
        return pageNo;
    }

    public void setPageNo(Integer pageNo) {
        this.pageNo = pageNo;
    }

    public Integer getPageSize() {
        return pageSize;
    }

    public void setPageSize(Integer pageSize) {
        this.pageSize = pageSize;
    }

    public Integer getTotalSize() {
        return totalSize;
    }

    public void setTotalSize(Integer totalSize) {
        this.totalSize = totalSize;
        //求出总页数
        if (totalSize%pageSize == 0)
            this.totalPages = totalSize/pageSize;
        else
            this.totalPages = totalSize/pageSize+1;
    }

    public List<NewsData> getDataList() {
        return dataList;
    }

    public void setDataList(List<NewsData> dataList) {
        this.dataList = dataList;
    }

    public Integer getTotalPages() {
        return totalPages;
    }

    //私有外部不能调用
    private void setTotalPages(Integer totalPages) {
        this.totalPages = totalPages;
    }

    //初始索引位置
    public Integer getStartIndex(){
        return (this.pageNo-1)*pageSize;
    }

}
