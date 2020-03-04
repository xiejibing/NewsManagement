package com.xie.controller;

import com.xie.domain.Administrator;
import com.xie.dto.AjaxResult;
import com.xie.service.impl.AdministratorServiceImpl;
import org.apache.log4j.Logger;
import org.aspectj.weaver.loadtime.Aj;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@Controller
@RequestMapping("/administrator")
public class AdministratorController {
    @Autowired
    private AdministratorServiceImpl administratorService;
    private  Logger logger = Logger.getLogger(this.getClass());

    //跳转到真正的主页
    @RequestMapping("/webIndex")
    public String toIndex(){
        return "webIndex";
    }

    //跳转到管理员登录页面
    @RequestMapping("/toAdminLogin")
    public String toAdminLogin(){
        return "adminLogin";
    }
    //跳转到修改密码页面
    @RequestMapping("/toChangePassword")
    public String toChangePassword(){
        return "changePassword";
    }


    //管理员登录功能实现
    @RequestMapping("/adminLogin")
    public @ResponseBody AjaxResult adminLogin(String admin_name, String admin_password, HttpSession session, HttpServletResponse response) throws IOException {
        logger.info("adminLogin成功执行！-------前台　返回的数据:admin_name:"+admin_name+" admin_password:"+admin_password);
        AjaxResult result = new AjaxResult();
        //根据登录名从数据库中查询管理员信息
        Administrator administrator = administratorService.findByName(admin_name);
        if(administrator!=null ){//根据用户名查到了数据
            String password = administrator.getAdmin_password();
            if (password.equals(admin_password)) {//密码正确,请求转发到后台主页
                //用户对象添加到session中
                session.setAttribute("administrator",administrator);
                session.setMaxInactiveInterval(60*10);//
                result.setSuccess(true);
                result.setMessage("登录成功");
                logger.info("成功登录!");
            }
            else {
               result.setSuccess(false);
               result.setMessage("用户名或密码错误");
            }
        }
        else {
            result.setSuccess(false);
            result.setMessage("用户名或密码错误");
        }
        return result;
    }

//    修改密码功能

    @RequestMapping("/changePassword")
    public  @ResponseBody AjaxResult changePassword(String admin_name, String passwordNew){
        logger.info("changePassword在执行-------前台　返回的数据:admin_name:"+admin_name+" admin_password:"+passwordNew);
        AjaxResult result = new AjaxResult();
        try {
            administratorService.updatePassword(admin_name,passwordNew);
            result.setSuccess(true);
            result.setMessage("修改成功！");
        }catch (Exception e){
            result.setMessage("修改失败，发生内部错误！！!");
            result.setSuccess(false);
        }
        return result;
    }

    //注销
    @RequestMapping("logout")
    public String logout(HttpSession session, Model model){
        logger.info("changePassword在执行");
        session.removeAttribute("administrator");
        model.addAttribute("Msg","注销成功");
        return "webIndex";
    }
}
