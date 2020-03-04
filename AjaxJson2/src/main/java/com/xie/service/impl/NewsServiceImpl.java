package com.xie.service.impl;

import com.xie.dao.INewsDao;
import com.xie.domain.News;
import com.xie.dto.NewsData;
import com.xie.dto.Page;
import com.xie.enums.NewsTypeName;
import com.xie.service.INewsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service("newsService")
public class NewsServiceImpl implements INewsService {

    @Autowired
    private INewsDao newsDao;
    @Autowired
    private  News news;

    @Override
    public List<NewsData> findAllForAdmin() {
        //从数据库中查询所有
        List<News> newsList = newsDao.findAll();
        List<NewsData> newsDataList = new ArrayList<NewsData>();
        int i = 1;
        for(News news : newsList){
            if (news.getCatagory_id()== NewsTypeName.COMPANY_NEWS.getType()) //公司新闻
                    newsDataList.add(new NewsData(news,i++, NewsTypeName.COMPANY_NEWS.getInfo()));
            else //热点新闻
                newsDataList.add(new NewsData(news,i++, NewsTypeName.INDUSTRY_NEWS.getInfo()));
        }
        return newsDataList;
    }

    @Override
    public Page queryPage(Integer pageNo, Integer pageSize) {
        Page page = new Page(pageNo,pageSize);
        int startIndex = page.getStartIndex();//开始索引位置
        List<News> newsList = newsDao.queryLimit(startIndex,pageSize);
        //封装成NewsData
        List<NewsData> newsDataList = new ArrayList<NewsData>();
        int i = 1;
        for(News news : newsList){
            if (news.getCatagory_id()== NewsTypeName.COMPANY_NEWS.getType()) //公司新闻
                newsDataList.add(new NewsData(news,i++, NewsTypeName.COMPANY_NEWS.getInfo()));
            else //热点新闻
                newsDataList.add(new NewsData(news,i++, NewsTypeName.INDUSTRY_NEWS.getInfo()));
        }
        page.setDataList(newsDataList);
        //获取总共新闻条数
        page.setTotalSize(newsDao.count());
        return page;
    }

    //根据关键查询
    @Override
    public List<NewsData> queryByKeywords(String text) {
        List<News> newsList = newsDao.queryByKeywords(text);
//        封装成ＮewsData
        List<NewsData> newsDataList = new ArrayList<NewsData>();
        int i = 1;
        for(News news : newsList){
            if (news.getCatagory_id()== NewsTypeName.COMPANY_NEWS.getType()) //公司新闻
                newsDataList.add(new NewsData(news,i++, NewsTypeName.COMPANY_NEWS.getInfo()));
            else //热点新闻
                newsDataList.add(new NewsData(news,i++, NewsTypeName.INDUSTRY_NEWS.getInfo()));
        }
        return newsDataList;
    }

    @Override
    public NewsData queryById(int id) {
        News news = newsDao.queryById(id);
        NewsData newsData;
        if (news.getCatagory_id()== NewsTypeName.COMPANY_NEWS.getType()){
            //公司新闻
            newsData = new NewsData(news,1,NewsTypeName.COMPANY_NEWS.getInfo());
        }
        else {
            //热点新闻
             newsData = new NewsData(news,1,NewsTypeName.INDUSTRY_NEWS.getInfo());
        }
        return newsData;
    }

    @Override
    public void saveNews(String title, String newsType, String keywords, String content) {
        int catagory_id ;
        //新闻类型匹配
        if (newsType == NewsTypeName.COMPANY_NEWS.getInfo()){
            catagory_id =NewsTypeName.COMPANY_NEWS.getType();
        }
        else catagory_id = NewsTypeName.INDUSTRY_NEWS.getType();
        news.setTitle(title);
        news.setCatagory_id(catagory_id);
        news.setKeywords(keywords);
        news.setContent(content);
        //调用dao
        newsDao.saveNews(news);
    }


    @Override
    public void deleteNewsById(int id) {
        newsDao.deleteNewsById(id);
    }

    @Override
    public void updateNews(int id, String title, String newsType, String keywords, String content) {

        //讲数据封装成Ｎｅｗｓ
        news.setNew_id(id);
        news.setContent(content);
        news.setTitle(title);
        news.setKeywords(keywords);
        if (newsType == NewsTypeName.COMPANY_NEWS.getInfo())
            news.setCatagory_id(NewsTypeName.COMPANY_NEWS.getType());
        else
            news.setCatagory_id(NewsTypeName.INDUSTRY_NEWS.getType());
        //调用newsDａo的更新操作
        newsDao.updateNews(news);
    }
}
