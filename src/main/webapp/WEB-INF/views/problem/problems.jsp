<%@ page import="com.xtu.DB.vo.ProblemsVO" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<%@ page pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
    ProblemsVO vo = (ProblemsVO) request.getAttribute("vo");
    String currentPage = String.valueOf(vo.getStart() + 1);
    pageContext.setAttribute("currentPage", currentPage);
    String totalPage = String.valueOf(vo.getTotal() / 20 + 1);
    pageContext.setAttribute("totalPage", totalPage);
%>
<c:set var="totalPage" value="${totalPage}"/>
<script type="text/javascript">
    var tPage = "${totalPage}";
</script>
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
<%@ include file="/WEB-INF/views/navigation.jsp" %>
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
            <c:if test="${currentPage != 1}">
                <li class="previous"><a href="/problem/problems/0">&laquo;&laquo;First Page</a></li>
            </c:if>
            <c:if test="${currentPage > 1}">
                <li class="previous"><a href="/problem/problems/${currentPage-2}">&laquo;Previous Page</a></li>
            </c:if>
            <c:if test="${currentPage > 2 }">
                <li class="start"><a href="/problem/problems/${currentPage-3}">${currentPage-2}</a></li>
            </c:if>
            <c:if test="${currentPage > 1 }">
                <li class="start"><a href="/problem/problems/${currentPage-2}">${currentPage-1}</a></li>
            </c:if>

            <li class="start"><a href="/problem/problems/${currentPage-1}" disabled="disabled">${currentPage}</a></li>

            <c:if test="${currentPage < totalPage}">
                <li class="start"><a href="/problem/problems/${currentPage}">${currentPage+1}</a></li>
            </c:if>
            <c:if test="${currentPage < totalPage-1}">
                <li class="start"><a href="/problem/problems/${currentPage+1}">${currentPage+2}</a></li>
            </c:if>
            <li class="start">
                The&nbsp;${currentPage}/${totalPage}&nbsp;Page&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Total&nbsp;${vo.total}&nbsp;Records
            </li>
            <c:if test="${currentPage < totalPage}">
                <li class="next"><a href="/problem/problems/${totalPage-1}">Last Page&raquo;&raquo;</a></li>
            </c:if>
            <c:if test="${currentPage < totalPage}">
                <li class="next"><a href="/problem/problems/${vo.start+1}">Next Page&raquo;</a></li>
            </c:if>
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
<div class="page" align="justify">
    <ul class="pager">
        <c:if test="${currentPage != 1}">
            <li class="previous"><a href="/problem/problems/0">&laquo;&laquo;The First Page</a></li>
        </c:if>
        <c:if test="${currentPage > 1}">
            <li class="previous"><a href="/problem/problems/${currentPage-2}">&laquo;Previous Page</a></li>
        </c:if>
        <c:if test="${currentPage > 2 }">
            <li class="start"><a href="/problem/problems/${currentPage-3}">${currentPage-2}</a></li>
        </c:if>
        <c:if test="${currentPage > 1 }">
            <li class="start"><a href="/problem/problems/${currentPage-2}">${currentPage-1}</a></li>
        </c:if>

        <li class="start"><a href="/problem/problems/${currentPage-1}" disabled="disabled">${currentPage}</a></li>

        <c:if test="${currentPage < totalPage}">
            <li class="start"><a href="/problem/problems/${currentPage}">${currentPage+1}</a></li>
        </c:if>
        <c:if test="${currentPage < totalPage-1}">
            <li class="start"><a href="/problem/problems/${currentPage+1}">${currentPage+2}</a></li>
        </c:if>
        <li class="start">
            The&nbsp;${currentPage}/${totalPage}&nbsp;Page&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Total&nbsp;${vo.total}&nbsp;Records
        </li>
        <c:if test="${currentPage < totalPage}">
            <li class="next"><a href="/problem/problems/${totalPage-1}">The Last Page&raquo;&raquo;</a></li>
        </c:if>
        <c:if test="${currentPage < totalPage}">
            <li class="next"><a href="/problem/problems/${vo.start+1}">Next Page&raquo;</a></li>
        </c:if>
    </ul>
</div>
<div align="right">
    <div class="pageGoContainer">
        <label for="pageGo" class="pageGo">Jump To:</label>
        <div class="pageGo">
            <input type="text" class="form-control " style="width: 60px;height: 25px;" name="pageGo" id="pageGo"
                   placeholder="页码">
        </div>
        <div class="pageGo">
            <button type="button" onclick="pageGo()" class="btn btn-primary ">GO</button>
        </div>
    </div>
</div>
<%@ include file="/WEB-INF/views/copyright.html" %>
<script src="/js/custom.js" type="text/javascript" language="JavaScript"></script>
</body>
</html>
