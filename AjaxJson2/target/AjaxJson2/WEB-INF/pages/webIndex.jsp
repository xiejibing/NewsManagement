<%--
  Created by IntelliJ IDEA.
  User: xie
  Date: 2020/2/28
  Time: 下午1:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>网站首页</title>
</head>
<body>
<a href="/administrator/toAdminLogin">管理员登录</a>

<script src="/js/jquery-3.2.1.min.js"></script>
<script>

    function fun() {
        // // 使用ajax发送异步请求
        // $.ajax({
        //     url:"/user/testAjax",
        //     type:"post",
        //     data:'{"username":"谢吉兵","age":23}',
        //     contentType:"application/json;charset=UTF-8",
        //     dataType:"json",
        //     success:function (data) {
        //         alert(data.username);
        //     }
        // });

        $.ajax({
            url:"/news/test",
            type:"post",
            data:{"name":"谢吉兵","city":"23"},
            //contentType:"application/json;charset=UTF-8",
            dataType:"json",
            success:function (data) {
                alert(data.city);
                alert(data.name);
            }
        });


    }
</script>
<%--<input type="button" value="发送异步请求" onclick="fun()">--%>
<%--<input>--%>

</body>
</html>
