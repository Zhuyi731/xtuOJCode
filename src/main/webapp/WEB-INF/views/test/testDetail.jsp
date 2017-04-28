<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/4/28
  Time: 9:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE HTML>
<html>
<head>
    <title>Detail</title>
</head>
<body>
<%@include file="/WEB-INF/views/navigation.jsp" %>
<div class="title">
    <h2>${entity.title}</h2><br>
    <small>Start Time:${entity.startTime}</small>
    <small>End Time:${entity.endTime}</small>
</div>
<div class="container">
    <table class="table table-hover table-border">
        <thead>
        <tr>
            <td class="col-md-1">Pro.ID</td>
            <td class="col-md-4"><a href="problem/proDetail/contestID/${entity.contestId}">Problem Title</a>></td>
            <td class="col-md-2">Solved(Accept/Submit)</td>
            <td class="col-md-1">ratio</td>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${vo.entityList}" var="entity">
            <tr>
                <td>${entity.problemId}</td>
                <td>${entity.title}</td>
                <td>${entity.acProblemsNum}/${entity.submitProblemsNum}</td>
                <td>${entity.ratio}</td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
</body>
</html>
