<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE HTML>
<html>
<head>
    <base href="<%=basePath%>">
    <title>Ranklist</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link href="/css/bootstrap.min.css" rel='stylesheet' type='text/css'/>
    <link href="/css/custom.css" rel="stylesheet" type="text/css"/>
</head>
<body>
<%@ include file="/WEB-INF/views/navigation.jsp" %>
<!-- 翻页功能 -->
<div class="container">
    <div class="page">
        <ul class="pager">
            <li class="previous"><a href="/ranklist/0">&laquo;&laquo;The First Page</a></li>
            <c:if test="${vo.start != 0}">
                <li class="previous"><a href="/ranklist/${vo.start-1}">&laquo;Previous Page</a></li>
            </c:if>
            <li>共${vo.total}页</li>
            <li class="next"><a href="/ranklist/${vo.total-1}">The Last Page&raquo;&raquo;</a></li>
            <c:if test="${vo.start < vo.total-1}">
                <li class="next"><a href="/rsnklist/${vo.start+1}">Next Page&raquo;</a></li>
            </c:if>
        </ul>
    </div>
    <div class="ranklist">
        <table class="table table-hover" style="width:1000px;margin:30px 100px; ">
            <thead>
            <tr>
                <th class="col-md-1">Rank</th>
                <th class="col-md-1">User.ID</th>
                <th class="col-md-2">User.name</th>
                <th class="col-md-1">Accept/Submit</th>
                <th class="col-md-1">Ratio</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${vo.entityList}" var="entity">
                <tr>
                    <th>${entity.rank}</th>
                    <th>${entity.id}</th>
                    <th>${entity.name}</th>
                    <th>${entity.acProblemsNum}/${entity.submitProblemsNum}</th>
                    <th>${entity.ratio}</th>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>
<%@ include file="/WEB-INF/views/copyright.html" %>
</body>
</html>