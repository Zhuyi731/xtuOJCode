<%@ page pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>题库</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link href="/css/bootstrap.css" rel='stylesheet' type='text/css'/>
    <link href="/css/bootstrap.min.css" rel='stylesheet' type='text/css'/>
    <link href="/css/custom.css" rel="stylesheet" type="text/css"/>
</head>
<body>
<%@ include file="/WEB-INF/views/navigation.jsp" %>
<div class="search" >
    <form role="form" method="get" class="form-inline">
        <div class="form-group">
            <label for="proID" class="control-label col-md-2 col-sm-2">Pro.ID:</label>
            <div class=col-md-2">
                <input type="text" class="form-control" name="proID" id="proID" placeholder="题目或编号">
            </div>
        </div>
        <div class="form-group">
            <div class="col-md-2">
                <input type="submit" class="btn btn-primary submit" style="margin-top: 25px;" value="搜索">
            </div>
        </div>
    </form>
</div>
<div class="container">
    <div class="page">
        <ul class="pager">
            <li class="previous"><a href="/problem/problems/${entity.pageNo-1}">&laquo;上一页</a></li>
            <li class="pageNo"><a href="/problem/problems/${entity.pageNo}">${entity.pageNo}</a></li>
            <li class="pageNo"><a href="/problem/problems/${entity.pageNo+1}">${entity.pageNo+1}</a></li>
            <li class="pageNo"><a href="/problem/problems/${entity.pageNo+2}">${entity.pageNo+2}</a></li>
            <li class="pageNo"><a href="/problem/problems/${entity.pageNo+3}">${entity.pageNo+3}</a></li>
            <li class="pageNo"><a href="/problem/problems/${entity.pageNo+4}">${entity.pageNo+4}</a></li>
            <li class="pageNo">${entity.pageNo}/${entity.total}页</li>
            <li class="next"><a href="/problem/problems/${entity.pageNo+1}">下一页&raquo;</a></li>
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
                <th>${total}%</th>
                </c:forEach>
            </tbody>
        </table>
    </div>
</div>
<div class="container">
<div class="page" >
    <ul class="pager">
        <li class="previous"><a href="/problem/problems/${entity.pageNo-1}">&laquo;上一页</a></li>
        <li class="pageNo"><a href="/problem/problems/${entity.pageNo}">${entity.pageNo}</a></li>
        <li class="pageNo"><a href="/problem/problems/${entity.pageNo+1}">${entity.pageNo+1}</a></li>
        <li class="pageNo"><a href="/problem/problems/${entity.pageNo+2}">${entity.pageNo+2}</a></li>
        <li class="pageNo"><a href="/problem/problems/${entity.pageNo+3}">${entity.pageNo+3}</a></li>
        <li class="pageNo"><a href="/problem/problems/${entity.pageNo+4}">${entity.pageNo+4}</a></li>
        <li class="pageNo">${entity.pageNo}/${entity.total}页</li>
        <li class="next"><a href="/problem/problems/${entity.pageNo+1}">下一页&raquo;</a></li>
    </ul>
</div>
<div class="pageGo" style="padding:50 20;text-align: right" align="right">
    <form class="form-horizontal" method="get" role="form">
        <div class="form-group">
        <div class="col-md-2">
            页次<input type="text" class="form-control">/${entity.total}
        </div>
        <div class="col-md-2">
        <input type="submit" class="form-control btn btn-primary ">
        </div></div>
    </form>
</div>
</div>

<%@ include file="/WEB-INF/views/copyright.html" %>
</body>
</html>
