<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%--登录错误之后跳转的界面--%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML >
<html>
  <head>
    <base href="<%=basePath%>">
    <title>登录信息错误</title>
	<META content="text/html; charset=utf-8" http-equiv=Content-Type>
	<link rel="stylesheet" href="css/bootstrap.min.css">
  </head>
  <body>
  <%@ include file="/WEB-INF/views/navigation.jsp" %>
     	<div align="center"> 
     	<p> 对不起，您输入的账号或密码错误。 <br>
     	  <a href="/login">点击返回登录页面</a></p>
  		</div>
  </body>
</html>
