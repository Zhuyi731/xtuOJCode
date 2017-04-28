<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML >
<html>
<head>
    <base href="<%=basePath%>">
    <title>All contest</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="css/bootstrap.min.css" rel='stylesheet' type='text/css' />
    <link href="css/custom.css" rel="stylesheet" />
</head>
<body>
<div class="search">
    <form role="form" method="post" class="form-inline">
        <div class="form-group">
            <label for="title" class="control-label col-md-2 col-sm-2">Title:</label>
            <div class=col-md-2">
                <input type="text" class="form-control" name="title" id="title" placeholder="Contest Title">
            </div>
        </div>
        <div class="form-group">
            <div class="col-md-2">
                <input type="submit" class="btn btn-primary submit" style="margin-top: 25px;" value="Search">
            </div>
        </div>
    </form>
</div>
<div class="container" style="margin:40px 20px;">
    <div class="page" style="width:1200px;">
        <ul class="pager"  style="padding-left:100px;">
            <li class="previous"><a href="/problem/problems/0">&laquo;&laquo;First Page</a></li>
            <c:if test="${vo.start != 0}">
                <li class="previous"><a href="/problem/problems/${vo.start-1}">&laquo;Previous Page</a></li>
            </c:if>
            <c:if test="${vo.start > 1 }">
                <li class="start"><a href="/problem/problems/${vo.start-2}">${vo.start-1}</a></li>
                <li class="start"><a href="/problem/problems/${vo.start-1}">${vo.start}</a></li>
            </c:if>
            <li class="start"><a href="/problem/problems/${vo.start}">${vo.start+1}</a></li>
            <c:if test="${vo.start < vo.total-2 }">
                <li class="start"><a href="/problem/problems/${vo.start+1}">${vo.start+2}</a></li>
                <li class="start"><a href="/problem/problems/${vo.start+2}">${vo.start+3}</a></li>
            </c:if>
            <li class="start">Total&nbsp;${vo.start+1}/${vo.total}&nbsp;Pages</li>
            <li class="next"><a href="/problem/problems/${vo.total}">Last Page&raquo;&raquo;</a></li>
            <c:if test="${vo.start+1 < vo.total}">
                <li class="next"><a href="/problem/problems/${vo.start+1}">Next Page&raquo;</a></li>
            </c:if>
        </ul>
    </div>
</div>
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
            <th><a href="/test/allTest/${entity.examId}">${entity.examId}</a></th>
            <th><a href="/test/allTest/${entity.examId}"><a href="">${entity.title}</a></th>
            <th>${entity.startTime}</th>
            <th>${entity.endTime}</th>
            <th><a href="/test/modifyTest.jsp">进入修改</a></th>
            </c:forEach>
        </tbody>
    </table>
</div>
</div>
</body>
</html>
