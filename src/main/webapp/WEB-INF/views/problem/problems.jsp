<%@ page pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>题库</title>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<link href="/css/bootstrap.css" rel='stylesheet' type='text/css' />
  	<link href="/css/bootstrap.min.css" rel='stylesheet' type='text/css' />
	<link href="/css/style.css" rel="stylesheet" />
  </head>
  <body>
	<%@ include file="/WEB-INF/views/navigation.jsp"%>
	<div class="container" width="60%" style="margin:50px">
		<div class="page">
		<ul class="pager" style="padding: 0px 150px">
		  <li class="previous"><a href="#">&laquo;上一页</a></li>
		  <li class="next"><a href="#">下一页&raquo;</a></li>
		</ul>
		</div>
		<div class="problems">
		<table class="table table-hover" style="width: 1000px;margin: 30px 100px ">
			<thead>
			  <tr>
				<th class="col-md-2" >ID</th>
				<th class="col-md-6">Title</th>
				<th class="col-md-2">accept/submit</th>
				<th class="col-md-2">Ratio</th>
			  </tr>
			</thead>
			<tbody>
			  <tr>
			    <th><a href="proDetail?pid=10001">10001</a></th>
			    <th><a  href="proDetail?pid=10001">A+B</a></th>
			    <th>9/11</th>
			    <th>81.82%</th>
			</tbody>
		</table>
		</div>
	</div>

    <%@ include file="/WEB-INF/views/copyright.html" %>
  </body>
</html>
