package com.xie.test;

import com.xie.dao.IAdministratorDao;
import com.xie.dao.INewsDao;
import com.xie.domain.Administrator;
import com.xie.domain.News;
import com.xie.dto.NewsData;
import com.xie.service.INewsService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.io.IOException;
import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:applicationContext.xml"})
public class TestMybatis {
    @Autowired
    private INewsService newsService;
    @Autowired
    private INewsDao newsDao;
    @Autowired
    private IAdministratorDao administratorDao;
    @Test
    public void testFindAll() throws IOException {
//        List<News> newsList = newsDao.findAll();
//       for (News news:newsList){
//           System.out.println(news.getTitle());
//       }
//        NewsData newsData = newsService.queryById(20);
//        System.out.println(newsData.getDate());
        Administrator administrator = new Administrator();
        administrator.setAdmin_name("admin");
        administrator.setAdmin_password("shanghaibaosi2010");
        administratorDao.updateAdministrator(administrator);
        System.out.println(administratorDao.findByName("admin"));
    }
}
