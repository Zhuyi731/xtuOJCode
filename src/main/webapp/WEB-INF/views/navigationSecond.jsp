<%@ page pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML>
<html>
<head>
    <title>Navigation</title>
    <link href="/css/bootstrap.css" rel='stylesheet' type='text/css' />
    <link href="/css/bootstrap.min.css" rel="stylesheet" type="text/css" media="all" />
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<base href="<%=basePath%>" target="_top">
</head>
<body>
<div class="navbar  navbar-default" role="navigation" style="margin-bottom:50px;background-color:#2c333d; ">
    <div class="col-md-9">
        <div class="navbar-header">
            <a href="/index" class="navbar-brand">XTUOJ</a>
        </div>
        <ul class="nav navbar-nav" style="font-size:18px;margin:20px auto;text-align:center;">
            <li><a href="/index" style="color:white;">Home</a></li>
            <li><a href="/problem/problems/0" style="color:white;">Problem Set</a></li>
            <li><a href="/ranklist/0" style="color:white;">Ranklist</a></li>
            <li><a href="/status/0" style="color:white;">Status</a></li>
            <li><a href="/test/test" style="color:white;">Contest</a></li>
        </ul>
    </div>
    <security:authorize access="isAuthenticated()">
        <security:authentication property="principal.username" var="userId"/>
        <security:authentication property="principal.authorities" var="roleId"/>
        ${roleId}${roleId}${roleId}${roleId}${roleId}
    </security:authorize>
    <div class="col-md-3 logBtn" style="width:200px;float:right;">
        <c:if test="${userId ne null}">
            <c:if test="${roleId eq '[0]'}">
                <a href="admin/main" class="dropdown-toggle btn btn-primary" data-toggle="dropdown"
                   style="width: 160px;margin-top: 20px;">${userId}</a>
            </c:if>
            <c:if test="${roleId eq '[1]'}">
                <a href="teacher/main" class="dropdown-toggle btn btn-primary" data-toggle="dropdown"
                   style="width: 160px;margin-top: 20px;">${userId}</a>
            </c:if><c:if test="${roleId eq '[2]'}">
            <a href="student/main" class="dropdown-toggle btn btn-primary" data-toggle="dropdown"
               style="width: 160px;margin-top: 20px;">${userId}</a>
        </c:if>
        </c:if>
        <c:if test="${userId eq null}">
            <a href="/login" class="dropdown-toggle btn btn-primary" style="width: 160px; margin-top: 20px;">
                Login
            </a>
        </c:if>
    </div>
</div>
</div>
<script src="js/jquery.min.js"></script>


<script src="js/bootstrap.min.js"></script>
</body>
</html>