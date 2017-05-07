<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML>
<html>
<head>
    <base href="<%=basePath%>">
    <title>所有用户</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link href="/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    <link href="/css/custom.css" rel="stylesheet" type="text/css"/>
</head>
<body>
<div class="searchDiv">
    <form class="" method="get" role="form">
        <div class="form-group col-md-2 col-md-offset-1">
        <select class="form-control" name="roleID"  >
            <option value="0">所有</option>
            <option value="1">老师</option>
            <option value="2">学生</option>
        </select>
        </div>
        <div class="form-group">
            <label role="label" class="control-label col-md-1" for="userId">学号:</label>
            <div class="col-md-2">
            <input type="text" name="userId" id="userId" class="form-control">
            </div>
        </div>
        <div class="form-group">
            <label role="label" class="control-label col-md-1" for="classId">班级:</label>
            <div class="col-md-2">
                <input type="text" name="classId" id="classId" class="form-control">
            </div>
        </div>
        <div class="form-group col-md-1" >
            <input type="submit" value="search" class="btn btn-primary form-control">
        </div>
    </form>

</div>
<div class="container">
    <table class="table table-hover table-bordered" >
        <thead>
        <tr><td class="col-md-2">User.ID</td>
            <td class="col-md-2">User.name</td>
            <td class="col-md-2">Nickname</td>
            <td class="col-md-2">Class</td>
            <td class="col-md-2">Modify</td>
        </tr></thead>
        <tbody>
        <c:forEach items="${vo}" var="entity">
        <tr>
            <td>${entity.id}</td>
            <td>${entity.name}</td>
            <td>${entity.nickname}</td>
            <td>${entity.classId}</td>
            <td><a href="/admin/modifyUserInfo">Enter Modify</a></td>
        </tr>
        </c:forEach>
        </tbody>
    </table>
    <div class="function pull-right" >
        <a class="btn btn-lg btn-primary " href="/admin/createNewUsers">添加学生</a>
    </div>
</div>
</body>
</html>