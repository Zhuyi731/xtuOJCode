<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML>
<html>
<head>
    <base href="<%=basePath%>">
    <title>Detail</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="/css/bootstrap.min.css" rel='stylesheet' type='text/css'/>
    <link href="/css/custom.css" rel="stylesheet"/>
</head>
<body>
<%

    String url = request.getHeader("referer");
    String backgroud = "http://localhost:8080/admin/menu";
    String backgroud2 = "http://localhost:8080/teacher/menu";
    if (backgroud.equals(url)) {
        pageContext.setAttribute("nav", 0);
    } else {
        if(backgroud2.equals(url)){
            pageContext.setAttribute("nav", 0);
        }else{
            pageContext.setAttribute("nav", 1);
        }
    }
%>
<c:if test="${nav eq 1}">
    <%@ include file="/WEB-INF/views/navigation.jsp" %>
</c:if>
<div class="headTitle" align="center">
    <h2>${entity.title}</h2><br>
    <small>Start Time:${entity.startTime}</small>
    <small>End Time:${entity.endTime}</small>
</div>
<div class="functionNav" align="center">
    <table class="table table-hover text-info">
        <tbody>
        <tr>
            <td class="col-md-2 col-md-offset-2 col-sm-2 col-sm-offset-2"><button type="button" class="btn btn-link" onclick='window.history.go(-1)'>Go Back</button></td>
            <td class="col-md-2 col-sm-2"><a href="/test/standing">Standing</a></td>
            <td class="col-md-2 col-sm-2"><a href="/status/0">Status</a></td>
        </tr>
        </tbody>
    </table>
</div>
<div class="navPart"></div>
<div class="container" align="center">
    <table class="table table-hover table-border" style="width: 800px;">
        <thead>
        <tr>
            <td class="col-md-1">Pro.ID</td>
            <td class="col-md-4">Problem Title</td>
            <td class="col-md-2">Solved(Accept/Submit)</td>
            <td class="col-md-1">ratio</td>
        </tr>
        </thead>
        <tbody>
        <% int no=1;%>
        <c:forEach items="${vo.entityList}" var="entity">
            <tr>
                <td><%=(no++)%></td>
                <td><a href="test/testProDetail/${entity.contestId}?contestId=${entity.contestId}&no=${entity.no}">${entity.title}</a></td>
                <%--<td>${entity.acProblemsNum}/${entity.submitProblemsNum}</td>--%>
                <%--<td>${entity.ratio}</td>--%>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>

<script src="js/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
</body>
</html>
