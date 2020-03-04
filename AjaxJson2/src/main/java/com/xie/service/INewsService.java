package com.xie.service;

import com.xie.domain.News;
import com.xie.dto.NewsData;
import com.xie.dto.Page;

import java.util.List;

/**
 * 新闻服务接口
 */
public interface INewsService {
    //查找所有给后台管理员
    List<NewsData> findAllForAdmin();

    //按页查找
    Page queryPage(Integer pageNo, Integer pageSize);

    //根据关键词查找
    List<NewsData> queryByKeywords(String text);

    //根据id查找
    NewsData queryById(int id);

    //保存新闻
    void saveNews(String title, String newsType, String keywords, String content);

    //删除新闻
    void deleteNewsById(int id);

    //更新新闻
    void updateNews(int id, String title, String newsType, String keywords, String content );
}

