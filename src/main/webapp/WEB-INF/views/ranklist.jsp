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
		  <li class="previous"><a href="#">&laquo;上一页</a></li>
		  <li class="next"><a href="#">下一页&raquo;</a></li>
		</ul>
	</div>
		<div class="ranklist">
		<table class="table table-hover" style="width:1000px;margin:30px 100px; ">
			<thead>
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
			    <th>hard working is a virtual</th>
			    <th>13</th>
			    <th>10% 133/1330</th>
			</tbody>
		</table>
		</div>
	</div>
    <%@ include file="/WEB-INF/views/copyright.html" %>
  </body>
</html>