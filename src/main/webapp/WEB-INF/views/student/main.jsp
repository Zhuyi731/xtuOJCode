<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>Student</title>  
	<META content="text/html; charset=utf-8" http-equiv=Content-Type>
	<link rel="stylesheet" href="css/bootstrap.css">
	<link rel="stylesheet" href="css/style.css">
  </head>
   <frameset rows="15%,*" cols="*" frameborder="0">
   <frame src="navigationSecond" name="topFrame" scrolling="no" marginheight="0" noresize frameborder="0">
   <frameset cols="13%,*" rows="*" >
   <frame src="/student/menu"  name="menuFrame" frameborder="0"  bordercolor="#006699" scrolling="auto">
   <frame src="/info"  name="contentFrame"  scrolling="auto" frameborder="1" bordercolor="#006699">
   </frameset>
   </frameset>
</html>
