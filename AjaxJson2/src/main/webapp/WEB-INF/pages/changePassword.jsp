<%--
  Created by IntelliJ IDEA.
  User: xie
  Date: 2020/3/3
  Time: 下午4:45
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
    <title>修改密码</title>
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
        <h2 class="form-signin-heading"><i class="glyphicon glyphicon-log-in"></i> 修改密码</h2>
        <div class="form-group has-success has-feedback">
            <input type="text" class="form-control" id="fpasswordOld" placeholder="请输入原来密码" autofocus>
            <span class="glyphicon glyphicon-lock form-control-feedback"></span>
        </div>
        <div class="form-group has-success has-feedback">
            <input type="text" class="form-control" id="fpasswordNew" placeholder="请输入新密码" style="margin-top:10px;">
            <span class="glyphicon glyphicon-lock form-control-feedback"></span>
        </div>
        <div class="form-group has-success has-feedback">
            <input type="text" class="form-control" id="fpasswordNewConfirm" placeholder="请再次输入新密码" style="margin-top:10px;">
            <span class="glyphicon glyphicon-lock form-control-feedback"></span>
        </div>
        <a class="btn btn-lg btn-success btn-block" onclick="doChangePassword()" >确认修改</a>
    </form>
</div>

<%--获取管理员--%>
<input type="hidden" id="oldPassword" value="${administrator.admin_password}">
<input type="hidden" id="admin_name" value="${administrator.admin_name}">


<script src="/js/jquery-3.2.1.min.js"></script>
<script src="/bootstrap/js/bootstrap.min.js"></script>
<script src="/script/docs.min.js"></script>
<script src="/ztree/jquery.ztree.all-3.5.min.js"></script>
<script type="text/javascript" src="/jquery/layer/layer.js"></script>
<script type="text/javascript" src="/jquery/pagination/jquery.pagination.js"></script>

<script type="text/javascript">

    function doChangePassword() {
        var admin_name = $("#admin_name").val();//用户名
        var password = $("#oldPassword").val();//旧密码
        var admin_passworlOld = $("#fpasswordOld").val();
        var admin_passwordNew = $("#fpasswordNew").val();
        var admin_passwordNewConfirm = $("#fpasswordNewConfirm").val();
        var loadingindex = -1;
        $.ajax({
            url:"/administrator/changePassword",
            type:"post",
            data:{"admin_name":admin_name,"passwordNew":admin_passwordNew},
            dataType:"json",
            beforeSend:function () {
                //对输入的内容进行校验
                if(admin_passworlOld != password){
                    layer.msg("旧密码错误！",{time: 1000, icon: 2,end:function () {
                            //刷新页面
                            window.location.href="/administrator/toChangePassword";
                        }});
                    return false;
                }
                if (admin_passwordNew.length<3){
                    layer.msg("请至少输入３个字符！",{time: 1000, icon: 2,end:function () {
                            //刷新页面
                            window.location.href="/administrator/toChangePassword";
                        }});
                    return false;
                }

                if (admin_passwordNewConfirm != admin_passwordNew) //前后密码不一致
                {
                    layer.msg("前后输入的密码不一致！",{time: 1000, icon: 2,end:function () {
                            //刷新页面
                            window.location.href="/administrator/toChangePassword";
                        }});
                    return false;
                }

                loadingindex = layer.load(2,{time:10*1000});
                return true;
            },
            success:function (result) {
                if (result.success){
                    layer.close(loadingindex);
                    layer.msg(result.message,{time: 1000, icon: 1, shift: 2, end:function () {
                            //回到后台主页
                            window.location.href = "/news/toAdminIndex";
                        }});
                }
                else {
                    layer.msg(result.message,{time: 1000, icon: 1, shift: 2,end:function () {
                            //刷新
                            window.location.href="/administrator/toChangePassword";
                        }});
                }

            },
            error:function () {
                layer.msg("内部错误",{time: 3*1000, icon: 2, shift: 3});
            }
        });
    }

</script>

</body>
</html>
