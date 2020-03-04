package com.xie.dto;

import java.util.List;

public class AjaxResult {

    private boolean success;
    private String message;
    private Page page;
    private List<NewsData> data;
    private NewsData newsData;

    public NewsData getNewsData() {
        return newsData;
    }

    public void setNewsData(NewsData newsData) {
        this.newsData = newsData;
    }

    public boolean getSuccess() {
        return success;
    }

    public void setSuccess(boolean success) {
        this.success = success;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public Page getPage() {
        return page;
    }

    public void setPage(Page page) {
        this.page = page;
    }

    public Object getData() {
        return data;
    }

    public void setData(List<NewsData> data) {
        this.data = data;
    }

}
