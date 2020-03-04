<%--
  Created by IntelliJ IDEA.
  User: xie
  Date: 2020/3/2
  Time: 下午9:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <title>新闻预览</title>
</head>
<body>
<%--接收从后端传过来的一个参数--%>
<input type="hidden" id="id" value="${id}">
<div id ="title" align="center">
</div><br>
<%--<img src="/ueditor/jsp/upload/image/20200303/1583238063981099901.jpg">--%>
关键词：<div id="keywords"></div>
分类：<div id="catagory"></div><br>
发布时间：<div id="create_time"></div>
<div id = "content">

</div>

<script src="/js/jquery-3.2.1.min.js"></script>
<script src="/bootstrap/js/bootstrap.min.js"></script>
<script src="/script/docs.min.js"></script>
<script type="text/javascript" src="/jquery/layer/layer.js"></script>
<script type="text/javascript">
    $(function () {
        //接受id参数
        var id = $("#id").val();
        //发出一个异步请求，根据id查询这条新闻数据，显示在编辑页面上
        var loadingindex = -1;
        $.ajax({
            url:"/news/updateNews",
            type:"post",
            data:{"id":id},
            dataType:"json",
            beforeSend:function () {
                loadingindex = layer.load(2,{time:10*1000});
                return true;
            },
            success:function (result) {
                layer.close(loadingindex);
                //获取各个信息
                var title = result.newsData.news.title;
                var newsType = result.newsData.typeName;
                var keywords = result.newsData.news.keywords;
                var content = result.newsData.news.content;
                var create_time = result.newsData.date;
                $("#title").html('<h2>'+title+'</h2>');
                $("#keywords").html(keywords);
                $("#catagory").html(newsType);
                $("#create_time").html(create_time);
                $("#content").html(content);

                layer.msg("成功加载新闻数据！",{time: 1000, icon: 1, shift: 6});
            },
            error:function () {
                layer.msg("加载失败",{time: 1000, icon: 2, shift: 3});
            }

        });

    });


</script>

</body>
</html>
