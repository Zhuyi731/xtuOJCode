<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<!DOCTYPE HTML >
<html>
<head>
    <base href="<%=basePath%>">
    <title>题库管理</title>
    <META content="text/html; charset=utf-8" http-equiv=Content-Type>
    <link rel="stylesheet" href="css/bootstrap.css">
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/custom.css">
</head>
<body style="padding-left: 100px;">
<div  style="margin-top:50px;">
    <form class="form-inline" method="get" role="form">
        <div class="form-group">
            <label class="control-label col-md-offset-1  col-md-1 col-sm-offset-1 col-sm-1 col-xs-2" for="problemId">Pro.ID</label>
            <div class="col-md-offset-1 col-md-1 col-sm-offset-1 col-sm-1 col-xs-2">
                <input type="text" class="form-control" name="problemId" id="problemId">
            </div>
        </div>
        <div class="form-group">
            <label class="control-label col-md-1 col-sm-1 col-xs-2" for="title">Title</label>
            <div class="col-md-offset-1 col-md-1 col-sm-offset-1 col-sm-1 col-xs-2">
                <input type="text" class="form-control" name="title" id="title">
            </div>
        </div>
        <div class="form-group">
            <label class="control-label col-md-1 col-sm-1 col-xs-2" for="author">Author</label>
            <div class="col-md-offset-1  col-md-1 col-sm-offset-1 col-sm-1 col-xs-2">
                <input type="text" class="form-control" name="author" id="author">
            </div>
        </div>
        <div class="form-group">
            <div class="col-md-offset-1 col-md-1 col-sm-offset-1 col-sm-1">
                <input type="submit" value="search" class="btn btn-primary btn-sm">
            </div>
        </div>
    </form>
</div>
<div class="page" align="justify" style="margin:0px 160px; text-align: justify" >
    <ul class="pager" >
        <li class="previous"><a href="/problem/proManager/0">&laquo;&laquo;The First Page</a></li>
        <c:if test="${vo.start != 0}">
            <li class="previous"><a href="/problem/proManager/${vo.start-1}">&laquo;Previous Page</a></li>
        </c:if>
        <li>共${vo.total}页</li>
        <li class="next"><a href="/problem/proManager/${vo.total+0}">The Last Page&raquo;&raquo;</a></li>
        <c:if test="${vo.start < vo.total-1}">
            <li class="next"><a href="/problem/proManager/${vo.start+1}">Next Page&raquo;</a></li>
        </c:if>
    </ul>
</div>
<div class="container">
    <table class="table table-hover  table-bordered">
        <thead>
        <tr>
            <td class="col-md-1">Pro.ID</td>
            <td class="col-md-1 col-xs-1">Title</td>
            <td class="col-md-1 col-xs-1">Status</td>
            <td class="col-md-1 col-xs-1">Time Limit(ms)</td>
            <td class="col-md-1 col-xs-1">Memory Limit(MB)</td>
            <td class="col-md-1 col-xs-1">Author</td>
            <td class="col-md-1 col-xs-1">AC/SUBMIT</td>
            <td class="col-md-1 col-xs-1">ratio</td>
            <td class="col-md-1 col-xs-1">最后更新时间</td>
            <td class="col-md-2 col-xs-2">点击进入修改</td>
            <td class="col-md-1 col-xs-1"><input type="checkbox" id="checkAll" onclick="checkAll()">全选</td>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${vo.entityList}" var="pro">
            <tr>
                <td>${pro.problemId}</td>
                <td>${pro.title}</td>
                <td>${pro.status}</td>
                <td>${pro.timeLimit}</td>
                <td>${pro.memoryLimit}</td>
                <td>${pro.author}</td>
                <td>${pro.acProblemsNum}/${pro.submitProblemsNum}</td>
                <td>${pro.ratio}</td>
                <td>${lastUpdateTime}</td>
                <td><a href="problem/modifyProblem/${pro.problemId}">点击进入修改</a></td>
                <td><input type="checkbox" name="select"></td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <div class="function">
        <a class="btn btn-lg btn-primary pull-right" href="problem/addProblem">添加题目</a>
    </div>
</div>
<script type="text/javascript">
    function checkAll() {
        var a = document.getElementById("checkAll");
        var b = document.getElementsByName("select");
        if (a.checked == true) {
            for (var i = 0; i < b.length; i++) {
                b[i].checked = true;
            }
        } else {
            for (var i = 0; i < b.length; i++) {
                b[i].checked = false;
            }
        }
    }
</script>
</body>
</html>