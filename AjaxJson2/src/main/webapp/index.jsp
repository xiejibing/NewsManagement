<%--
  Created by IntelliJ IDEA.
  User: xie
  Date: 2020/2/28
  Time: 上午11:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>首页</title>
</head>
<body>
<%--进入主页--%>
<jsp:forward page="/administrator/webIndex"></jsp:forward>

<script src="/js/jquery-3.2.1.min.js"></script>
<script>
    function fun() {
        //使用ajax发送异步请求
        $.ajax({
            url:"/user/testAjax",
            type:"post",
            data:'{"username":"谢吉兵","age":23}',
            contentType:"application/json;charset=UTF-8",
            datatype:"json",
            success:function (data) {
                alert(data.username);
            }
        });
    }
</script>
<input type="button" value="发送异步请求" onclick="fun()">
<input>

</body>
</html>
