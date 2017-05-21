<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML >
<html>
  <head>
    <base href="<%=basePath%>">
    <title>Welcome</title>
      <link rel="stylesheet" href="/css/bootstrap.min.css">
      <link rel="stylesheet" href="/css/bootstrap.min.css">
  </head>
  <body>
    <div align="center" style="font-size:20px; color:blue;">
   		Welcome To XTU Online Judgement System!
    </div>
    
    
    
  </body>
</html>
