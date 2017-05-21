<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>User Information</title>
    <link href="/css/bootstrap.min.css" rel='stylesheet' type='text/css'/>
    <link href="/css/custom.css" rel="stylesheet" type="text/css"/>

</head>
<body>
<%
    String url = request.getHeader("referer");
    String backgroud = "http://localhost:8080/admin/menu";
    String backgroud2 = "http://localhost:8080/teacher/menu";
    String backgroud3 = "http://localhost:8080/student/menu";
    if (backgroud.equals(url)) {
        pageContext.setAttribute("nav", 0);
    } else {
        if (backgroud2.equals(url)) {
            pageContext.setAttribute("nav", 0);
        } else {
            if (backgroud3.equals(url)) {
                pageContext.setAttribute("nav", 0);
            } else {
                pageContext.setAttribute("nav", 1);
            }
        }
    }
%>
<c:if test="${nav eq 1}">
    <%@ include file="/WEB-INF/views/navigation.jsp" %>
</c:if>
<div align="center">
    <div class="top50 panel panel-default panel-primary" align="center" style="text-align:center; width:800px;">
        <div class="panel panel-heading " style="background-color: #2C333D">${entity.id}</div>
        <div class="panel panel-body" align="left">
            <p>学号:${entity.id}</p><br>
            <p>Name:${entity.name}</p><br>
            <p>Nickname:${entity.nickname}</p><br>
            <c:if test="${entity.qqOpen eq 'Y'}">
                <p>QQ:${entity.qq}</p><br>
            </c:if>
            <c:if test="${entity.qqOpen eq 'N'}">
                <p>QQ:对方设置了不可见</p><br>
            </c:if>
            <c:if test="${entity.emailOpen eq 'Y'}">
                <p>Email:${entity.email}</p><br>
            </c:if>
            <c:if test="${entity.emailOpen eq 'N'}">
                <p>Email:对方设置了不可见</p><br>
            </c:if>
            <c:if test="${entity.phoneOpen eq 'Y'}">
                <p>Phone:${entity.phone}</p><br>
            </c:if>
            <c:if test="${entity.phoneOpen eq 'N'}">
                <p>Phone:对方设置了不可见</p><br>
            </c:if>
        </div>
        <div class="panel panel-footer"></div>
    </div>
</div>
</body>
</html>
