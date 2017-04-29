<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML >
<html>
  <head>
    <base href="<%=basePath%>">
    <title>成功</title>  
    <META content="text/html; charset=utf-8" http-equiv=Content-Type>
	<link rel="stylesheet" href="/css/bootstrap.min.css">
	<link rel="stylesheet" href="/css/custom.css">
  </head>
  
  <body>
    <div align="center">
       <font color="red" size=16px>密码修改成功!</font><br>
       <a onclick="window.history.go(-1);">点击返回</a>
    </div>
  </body>
</html>
