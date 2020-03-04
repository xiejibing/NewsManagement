
<%--
  Created by IntelliJ IDEA.
  User: xie
  Date: 2020/2/23
  Time: 下午5:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
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
            cursor: pointer;
        }
    </style>
    <title>后台主页</title>
</head>

<body>
<%--加载菜单--%>
<%@ include file="commom/menu.jsp"%>

<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
    <div class="panel panel-default">
        <div class="panel-heading">
            <h3 class="panel-title"><i class="glyphicon glyphicon-th"></i> 新闻列表</h3>
        </div>
        <div class="panel-body">
            <form class="form-inline" role="form" style="float:left;">
                <div class="form-group has-feedback">
                    <div class="input-group">
                        <div class="input-group-addon">查询条件</div>
                        <input id ="queryText" class="form-control has-success" type="text" placeholder="根据关键词查询">
                    </div>
                </div>
                <button id = "queryBtn" type="button" class="btn btn-warning"><i class="glyphicon glyphicon-search"></i> 查询</button>
            </form>
            <button id = "refreshBtn" type="button" class="btn btn-danger" style="float:right;margin-left:10px;"><i class="glyphicon glyphicon-refresh"></i> 刷新
            </button>
            <button type="button" class="btn btn-primary" style="float:right;"
                    onclick="window.location.href='/news/toNewsEditor'"><i class="glyphicon glyphicon-plus"></i> 新增
            </button>
            <br>
            <hr style="clear:both;">
            <div class="table-responsive">
                <table class="table  table-bordered">
                    <thead align="center">
                    <tr align="center">
                        <th width="50" align="center">序号</th>
                        <th width="100" align="center">类别</th>
                        <th align="center">标题</th>
                        <th align="center">关键词</th>
                        <th width="180" align="center">发表日期</th>
                        <th width="200" align="center">操作</th>
                    </tr>
                    </thead>

                    <tbody>  </tbody>
                    <%-- 表脚 --%>
                    <tfoot>
                    </tfoot>
                </table>
            </div>
        </div>
    </div>
</div>



<script src="/js/jquery-3.2.1.min.js"></script>
<script src="/bootstrap/js/bootstrap.min.js"></script>
<script src="/script/docs.min.js"></script>
<script src="/ztree/jquery.ztree.all-3.5.min.js"></script>
<script type="text/javascript" src="/jquery/layer/layer.js"></script>
<script type="text/javascript" src="/jquery/pagination/jquery.pagination.js"></script>
<script type="text/javascript">
    //页面加载完执行
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
        queryPageNews(1);

    });

    //页面跳转事件处理函数
    function pageChange(pageNo){
        // window.location.href="/news/adminIndex.html?pageNo="+pageNo;
        queryPageNews(pageNo);
    }

    //获取新闻列表,异步请求方式
    var jsonObj = '{"pageNo":1,"pageSize":10}';
    var loadingIndex = -1;
    function queryPageNews(pageIndex) {
        jsonObj = '{"pageNo":'+pageIndex+',"pageSize":10}';
        $.ajax({
            url:"/news/adminIndex",
            type:"post",
            contentType:"application/json;charset=UTF-8",
            dataType:"json",
            data:jsonObj,
            beforeSend: function(){
                loadingIndex = layer.load(2,{time:10*1000});
                return true;
            },
            success:function (result) {
                layer.close(loadingIndex);
                //alert(result.success);
                if (result.success){
                    var page = result.page;
                    var newsDataList = page.dataList;
                    var content = '';
                    //tbody 主体内容
                    $.each(newsDataList, function (i, newsData) {
                        content += '<tr align="center">';
                        content += '    <td>'+(i+1)+'</td>';
                        content += '    <td>'+(newsData.typeName)+'</td>';
                        content += '    <td>'+(newsData.news.title)+'</td>';
                        content += '    <td>'+(newsData.news.keywords)+'</td>';
                        content += '    <td>'+(newsData.date)+'</td>';
                        content += '    <td>';
                        content += '        <button type="button" class="btn btn-success btn-xs" onclick="previewNews('+newsData.news.new_id+')"><i class=" glyphicon glyphicon-eye-open"></i>预览</button>';
                        content += '        <button type="button" class="btn btn-primary btn-xs" onclick="updateNews('+newsData.news.new_id+')"><i class=" glyphicon glyphicon-pencil"></i>修改</button>';
                        content += '        <button type="button" class="btn btn-danger btn-xs" onclick="deleteNews('+ newsData.news.new_id+')"><i class=" glyphicon glyphicon-remove"></i>删除</button>';
                        content += '    </td>';
                        content += '</tr>';
                    })
                    $("tbody").html(content);

                    //分页
                    var contentBar = '';
                    contentBar +='<tr>' +
                                           '<td colspan="6" align="center">'
                        +'<div id="Pagination" class="pagination">'+
                                              '<ul class="pagination"> ';
                    if (page.pageNo == 1){
                        contentBar += '<li class="disabled"><a href="#">上一页</a></li>';
                    }
                    else {
                        contentBar +='<li><a href="#" onclick="pageChange('+(page.pageNo-1)+')">上一页</a></li>';
                    }

                    var str ='';
                    for(var i = 1; i<= page.totalPages; i++){
                        if (i == page.pageNo)
                            str = 'class = "active"';
                        contentBar +='<li' +str
                            + '> <a href="#" onclick="pageChange('+i+')">'+i+' </a></li>';
                    }

                    if (page.pageNo == page.totalPages){

                        contentBar += '<li class="disabled"><a href="#">下一页</a></li>';
                    }
                    else {
                        contentBar +='<li><a href="#" onclick="pageChange('+(page.pageNo+1)+')">下一页</a></li>';
                    }

                    contentBar += '    </ul>' +'</div>'+
                        '                        </td>' +
                        '                    </tr>' ;

                    $("tfoot").html(contentBar);

                }else {
                    layer.msg(result.message,{time:1000, icon:5,shift:6});
                }
            },
            error:function () {
                layer.msg("加载数据失败",{time:1000,icon:5,shift:6});
            }
        });
    }

    //首页查询功能
    $("#queryBtn").click(function () {
       // alert("查询执行");
        var queryText = $("#queryText").val();
       // alert(queryText);
        $.ajax({
            url:"/news/adminQueryText",
            type:"post",
            data:{"queryText":queryText},
            //contentType:"application/json;charset=UTF-8",
            dataType:"json",
            beforeSend: function(){
                loadingIndex = layer.load(2,{time:10*1000});
                return true;
            },
            success:function (result) {
                layer.close(loadingIndex);
                if (result.success) {
                    var newsDataList = result.data;
                    var content = '';
                    //tbody 主体内容
                    $.each(newsDataList, function (i, newsData) {
                        content += '<tr align="center">';
                        content += '    <td>' + (i + 1) + '</td>';
                        content += '    <td>' + (newsData.typeName) + '</td>';
                        content += '    <td>' + (newsData.news.title) + '</td>';
                        content += '    <td>' + (newsData.news.keywords) + '</td>';
                        content += '    <td>' + (newsData.date) + '</td>';
                        content += '    <td>';
                        content += '        <button type="button" class="btn btn-success btn-xs" onclick="previewNews('+newsData.news.new_id+')"><i class=" glyphicon glyphicon-eye-open"></i>预览</button>';
                        content += '        <button type="button" class="btn btn-primary btn-xs" onclick="updateNews('+newsData.news.new_id+')"><i class=" glyphicon glyphicon-pencil"></i>编辑</button>';
                        content += '        <button type="button" class="btn btn-danger btn-xs" onclick="deleteNews('+ newsData.news.new_id+')"><i class=" glyphicon glyphicon-remove"></i>删除</button>';
                        content += '    </td>';
                        content += '</tr>';
                    })
                    $("tbody").html(content);
                    $('tfoot').html('');
                }
            }
        });
    });

    //首页局部刷新功能
    $("#refreshBtn").click(function () {
        queryPageNews(1);
    });


    //根据news_id删除
    function deleteNews(id) {
        layer.confirm('确认要删除这条新闻吗?', {icon: 3, title:'提示'}, function(cihdex){
            layer.close(cihdex);
            $.ajax({
                type :"post",
                data : {
                    "id" : id
                },
                url:"/news/adminDeleteNews",
                dataType:"json",
                success : function (result) {
                    if (result.success){
                        queryPageNews(1);
                    }else {
                        layer.msg(result.message, {time: 3*1000, icon: 5, shift: 6});
                    }
                },
                error : function () {
                    layer.msg("删除用户失败！", {time: 3*1000, icon: 5, shift: 6});
                }
            });
        }, function (cihdex) {
            layer.close(cihdex);
        });
    }

    //编辑按钮功能：跳转到进入editor页面,同时将新闻信息取出来显示到editor编辑器中,执行更新操作
    //跳转到更新页面,同时传入一个ｉｄ参数
    //跳转到该页面后发出一个异步请求，根据id查询这条新闻数据，显示在编辑页面上
    //编辑内容，执行更新操作
    function updateNews(id){
        window.location.href="/news/toUpdateNews?id="+id;
    }

    //预览信息:转到预览信息页面,同时传入id
    //
    function previewNews(id) {
        window.location.href="/news/toPreviewNews?id="+id;
    }


</script>
</body>
</html>