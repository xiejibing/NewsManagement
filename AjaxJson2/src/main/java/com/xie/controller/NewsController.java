package com.xie.controller;

import com.xie.domain.Administrator;
import com.xie.domain.News;
import com.xie.dto.*;
import com.xie.enums.NewsTypeName;
import com.xie.service.INewsService;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@Controller
@RequestMapping("/news")
public class NewsController {

    @Autowired
    private INewsService newsService;
    @Autowired
    private News news;
    private Logger logger = Logger.getLogger(this.getClass());
    /**
     * 从数据库中读一页新闻,发送到管理员新闻列表
     *
     * @param :默认页数设置为 pageSize:每页大小默认设置为１０　
     * @return
     */
    //页面跳转
    @RequestMapping("toAdminIndex")
    public String toAdminIndex(){
        return "adminIndex";
    }

    //异步请求,不是页面跳转而是返回数据

    @RequestMapping("/adminIndex")
    public @ResponseBody AjaxResult adminIndex( @RequestBody PageInfo pageInfo,
                             HttpSession session, HttpServletResponse response) throws IOException {
        logger.info("adminIndex方法被执行------>前台传回的数据+pageInfo:"+pageInfo);
        Administrator administrator = (Administrator) session.getAttribute("administrator");
        AjaxResult result = new AjaxResult();
        if (administrator!=null){//管理员已经登录了
            try{
                Page page = newsService.queryPage(pageInfo.getPageNo(), pageInfo.getPageSize());
                result.setSuccess(true);
                result.setPage(page);
            }catch (Exception e){
                result.setSuccess(false);
                e.printStackTrace();
                result.setMessage("数据查询失败");
            }
        }
        else {//重定向到登录界面
            response.sendRedirect("/administrator/adminLogin");
        }
        System.out.println(result.getPage().getPageSize());
        return  result;
    }

//    同步请求
//    @RequestMapping("/adminIndex.html")
//    public String adminIndex(@RequestParam(value = "pageNo", required = false, defaultValue = "1") Integer pageNo,
//                             @RequestParam(value = "pageSize", required = false, defaultValue = "10") Integer pageSize,
//                             Model model, HttpSession session){
//        Administrator administrator = (Administrator) session.getAttribute("administrator");
//        System.out.println( administrator.getAdmin_name());
//        if (administrator!=null){//管理员已经登录了
//            Page page = newsService.queryPage(pageNo, pageSize);
//            model.addAttribute("page",page);
//            return "adminIndex";
//        }
//        else {//重定向到登录界面
//            return "redirect:/administrator/adminLogin.html";
//        }
//    }

    //首页模糊查询
    @RequestMapping("/adminQueryText")
    public @ResponseBody AjaxResult adminQueryText(String queryText){
        logger.info("queryText方法被执行------>前台传回的数据+pageInfo:"+queryText);
        AjaxResult result = new AjaxResult();
        //从数据库中查询数据
        try{
            List<NewsData> newsDataList = newsService.queryByKeywords(queryText);
            result.setSuccess(true);
            result.setData(newsDataList);
        }catch (Exception e){
            result.setSuccess(false);
            result.setMessage("查找失败");
            e.printStackTrace();
        }
        return result;
    }

    //首页删除某条新闻功能
    @RequestMapping("/adminDeleteNews")
    public @ResponseBody AjaxResult adminDeleteNews(int id){
        logger.info("adminDeleteNews方法被执行------>前台传回的数据+id:"+id);
        AjaxResult result = new AjaxResult();
        //根据新闻标题删除
        try {
            newsService.deleteNewsById(id);
            result.setSuccess(true);
        }catch (Exception e){
            result.setSuccess(false);
            result.setMessage("删除失败");
            e.printStackTrace();
        }
        return result;

    }


    //跳转到新闻编辑页面
    @RequestMapping("/toNewsEditor")
    public String toNewsEditor(){
        logger.info("执行跳转到新闻编辑页面");
        return "editor";
    }


    //提交编辑的新闻
    @RequestMapping("/newsEditorSubmit")
    public @ResponseBody
    AjaxResult newsEditorSubmit(String title, String newsType, String keywords, String content){
        logger.info("提交新闻-------->title:"+title);
        AjaxResult result = new AjaxResult();
        try {
            newsService.saveNews(title,newsType,keywords,content);
            result.setSuccess(true);
            result.setMessage("提交成功！");
        }catch (Exception e){
            result.setSuccess(false);
            result.setMessage("提交失败!");
        }
        return result;
    }

    //跳转到新闻更新的页面
    @RequestMapping("/toUpdateNews")
    public String  toUpdateNews(int id, Model model) throws IOException {
        logger.info("跳转到updateNews页面------->id:"+id);
        model.addAttribute("id",id);
        return "updateNews";
    }

    //处理更新新闻信息的请求
    //根据id从数据库中查数据
    //将数据传输到前端
    @RequestMapping("/updateNews")
    public @ResponseBody  AjaxResult updateNews(int id){
        logger.info("updateNews方法执行-------------->id:"+id);
        AjaxResult result = new AjaxResult();
        try {
            NewsData newsData = newsService.queryById(id);
            result.setMessage("查询成功");
            result.setSuccess(true);
            result.setNewsData(newsData);
        }catch (Exception e){
            result.setSuccess(false);
            result.setMessage("查询失败");
            e.printStackTrace();
        }
        return result;
    }


    //提交经过编辑的新闻--更新
    @RequestMapping("/newsEditorUpdate")
    public @ResponseBody
    AjaxResult newsEditorUpdate(int id, String title, String newsType, String keywords, String content){
       logger.info("newsEditorUpdate方法执行----->title:"+title);
        AjaxResult result = new AjaxResult();
        try {
            newsService.updateNews(id,title,newsType,keywords,content);
            result.setSuccess(true);
            result.setMessage("提交成功！");
        }catch (Exception e){
            result.setSuccess(false);
            result.setMessage("提交失败!");
        }
        return result;
    }

    //跳转到预览页面
    //跳转到新闻更新的页面
    @RequestMapping("/toPreviewNews")
    public String  toPreviewNews(int id, Model model) throws IOException {
        logger.info("跳转到updateNews页面------>id:"+id);
        model.addAttribute("id",id);
        return "previewNews";
    }
}
