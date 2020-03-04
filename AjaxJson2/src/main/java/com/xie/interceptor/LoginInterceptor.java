package com.xie.interceptor;

import com.xie.domain.Administrator;
import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
创建登录拦截器,不能跳过用户登录界面进入后台主页
 */
public class LoginInterceptor implements HandlerInterceptor {


    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        //获取请求的ＵＲＬ
        String url = request.getRequestURI();
        //除了登录请求的url其他都进行拦截
        if(url.indexOf("/toAdminLogin")>=0) //如果该字符串在ｕｒｌ中的位置大于0,则不拦截，请求发到controller执行
            return true;
        //不是登录的ｕｒｌ请求,判断之前是不是登录过，如果登陆过就不需要登录
        //从session中取出用户信息
        HttpSession session = request.getSession();
        Administrator administrator = (Administrator)session.getAttribute("administrator");
        if (administrator!=null){
            return true;
        }
        request.getRequestDispatcher("/WEB-INF/pages/adminLogin.jsp").forward(request,response);
        return false;
    }
}
