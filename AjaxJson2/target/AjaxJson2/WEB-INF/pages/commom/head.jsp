<%--
  Created by IntelliJ IDEA.
  User: xie
  Date: 2020/3/1
  Time: 下午6:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
    <div class="container-fluid">
        <div class="navbar-header">
            <div><a class="navbar-brand" style="font-size:32px;" href="#">上海宝四后台管理系统</a></div>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
            <ul class="nav navbar-nav navbar-right">
                <li style="padding-top:8px;">
                    <div class="btn-group">
                        <button type="button" class="btn btn-default btn-success dropdown-toggle"
                                data-toggle="dropdown">
                            <i class="glyphicon glyphicon-user"></i> ${administrator.admin_name} <span class="caret"></span>
                        </button>
                        <ul class="dropdown-menu" role="menu">
                            <li><a href="#"><i class="glyphicon glyphicon-cog"></i> 修改密码</a></li>
                            <%--                            <li><a href="#"><i class="glyphicon glyphicon-comment"></i> 消息</a></li>--%>
                            <%-- 分割线  --%>
                            <li class="divider"></li>
                            <li><a href="/administrator/logout"><i class="glyphicon glyphicon-off"></i> 退出系统</a></li>
                        </ul>
                    </div>
                </li>
                <li style="margin-left:10px;padding-top:8px;">
                    <button type="button" class="btn btn-default btn-danger">
                        <span class="glyphicon glyphicon-question-sign"></span> 帮助
                    </button>
                </li>
            </ul>
            <%-- 搜索框--%>
            <%--            <form class="navbar-form navbar-right">--%>
            <%--                <input type="text" class="form-control" placeholder="Search...">--%>
            <%--            </form>--%>
        </div>
    </div>
</nav>