<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.xtu.DB.vo.AllContestVO" %>
<%@ page import="javax.lang.model.element.NestingKind" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
  AllContestVO vo=(AllContestVO) request.getAttribute("vo");
  String currentPage=String.valueOf(vo.getStart()+1);
  String totalPage=String.valueOf(vo.getTotal()/20+1);
  pageContext.setAttribute("currentPage",currentPage);
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
  <%@ include file="/WEB-INF/views/navigation.jsp"%>

  </div>
  <div class="container">
    <div class="page" align="justify">
      <ul class="pager">
        <c:if test="${currentPage != 1}">
          <li class="previous"><a href="/test/allTest/0">&laquo;&laquo;The First Page</a></li>
        </c:if>
        <c:if test="${currentPage > 1}">
          <li class="previous"><a href="/test/allTest/${currentPage-2}">&laquo;Previous Page</a></li>
        </c:if>
        <c:if test="${currentPage > 2 }">
          <li class="start"><a href="/test/allTest/${currentPage-3}">${currentPage-2}</a></li>
        </c:if>
        <c:if test="${currentPage > 1 }">
          <li class="start"><a href="/test/allTest/${currentPage-2}">${currentPage-1}</a></li>
        </c:if>

        <li class="start"><a href="/test/allTest/${currentPage-1}" disabled="disabled">${currentPage}</a></li>

        <c:if test="${currentPage < totalPage}">
          <li class="start"><a href="/test/allTest/${currentPage}">${currentPage+1}</a></li>
        </c:if>
        <c:if test="${currentPage < totalPage-1}">
          <li class="start"><a href="/test/allTest/${currentPage+1}">${currentPage+2}</a></li>
        </c:if>
        <li class="start">
          The&nbsp;${currentPage}/${totalPage}&nbsp;Page&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Total&nbsp;${vo.total}&nbsp;Records
        </li>
        <c:if test="${currentPage < totalPage}">
          <li class="next"><a href="/test/allTest/${totalPage-1}">The Last Page&raquo;&raquo;</a></li>
        </c:if>
        <c:if test="${currentPage < totalPage}">
          <li class="next"><a href="/test/allTest/${vo.start+1}">Next Page&raquo;</a></li>
        </c:if>
      </ul>
    </div>
  </div>
  <div class="contest" style="padding:0px 100px;">
    <table class="table table-hover" style="width: 1000px;margin:60px 100px ">
      <thead>
      <tr>
        <th class="col-md-2">Contest.ID</th>
        <th class="col-md-6">Contest Title</th>
        <th class="col-md-2">Start Time</th>
        <th class="col-md-2">End Time</th>
      </tr>
      </thead>
      <tbody>
      <c:forEach items="${vo.entityList}" var="entity">
      <tr>
        <th><a href="/test/testDetail/${entity.contestId}">${entity.contestId}</a></th>
        <th><a href="/test/testDetail/${entity.contestId}">${entity.title}</a></th>
        <th>${entity.startTime}</th>
        <th>${entity.endTime}</th>
        </c:forEach>
      </tbody>
    </table>
  </div>
  </div>
  </body>
</html>
