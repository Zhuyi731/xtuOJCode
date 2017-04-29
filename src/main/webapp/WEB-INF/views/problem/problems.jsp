<%@ page import="com.xtu.DB.vo.ProblemsVO" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<%@ page pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
    ProblemsVO vo= (ProblemsVO) request.getAttribute("vo");
%>
<!DOCTYPE HTML>
<html>
<head>
    <base href="<%=basePath%>">
    <title>Problem Set</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link href="/css/bootstrap.min.css" rel='stylesheet' type='text/css'/>
    <link href="/css/custom.css" rel="stylesheet" type="text/css"/>
</head>
<body>
<%@ include file="/WEB-INF/views/navigation.jsp"%>
<div class="search">
    <sf:form commandName="problemsDTO" role="form" method="post" class="form-inline">
        <div class="form-group">
            <label for="title" class="control-label col-md-2 col-sm-2">Title:</label>
            <div class=col-md-2">
                <input type="text" class="form-control" name="title" id="title" placeholder="Search by problem title">
            </div>
        </div>
        <div class="form-group">
            <div class="col-md-2">
                <input type="submit" class="btn btn-primary submit" style="margin-top: 25px;" value="search">
            </div>
        </div>
    </sf:form>
</div>
<div class="container">
    <div class="page" align="justify">
        <ul class="pager">
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
            <%--<li class="start">The&nbsp;${vo.start+1}/<%=vo.getTotal()/20+1%>&nbsp;Page&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Total&nbsp;${vo.total}&nbsp;Records</li>--%>
            <li class="next"><a href="/problem/problems/${vo.total}">Last Page&raquo;&raquo;</a></li>
            <%--<c:if test="${vo.start+1 < vo.total}">--%>
            <li class="next"><a href="/problem/problems/${vo.start+1}">Next Page&raquo;</a></li>
            <%--</c:if>--%>
        </ul>
    </div>
    <div class="problems">
        <table class="table table-hover" style="width: 1000px;margin: 30px 100px ">
            <thead>
            <tr>
                <th class="col-md-2">ID</th>
                <th class="col-md-6">Title</th>
                <th class="col-md-2">accept/submit</th>
                <th class="col-md-2">Ratio</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${vo.entityList}" var="entity">
            <tr>
                <th><a href="/problem/proDetail/${entity.problemId}">${entity.problemId}</a></th>
                <th><a href="/problem/proDetail/${entity.problemId}">${entity.title}</a></th>
                <th>${entity.acProblemsNum}/${entity.submitProblemsNum}</th>
                <th>${entity.ratio}%</th>
                </c:forEach>
            </tbody>
        </table>
    </div>
</div>
<div class="container">
    <div class="page">
        <ul class="pager">
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
            <%--<c:if test="${vo.start+1 < vo.total}">--%>
            <li class="next"><a href="/problem/problems/${vo.start+1}">Next Page&raquo;</a></li>
            <%--</c:if>--%>
        </ul>
    </div>
</div>
    <div class="pageGo">
        <form role="form" method="post" class="form-inline" style="line-height: 30px;">
            <div class="form-group">
                <label for="pageGo" class="control-label col-md-2 col-sm-2">页码:</label>
            </div>
            <div class="form-group">
                <div class=col-md-2">
                    <input type="text" class="form-control " style="width: 60px;height: 25px;" name="pageGo" id="pageGo"
                           placeholder="页码">/${vo.total}100
                </div>
            </div>
            <div class="form-group">
                <div class="col-md-2">
                    <input type="submit" class="btn btn-primary submit" value="GO">
                </div>
            </div>
        </form>
    </div>
    <%@ include file="/WEB-INF/views/copyright.html" %>
</body>
</html>
