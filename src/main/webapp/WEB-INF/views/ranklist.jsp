<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML>
<html>
  <head>
    <base href="<%=basePath%>">
    <title>Ranklist</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />   
<link href="css/bootstrap.css" rel='stylesheet' type='text/css' />
<link href="css/bootstrap.min.css" rel='stylesheet' type='text/css' />
<style type="text/css">
	.ranklist{
		position:relative;height:auto;min-height:100%;padding-bottom:60px;
	}
	.pager{
		padding:0px 150px
	}
	.container{
		margin:50px;
	}
</style>
  </head>
  <body>
   <%@ include file="/WEB-INF/views/navigation.jsp"%>
	<!-- 翻页功能 -->
	<div class="container"  >
		<div class="page">
		<ul class="pager" >
			<li class="previous"><a href="/ranklist/0">&laquo;&laquo;第一页</a></li>
			<li class="previous"><a href="/ranklist/${pageNo-1}">&laquo;上一页</a></li>
			<li class="next"><a href="/ranklist/${total}">最后一页&raquo;&raquo;</a></li>
			<li class="next"><a href="/ranklist/${pageNo+1}">下一页&raquo;</a></li>
		</ul>
	</div>
		<div class="ranklist">
		<table class="table table-hover" style="width:1000px;margin:30px 100px; ">
			<thead>
			  <tr >
			    <th class="col-md-1">Rank</th>
				<th class="col-md-1">User.ID</th>
				<th class="col-md-2">User.name</th>
				<th class="col-md-1">Accept/Submit</th>
				<th class="col-md-1">Ratio</th>
			  </tr>
			</thead>
			<tbody>
			<c:forEach items="${vo.entityList}" var="entity">
			<tr>
			  	<th>${entity.rank}</th>
			    <th>${entity.id}</th>
			    <th>${entity.name}</th>
			    <th>${entity.acProblemsNum}/${entity.submitProblemsNum}</th>
			    <th>${entity.ratio}</th>
			</tr></c:forEach>
			</tbody>
		</table>
		</div>
	</div>
    <%@ include file="/WEB-INF/views/copyright.html" %>
  </body>
</html>