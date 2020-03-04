package com.xie.dto;

import com.xie.domain.News;

import java.io.Serializable;
import java.text.SimpleDateFormat;

/**
 * 讲数据库中查到的数据进行封装,供后台管理员看的新闻列表数据
 */
public class NewsData implements Serializable {

    private News news;
    private int id; //序号
    private String typeName;//类型
    private String date; //日期

    public NewsData(News news, int id, String typeName){
        this.news = news;
        this.id = id;
        this.typeName=typeName;
        //日期转为String
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        this.date = formatter.format(news.getCreate_time());
    }
    public News getNews() {
        return news;
    }

    public void setNews(News news) {
        this.news = news;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTypeName() {
        return typeName;
    }

    public void setTypeName(String typeName) {
        this.typeName = typeName;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    @Override
    public String toString() {
        return "NewsData{" +
                "news=" + news +
                ", id=" + id +
                ", typeName='" + typeName + '\'' +
                ", date='" + date + '\'' +
                '}';
    }
}
