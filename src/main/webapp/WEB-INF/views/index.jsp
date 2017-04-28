<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
<title>XTU Online Judgement System</title>
	<link href="/css/bootstrap.min.css" rel="stylesheet" type="text/css" media="all" />
	<link href="/css/custom.css" rel="stylesheet" type="text/css"/>
</head>
<body>
	<%@ include file="/WEB-INF/views/navigation.jsp"%>
    <div align="center">
	<iframe src="/news/newsDetail" frameborder="0" height="600px" width="1000px" marginheight="50px" scrolling="auto" ></iframe>
	</div>
	<%@ include file="/WEB-INF/views/copyright.html" %>
</body>
</html>