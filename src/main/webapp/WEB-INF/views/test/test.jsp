<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>考试</title> 
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<link href="css/bootstrap.css" rel='stylesheet' type='text/css' />
	<link href="css/bootstrap.min.css" rel='stylesheet' type='text/css' />
	<link href="css/style.css" rel="stylesheet" />
	</head>
	<body>
	<%@ include file="/WEB-INF/views/navigation.jsp" %>
  <div class="chooseTest" style="margin:20px 50px;" align="center">
    <a class="btn btn-info btn-lg col-md-3" href="test/allTest" >所有考试</a>
    <a class="btn btn-info btn-lg col-md-offset-1 col-md-3" href="test/createTest" >创建考试(仅老师)</a>
    <a class="btn btn-success btn-lg col-md-offset-1 col-md-3"  href="test/joinTest">参加考试</a>
  </div>
  <script src="http://libs.baidu.com/jquery/1.9.0/jquery.js"></script>
  <script src="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script> 
  </body>
</html>
