<%@ taglib prefix="securityrity" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE HTML>
<html>
<head>
    <base target="contentFrame" href="<%=basePath%>">
    <title>后台管理</title>
    <META content="text/html; charset=utf-8" http-equiv=Content-Type>
    <link rel="stylesheet" href="/css/bootstrap.min.css">
    <link rel="stylesheet" href="/css/custom.css">
    <style type="text/css">
        div {
            margin-top: 20px;
        }

        ul {
            width: 100%;
        }
    </style>
</head>
<body style="background-color:#DCDCDC">
<div class="head" align="center">
    <a size="5px" href="/info" class="text-muted">管理员后台管理</a>
</div>
<security:authorize access="isAuthenticated()">
    <securityrity:authentication property="principal.username" var="userId"/>
</security:authorize>
<div class="dropdown">
    <button class="btn btn-primary dropdown-toggle form-control" type="button" id="dropdownMenu1"
            data-toggle="dropdown">
        个人信息管理
        <span class="caret"></span>
    </button>
    <ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu1">
        <li role="presentation"><a href="/userInfo/${userId}">个人信息</a></li>
        <li role="presentation"><a href="/modifyPassword">修改密码</a></li>
        <li role="presentation"><a href="/modifyUserInfo">修改个人信息</a></li>
    </ul>
</div>
<div class="dropdown">
    <button class="btn btn-primary dropdown-toggle form-control" type="button" id="dropdownMenu2"
            data-toggle="dropdown">
        前台管理
        <span class="caret"></span>
    </button>
    <ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu2">
        <li role="presentation"><a href="/status/0">查看Status</a></li>
        <li role="presentation"><a href="news/showNews">查看公告</a></li>
        <li role="presentation"><a href="news/addNews">添加公告</a></li>
    </ul>
</div>
<div class="dropdown">
    <button class="btn btn-primary dropdown-toggle form-control" type="button" id="dropdownMenu3"
            data-toggle="dropdown">
        题库管理
        <span class="caret"></span>
    </button>
    <ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu3">
        <li role="presentation"><a href="problem/proManager">题库列表</a></li>
        <li role="presentation"><a href="problem/addProblem">添加题目</a></li>
    </ul>
</div>

<div class="dropdown">
    <button class="btn btn-primary dropdown-toggle form-control" type="button" id="dropdownMenu4"
            data-toggle="dropdown">
        比赛管理
        <span class="caret"></span>
    </button>
    <ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu4">
        <li role="presentation"><a href="test/test/0">所有比赛</a></li>
        <li role="presentation"><a href="test/createTest">创建比赛</a></li>
    </ul>
</div>

<div class="dropdown">
    <button class="btn btn-primary dropdown-toggle form-control" type="button" id="dropdownMenu5"
            data-toggle="dropdown">
        用户管理
        <span class="caret"></span>
    </button>
    <ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu5">
        <li role="presentation"><a href="admin/showUsers">用户列表</a></li>
        <li role="presentation"><a href="admin/createNewUsers">添加用户</a></li>
    </ul>
</div>

<div class="dropdown">
    <a class="btn btn-danger form-control" type="button" href="/logout" target="_top">退出登录</a>
</div>
<script src="js/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
</body>
</html>
