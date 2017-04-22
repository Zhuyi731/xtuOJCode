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
<body>
<div class="search" align="center">
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
            <input type="submit" value="search" class="btn btn-primary btn-sm">
        </div>
    </form>
</div>
<div class="container">
    <table class="table table-hover  table-bordered">
        <thead>
        <tr>
            <td class="col-md-1">Pro.ID</td>
            <td class="col-md-1 col-xs-1">Title</td>
            <td class="col-md-1 col-xs-1">authority</td>
            <td class="col-md-1 col-xs-1">Time Limit(ms)</td>
            <td class="col-md-1 col-xs-1">Memory Limit(MB)</td>
            <td class="col-md-1 col-xs-1">Author</td>
            <td class="col-md-1 col-xs-1">AC/SUBMIT</td>
            <td class="col-md-1 col-xs-1">ratio</td>
            <td class="col-md-2 col-xs-2">点击进入修改</td>
            <td class="col-md-1 col-xs-1"><input type="checkbox" id="checkAll" onclick="checkAll()">全选</td>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${vo.entityList}" var="pro">
            <tr>
                <td><c:out value="${pro.problemId}"></c:out></td>
                <td><c:out value="${pro.title}"></c:out></td>
                <%--<td><c:out value="${pro.status}"></c:out></td>--%>
                <%--<td><c:out value="${pro.timeLimit}"></c:out></td>--%>
                <%--<td><c:out value="${pro.memoryLimit}"></c:out></td>--%>
                <%--<td><c:out value="${pro.author}"></c:out></td>--%>
                <%--<td></td>--%>
                <td></td>
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