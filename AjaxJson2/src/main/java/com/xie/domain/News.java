package com.xie.domain;

import org.springframework.stereotype.Repository;

import java.io.Serializable;
import java.util.Date;

@Repository
public class News implements Serializable {

    private long new_id;
    private String title;
    private int catagory_id;
    private String keywords;
    private String content;
    private Date create_time;

    public long getNew_id() {
        return new_id;
    }

    public void setNew_id(long new_id) {
        this.new_id = new_id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public int getCatagory_id() {
        return catagory_id;
    }

    public void setCatagory_id(int catagory_id) {
        this.catagory_id = catagory_id;
    }

    public String getKeywords() {
        return keywords;
    }

    public void setKeywords(String keywords) {
        this.keywords = keywords;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Date getCreate_time() {
        return create_time;
    }

    public void setCreate_time(Date create_time) {
        this.create_time = create_time;
    }

    @Override
    public String toString() {
        return "News{" +
                "new_id=" + new_id +
                ", title='" + title + '\'' +
                ", catagory_id=" + catagory_id +
                ", keywords='" + keywords + '\'' +
                ", content='" + content + '\'' +
                ", create_time=" + create_time +
                '}';
    }
}