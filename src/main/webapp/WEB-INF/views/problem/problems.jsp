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
<div class="search">
    <form role="form" method="post" class="form-inline">
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
    <div class="page" align="justify">
        <ul class="pager" >
            <li class="previous"><a href="/problem/problems/${entity.start-1}">&laquo;上一页</a></li>
            <li class="start"><a href="/problem/problems/${entity.start+0}">${entity.start+1}</a></li>
            <li class="start"><a href="/problem/problems/${entity.start+1}">${entity.start+2}</a></li>
            <li class="start"><a href="/problem/problems/${entity.start+2}">${entity.start+3}</a></li>
            <li class="start"><a href="/problem/problems/${entity.start+3}">${entity.start+4}</a></li>
            <li class="start"><a href="/problem/problems/${entity.start+4}">${entity.start+5}</a></li>
            <li class="start">共${entity.start+1}/${entity.total+1}页</li>
            <li class="next"><a href="/problem/problems/${entity.start+1}">下一页&raquo;</a></li>
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
            <li class="previous"><a href="/problem/problems/${entity.start-1}">&laquo;上一页</a></li>
            <li class="start"><a href="/problem/problems/${entity.start}">${entity.start}</a></li>
            <li class="start"><a href="/problem/problems/${entity.start+1}">${entity.start+1}</a></li>
            <li class="start"><a href="/problem/problems/${entity.start+2}">${entity.start+2}</a></li>
            <li class="start"><a href="/problem/problems/${entity.start+3}">${entity.start+3}</a></li>
            <li class="start"><a href="/problem/problems/${entity.start+4}">${entity.start+4}</a></li>
            <li class="start">共${entity.start}/${entity.total}页</li>
            <li class="next"><a href="/problem/problems/${entity.start+1}">下一页&raquo;</a></li>
        </ul>
    </div>
    <div class="pageGo">
        <form role="form" method="post" class="form-inline" style="line-height: 30px;">
            <div class="form-group">
            <label for="pageGo" class="col-md-2 col-sm-2">页码:</label>
            </div>
            <div class="form-group">
                <div class=col-md-2">
                    <input type="text" class="form-control "  style="width: 60px;height: 30px;" name="pageGo" id="pageGo" placeholder="页码">/100
                </div>
            </div>
            <div class="form-group">
                <div class="col-md-2">
                    <input type="submit" class="btn btn-primary submit"  value="GO">
                </div>
            </div>
        </form>
    </div>
    <%@ include file="/WEB-INF/views/copyright.html" %>
</body>
</html>
