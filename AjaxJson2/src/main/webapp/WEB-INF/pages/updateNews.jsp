<%--
  Created by IntelliJ IDEA.
  User: xie
  Date: 2020/3/1
  Time: 下午6:04
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<html>
<head>
    <meta charset="GB18030">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <link rel="stylesheet" href="/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="/css/font-awesome.min.css">
    <link rel="stylesheet" href="/css/main.css">`
    <link rel="stylesheet" href="/css/doc.min.css">
    <link rel="stylesheet" href="/ztree/zTreeStyle.css">
    <link rel="stylesheet" href="/jquery/pagination/pagination.css">

    <style>
        .tree li {
            list-style-type: none;
            cursor:pointer;
        }
    </style>
    <title>修改新闻</title>
</head>
<body>
<%@ include file="commom/head.jsp"%>

<div class="container-fluid">
    <div class="row">
        <div class="col-sm-3 col-md-2 sidebar">
            <div class="tree">
                <ul style="padding-left:0px;" class="list-group">
                    <li class="list-group-item tree-closed">
                        <a href="main.html"><i class="glyphicon glyphicon-dashboard"></i> 控制面板</a>
                    </li>
                    <li class="list-group-item">
                        <span><i class="glyphicon glyphicon glyphicon-tasks"></i> 新闻管理 <span class="badge"
                                                                                             style="float:right">3</span></span>
                        <ul style="margin-top:10px;">
                            <li style="height:30px;">
                                <a href="/news/toAdminIndex.do"><i
                                        class="glyphicon glyphicon-king"></i> 文章列表</a>
                            </li>
                            <li style="height:30px;">
                                <a href="/news/toNewsEditor"  style="color:red;"><i class="glyphicon glyphicon-user">添加文章</i> </a>
                            </li>
                            <%--                            <li style="height:30px;">--%>
                            <%--                                <a href="permission.html" ><i class="glyphicon glyphicon-lock"></i> 许可维护</a>--%>
                            <%--                            </li>--%>
                        </ul>
                    </li>
                    <li class="list-group-item tree-closed">
                        <span><i class="glyphicon glyphicon-ok"></i> 产品管理 <span class="badge"
                                                                                style="float:right">3</span></span>
                        <ul style="margin-top:10px;display:none;">
                            <li style="height:30px;">
                                <a href="auth_cert.html"><i class="glyphicon glyphicon-check"></i> 产品列表</a>
                            </li>
                            <li style="height:30px;">
                                <a href="auth_adv.html"><i class="glyphicon glyphicon-check"></i> 添加产品</a>
                            </li>
                            <%--                            <li style="height:30px;">--%>
                            <%--                                <a href="auth_project.html"><i class="glyphicon glyphicon-check"></i> 项目审核</a>--%>
                            <%--                            </li>--%>
                        </ul>
                    </li>
                    <li class="list-group-item tree-closed">
                        <span><i class="glyphicon glyphicon-th-large"></i> 业务管理 <span class="badge" style="float:right">7</span></span>
                        <ul style="margin-top:10px;display:none;">
                            <li style="height:30px;">
                                <a href="cert.html"><i class="glyphicon glyphicon-picture"></i> 资质维护</a>
                            </li>
                            <li style="height:30px;">
                                <a href="type.html"><i class="glyphicon glyphicon-equalizer"></i> 分类管理</a>
                            </li>
                            <li style="height:30px;">
                                <a href="process.html"><i class="glyphicon glyphicon-random"></i> 流程管理</a>
                            </li>
                            <li style="height:30px;">
                                <a href="advertisement.html"><i class="glyphicon glyphicon-hdd"></i> 广告管理</a>
                            </li>
                            <li style="height:30px;">
                                <a href="message.html"><i class="glyphicon glyphicon-comment"></i> 消息模板</a>
                            </li>
                            <li style="height:30px;">
                                <a href="project_type.html"><i class="glyphicon glyphicon-list"></i> 项目分类</a>
                            </li>
                            <li style="height:30px;">
                                <a href="tag.html"><i class="glyphicon glyphicon-tags"></i> 项目标签</a>
                            </li>
                        </ul>
                    </li>
                    <li class="list-group-item tree-closed">
                        <a href="param.html"><i class="glyphicon glyphicon-list-alt"></i> 参数管理</a>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</div>

<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
    <div class="panel-heading">
        <h3 class="panel-title"><i class="glyphicon glyphicon-th"></i> 编辑新闻</h3>
    </div>
    <div class="panel panel-default">
        <div class="panel-heading">新闻数据<div style="float:right;cursor:pointer;" data-toggle="modal" data-target="#myModal"><i class="glyphicon glyphicon-question-sign"></i></div></div>
        <div class="panel-body">
            <form role="form">
                <div class="form-group">
                    <label for="ftitle">新闻标题</label>
                    <input type="text" class="form-control" id="ftitle" placeholder="标题不可为空" >
                </div>
                <div class="form-group">
                    <label for="fNewsType">新闻分类</label>
                    <select class="form-control" id="fNewsType">
                        <option value="industryNews">行业新闻</option>
                        <option value="companyNews">公司新闻</option>
                    </select>
                </div>
                <div class="form-group">
                    <label for="fkeywords">关键词</label>
                    <input type="text" class="form-control" id="fkeywords" placeholder="关键词不能为空">
                </div>

                <div class="form-group">
                    <label for="container">编辑新闻</label>
                    <script id="container" name="content" type="text/plain">
                    这里输入新闻内容
                </script>
                </div>

                <button type="button" class="btn btn-success" id="submitBtn"><i class="glyphicon glyphicon-edit"></i>提交</button>
                <button type="button" class="btn btn-danger" id="resetBtn"><i class="glyphicon glyphicon-refresh"></i> 重置</button>
            </form>
        </div>
    </div>
</div>
<%--接收从后端传过来的一个参数--%>
<input type="hidden" id="id" value="${id}">

<script src="/js/jquery-3.2.1.min.js"></script>
<script src="/bootstrap/js/bootstrap.min.js"></script>
<script src="/script/docs.min.js"></script>
<script src="/ztree/jquery.ztree.all-3.5.min.js"></script>
<script type="text/javascript" src="/jquery/layer/layer.js"></script>
<script type="text/javascript" src="/jquery/pagination/jquery.pagination.js"></script>
<!-- 配置文件 -->
<script type="text/javascript" src="/ueditor/ueditor.config.js" ></script>
<!-- 编辑器源码文件 -->
<script type="text/javascript" src="/ueditor/ueditor.all.js" ></script>
<script type="text/javascript" src="/ueditor/lang/zh-cn/zh-cn.js"></script>
<script type="text/javascript">
    var ue = UE.getEditor('container');
    //页面加载完执行ztree效果
    $(function () {
        $(".list-group-item").click(function () {
            if ($(this).find("ul")) {
                $(this).toggleClass("tree-closed");
                if ($(this).hasClass("tree-closed")) {
                    $("ul", this).hide("fast");
                } else {
                    $("ul", this).show("fast");
                }
            }
        });

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
                //将信息放到输入框内
                $("#ftitle").val(title);
                $("#fkeywords").val(keywords);
                if(newsType == "公司新闻"){
                    $("#fNewsType").val("companyNews"); //设置selector选中状态
                }
                else {
                    $("#fNewsType").val("industryNews");
                }
                ue.setContent(content);
                layer.msg("成功加载新闻数据！",{time: 1000, icon: 1, shift: 6});
            },
            error:function () {
                layer.msg("加载失败",{time: 1000, icon: 2, shift: 3});
            }

        })

    });



    //提交表单,异步请求，往后台传数据
    //后台接受数据封装成News对象,写入数据库
    //返回新闻列表
    $("#submitBtn").click(function () {
        //从表单获取数据
        var title = $("#ftitle").val();
        var newsType = $("#fNewsType").find("option:selected").text();
        var keywords = $("#fkeywords").val();
        var content = ue.getContent();
        //获取当前的id
        var id = $("#id").val();
        //json数据
        var news = {"id":id,"title":title,"newsType":newsType,"keywords":keywords,"content":content};
        var loadingIndex = -1;
        $.ajax({
            url:"/news/newsEditorUpdate",
            type:"post",
            data:news,
            //contentType:"application/json;charset=UTF-8",
            dataType:"json",
            beforeSend:function(){
                //检查输入数据是否合法
                if (title == ''){
                    layer.msg("标题不能为空",{time: 1000, icon: 0, shift: 6})
                    return false;
                }
                if (keywords == ''){
                    layer.msg("关键词不能为空",{time: 1000, icon: 0, shift: 6})
                    return false;
                }
                if (content == ''){
                    layer.msg("内容不能为空",{time: 1000, icon: 0, shift: 6})
                    return false;
                }
                loadingIndex = layer.load(2,{time:10*1000});
                return true;
            },
            success:function (result) {
                layer.close(loadingIndex);
                layer.msg(result.message,{time: 1000, icon: 1, shift: 6});
                window.location.href="/news/toAdminIndex";

            },
            error:function () {
                layer.msg("发生错误",{time: 1000, icon: 2, shift: 6})
            }
        });

    });

    //重置:页面刷新
    $("#resetBtn").click(function () {
        //刷新页面
        window.location.href="/news/toNewsEditor";
    });

</script>
</body>
</html>
