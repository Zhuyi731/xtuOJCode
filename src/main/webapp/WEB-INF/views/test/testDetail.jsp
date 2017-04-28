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
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link href="/css/bootstrap.min.css" rel='stylesheet' type='text/css'/>
    <link href="/css/custom.css" rel="stylesheet"/>
</head>
<body>
<%
    String url = request.getHeader("referer");
    String backgroud = "http://localhost:8080/admin/menu";
    if (backgroud.equals(url)) {
        pageContext.setAttribute("nav", 0);
    } else {
        pageContext.setAttribute("nav", 1);
    }
%>
<c:if test="${nav eq 1}">
    <%@ include file="/WEB-INF/views/navigation.jsp" %>
</c:if>
<div class="title">
    <h2>${entity.title}</h2><br>
    <small>Start Time:${entity.startTime}</small>
    <small>End Time:${entity.endTime}</small>
</div>
<div class="navPart"></div>
<div class="container">
    <table class="table table-hover table-border">
        <thead>
        <tr>
            <td class="col-md-1">Pro.ID</td>
            <td class="col-md-4">Problem Title</td>
            <td class="col-md-2">Solved(Accept/Submit)</td>
            <td class="col-md-1">ratio</td>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${vo.entityList}" var="entity">
            <tr>
                <td>${entity.problemId}</td>
                <td><a href="problem/proDetail/contestID/${entity.contestId}">${entity.title}</a></td>
                <td>${entity.acProblemsNum}/${entity.submitProblemsNum}</td>
                <td>${entity.ratio}</td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
</body>
</html>
