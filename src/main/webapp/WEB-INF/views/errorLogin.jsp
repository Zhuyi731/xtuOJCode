<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%--登录错误之后跳转的界面--%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>登录信息错误</title>
	<META content="text/html; charset=utf-8" http-equiv=Content-Type>
	<link rel="stylesheet" href="css/bootstrap.css">
	<link rel="stylesheet" href="css/style.css">
  </head>
  <body>
  <%@ include file="/WEB-INF/views/navigation.jsp" %>
     	<div align="center"> 
     	<p> 对不起，您输入的密码错误。 <br>
     	  <a href="login.jsp">点击返回登录页面</a> </p>
  		</div>
  </body>
</html>
