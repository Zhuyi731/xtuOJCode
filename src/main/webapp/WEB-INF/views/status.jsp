<%@ page import="com.xtu.DB.vo.StatusVO" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
    StatusVO vo=(StatusVO) request.getAttribute("vo");
    String currentPage=String.valueOf(vo.getStart()+1);
    pageContext.setAttribute("currentPage",currentPage);
    String totalPage=String.valueOf(vo.getTotal()/20+1);
    pageContext.setAttribute("totalPage",totalPage);
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
    String background = "http://localhost:8080/admin/menu";
    if (background.equals(url)) {
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
    <sf:form commandName="statusDTO" role="form" method="post" class="form-inline">
        <div class="form-group">
            <label for="problemId" class="control-label col-md-1 col-sm-1">Pro.ID</label>
            <div class="col-md-offset-1 col-sm-offset-1">
                <input type="text" class="form-control" name="problemId" id="problemId" placeholder="题目编号">
            </div>
        </div>
        <div class="form-group">
            <label for="id" class="control-label  col-md-1 col-sm-1">username</label>
            <div class="col-md-offset-1 col-sm-offset-1">
                <input type="text" class="form-control" name="id" id="id" placeholder="用户名">
            </div>
        </div>
        <div class="form-group">
            <label for="language" class="control-label ">Language</label>
            <select id="language" name="language" class="form-control col-sm-offset-1 col-md-offset-1">
                <option value="0">All</option>
                <option value="C">C</option>
                <option value="C++">C++</option>
                <option value="Java">Java</option>
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
    </sf:form>
</div>
<div class="page" style="margin:0px 160px;">
    <ul class="pager">
        <c:if test="${currentPage != 1}">
            <li class="previous"><a href="/status/0">&laquo;&laquo;The First Page</a></li>
        </c:if>
        <c:if test="${currentPage > 1}">
            <li class="previous"><a href="/status/${currentPage-2}">&laquo;Previous Page</a></li>
        </c:if>
        <c:if test="${currentPage > 2 }">
            <li class="start"><a href="/status/${currentPage-3}">${currentPage-2}</a></li>
        </c:if>
        <c:if test="${currentPage > 1 }">
            <li class="start"><a href="/status/${currentPage-2}">${currentPage-1}</a></li>
        </c:if>

        <li class="start"><a href="/status/${currentPage-1}" disabled="disabled">${currentPage}</a></li>

        <c:if test="${currentPage < totalPage}">
            <li class="start"><a href="/status/${currentPage}">${currentPage+1}</a></li>
        </c:if>
        <c:if test="${currentPage < totalPage-1}">
            <li class="start"><a href="/status/${currentPage+1}">${currentPage+2}</a></li>
        </c:if>
        <li class="start">
            The&nbsp;${currentPage}/${totalPage}&nbsp;Page&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Total&nbsp;${vo.total}&nbsp;Records
        </li>
        <c:if test="${currentPage < totalPage}">
            <li class="next"><a href="/status/${totalPage-1}">The Last Page&raquo;&raquo;</a></li>
        </c:if>
        <c:if test="${currentPage < totalPage}">
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
