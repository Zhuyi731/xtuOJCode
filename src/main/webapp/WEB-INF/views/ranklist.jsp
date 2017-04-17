<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>Ranklist</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />   
<link href="css/bootstrap.css" rel='stylesheet' type='text/css' />
<link href="css/bootstrap.min.css" rel='stylesheet' type='text/css' />
<link href="css/style.css" rel="stylesheet" />

  </head>
  
  <body>
   <%@ include file="/WEB-INF/views/navigation.jsp"%>
	
	<!-- 翻页功能 -->
	<div class="container" width="60%" style="margin:50">
		<div class="page">
		<ul class="pager" style="padding:0 150">
		  <li class="previous"><a href="#">&laquo;上一页</a></li>
		  <li class="next"><a href="#">下一页&raquo;</a></li>
		</ul>
	</div>
		
		<div class="ranklist"  style="position:relative;height:auto;min-height:100%;padding-bottom:60px;">
		<table class="table table-hover" style="width: 1000px;margin:30 100; ">
			<thead >
			  <tr >
			    <th class="col-md-1">Rank</th>
				<th class="col-md-1">User.ID</th>
				<th class="col-md-2">User.name</th>
				<th class="col-md-5" >Motto</th>
				<th class="col-md-1">AC</th>
				<th class="col-md-2">Ratio(accept/submit)</th>
			  </tr>
			</thead>
			<tbody>
			  <tr>
			  	<th>1</th>
			    <th>10001</th>
			    <th>zhy731</th>
			    <th>hard working is a virture</th>
			    <th>13</th>
			    <th>10% 133/1330</th>
			</tbody>
		</table>
		</div>
	</div>
	
    <%@ include file="/WEB-INF/views/copyright.html" %>
  </body>
</html>
