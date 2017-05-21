<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.xtu.DB.vo.AllContestVO" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
    AllContestVO vo=(AllContestVO) request.getAttribute("vo");
    String currenPage=String.valueOf(vo.getStart()+1);
    String totalPage=String.valueOf(vo.getTotal()/20+1);
    pageContext.setAttribute("currentPage",currenPage);
    pageContext.setAttribute("totalPage",totalPage);
%>
<!DOCTYPE HTML >
<html>
<head>
    <base href="<%=basePath%>">
    <title>All contest</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="/css/bootstrap.min.css" rel='stylesheet' type='text/css' />
    <link href="/css/custom.css" rel="stylesheet" />
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
    <%@ include file="/WEB-INF/views/navigation.jsp"%>
</c:if>

<div class="contest">
    <table class="table table-hover" style="width: 1000px;margin:60px 100px ">
        <thead>
        <tr>
            <th class="col-md-2">Contest.ID</th>
            <th class="col-md-4">Contest Title</th>
            <th class="col-md-2">Start Time</th>
            <th class="col-md-2">End Time</th>
            <th class="col-md-2">Modify</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${vo.entityList}" var="entity">
        <tr>
            <td><a href="/test/testDetail/${entity.contestId}" target="_top">${entity.contestId}</a></td>
            <td><a href="/test/testDetail/${entity.contestId}" target="_top">${entity.title}</a></td>
            <td>${entity.startTime}</td>
            <td>${entity.endTime}</td>
            <td><a href="/test/modifyTest/${entity.contestId}">进入修改</a></td>
            </c:forEach>
        </tbody>
    </table>
</div>
</body>
</html>
