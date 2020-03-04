package com.xie.dao;

import com.xie.domain.News;
import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("newsDao")
public interface INewsDao {
//    查找所有
    @Select("select * from t_news order by create_time desc")
    List<News> findAll();
//    根据ｉｄ查询
    @Select("select * from t_news where new_id = #{id}")
    News queryById(int id);
//　　分页查询
    @Select("select * from t_news order by create_time desc limit #{startIndex},#{pageSize} ")
    List<News> queryLimit(@Param("startIndex") int startIndex, @Param("pageSize") int pageSize);
    //获取总数
    @Select("select count(*) from t_news")
    int count();
    //保存新闻
    @Insert("insert into t_news(title,catagory_id,keywords,content)values(#{title},#{catagory_id},#{keywords},#{content})")
    void saveNews(News news);
    //根据关键词查询
    @Select("select * from t_news where keywords like #{keywords}")
    List<News> queryByKeywords(String keywords);
    //删除新闻,根据id
    @Delete("delete from t_news where new_id =#{id}")
    void deleteNewsById(int id);

    //更新新闻
    @Update("update t_news set title = #{title}, catagory_id = #{catagory_id}, keywords=#{keywords}, content = #{content} where new_id = #{new_id}")
    void updateNews(News news);


}
