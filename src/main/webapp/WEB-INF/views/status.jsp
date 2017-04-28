<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE  HTML>
<html>
<head>
    <base href="<%=basePath%>">
    <title>Online Status</title>
    <link href="css/bootstrap.min.css" rel='stylesheet' type='text/css' />
    <style type="text/css">
        h1 {
            text-align: center;
            color: blue;
            size: 30px;
        }
        .search {
            margin-top: 20px;
            text-align: center;
        }
        thead {
            background-color: #2C333D;
            color: white;
        }
        .status {
            width: 1040px;
        }

        .status > table {
            margin-left: 160px;
        }
    </style>
</head>
<body>
<%
    String url = request.getHeader("referer");
    String backGroud = "http://localhost:8080/admin/menu";
    if (backGroud.equals(url)) {
        pageContext.setAttribute("nav", 0);
    } else {
        pageContext.setAttribute("nav", 1);
    }
%>
<c:if test="${nav eq 1}">
    <%@ include file="/WEB-INF/views/navigation.jsp"%>
</c:if>
<h1>Online Status</h1>
<div class="search" style="line-height:15px;">
    <form role="form" method="get" class="form-inline">
        <div class="form-group">
            <label for="proID" class="control-label col-md-1 col-sm-1">Pro.ID</label>
            <div class="col-md-offset-1 col-sm-offset-1">
                <input type="text" class="form-control" name="proID" id="proID" placeholder="题目编号">
            </div>
        </div>
        <div class="form-group">
            <label for="username" class="control-label  col-md-1 col-sm-1">username</label>
            <div class="col-md-offset-1 col-sm-offset-1">
                <input type="text" class="form-control" name="username" id="username" placeholder="用户名">
            </div>
        </div>
        <div class="form-group">
            <label for="language" class="control-label ">Language</label>
            <select id="language" name="language" class="form-control col-sm-offset-1 col-md-offset-1">
                <option value="0">All</option>
                <option value="1">C</option>
                <option value="2">C++</option>
                <option value="3">Java</option>
            </select>
        </div>
        <div class="form-group">
            <label for="result" class="control-label">Result</label>
            <select id="result" name="result" class="form-control col-md-offset-1 col-sm-offset-1">
                <option value="0">All</option>
                <option value="1">Accept</option>
                <option value="2">Presentation Error</option>
                <option value="3">Wrong Answer</option>
                <option value="4">Time Limit Error</option>
                <option value="5">Memory Exceed Error</option>
                <option value="6">Output Error</option>
                <option value="7">Runtime Error</option>
                <option value="8">Compile Error</option>
                <option value="9">Compiling</option>
                <option value="10">Waiting</option>
                <option value="11">Running and Judging</option>
            </select>
        </div>
        <div class="form-group" style="padding-top:15px;">
            <input type="submit" value="Search" class="btn bg-primary  col-md-offset-1 col-sm-offset-1">
        </div>
    </form>
</div>
<div class="page" style="margin:0px 160px;">
    <ul class="pager">
        <li class="previous"><a href="/status/0">&laquo;&laquo;The First Page</a></li>
        <c:if test="${vo.start != 0}">
            <li class="previous"><a href="/status/${vo.start-1}">&laquo;Previous Page</a></li>
        </c:if>
        <li>共${vo.total}页</li>
        <li class="next"><a href="/status/${vo.total+0}">The Last Page&raquo;&raquo;</a></li>
        <c:if test="${vo.start < vo.total-1}">
            <li class="next"><a href="/status/${vo.start+1}">Next Page&raquo;</a></li>
        </c:if>
    </ul>
</div>
<div class="status">
    <table class="table table-bordered table-hover">
        <thead>
        <tr>
            <td class="col-md-offset-1 col-md-1 col-sm-offset-1 col-sm-1">Run.ID</td>
            <td class="col-md-1 col-sm-1">Pro.ID</td>
            <td class="col-md-1 col-sm-1">Author</td>
            <td class="col-md-1 col-sm-1">Result</td>
            <td class="col-md-1 col-sm-1">Memory</td>
            <td class="col-md-1 col-sm-1">Time</td>
            <td class="col-md-1 col-sm-1">Code Status</td>
            <td class="col-md-1 col-sm-1">Language</td>
            <td class="col-md-1 col-sm-1">Code.Len</td>
            <td class="col-md-2 col-sm-1">Submit Time</td>
        </thead>
        <tbody>
        <c:forEach items="${vo.entityList}" var="entity">
            <tr>
                <td>${entity.runId}</td>
                <td>${entity.problemId}</td>
                <td>${entity.id}</td>
                <td>${entity.resultCode}</td>
                <td>${entity.runMemory}</td>
                <td>${entity.runTime}</td>
                <c:if test="${entity.open eq 0}">
                    <td><span class="private">Private</span></td>
                </c:if>
                <c:if test="${entity.open eq 1}">
                <td><span class="public"><a href="/codeDetail/${entity.runId}">${entity.language}>Public</a></span></td>
                </c:if>
                <td>${entity.language}</td>
                <td>${entity.codeLength}</td>
                <td>${entity.submitTime}</td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
</body>
</html>
