<%--
  Created by IntelliJ IDEA.
  User: xie
  Date: 2020/2/21
  Time: 下午4:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>

<html lang="zh-CN">
<head>
    <meta charset="GB18030">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="keys" content="">
    <meta name="author" content="">
    <link rel="stylesheet" href="/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="/css/font-awesome.min.css">
    <link rel="stylesheet" href="/css/login.css">
    <style>

    </style>
    <title>管理员登录</title>
</head>

<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
    <div class="container">
        <div class="navbar-header">
            <div align="center"><a class="navbar-brand" href="/administrator/webIndex" style="font-size:32px;">上海宝四</a></div>
        </div>
    </div>
</nav>

<div class="container">

    <form class="form-signin" role="form">
        <h2 class="form-signin-heading"><i class="glyphicon glyphicon-log-in"></i> 管理员登录</h2>
        <div class="form-group has-success has-feedback">
            <input type="text" class="form-control" id="fname" placeholder="请输入登录账号" autofocus>
            <span class="glyphicon glyphicon-user form-control-feedback"></span>
        </div>
        <div class="form-group has-success has-feedback">
            <input type="text" class="form-control" id="fpassword" placeholder="请输入登录密码" style="margin-top:10px;">
            <span class="glyphicon glyphicon-lock form-control-feedback"></span>
        </div>
        <a class="btn btn-lg btn-success btn-block" onclick="dologin()" > 登录</a>
    </form>
</div>

<script src="/js/jquery-3.2.1.min.js"></script>
<script src="/bootstrap/js/bootstrap.min.js"></script>
<script src="/script/docs.min.js"></script>
<script src="/ztree/jquery.ztree.all-3.5.min.js"></script>
<script type="text/javascript" src="/jquery/layer/layer.js"></script>
<script type="text/javascript" src="/jquery/pagination/jquery.pagination.js"></script>

<script type="text/javascript">

    function dologin() {
        var admin_name = $("#fname").val();
        var admin_password = $("#fpassword").val();
        var loadingindex = -1;

        $.ajax({
            url:"/administrator/adminLogin",
            type:"post",
            data:{"admin_name":admin_name,"admin_password":admin_password},
            dataType:"json",
            beforeSend:function () {
                //对输入的内容进行校验
                if(admin_name == ''){
                    layer.msg("用户名不能为空",{time: 1000, icon: 2,end:function () {
                            //刷新页面
                            window.location.href="/administrator/toAdminLogin";
                        }});
                    return false;//不发送请求
                }
                else {
                    loadingindex = layer.load(2,{time:10*1000});
                    return true;
                }
            },
            success:function (result) {
                if (result.success){
                    layer.close(loadingindex);
                    layer.msg(result.message,{time: 1000, icon: 1,end:function () {
                            window.location.href = "/news/toAdminIndex";
                        }});
                }
                else {
                    layer.msg(result.message,{time: 1000, icon: 2,end:function () {
                            window.location.href="/administrator/toAdminLogin";
                        }});
                }
            },
            error:function () {
                layer.msg("内部错误",{time: 2000, icon: 2});
            }

        });
    }

</script>

</body>
</html>
