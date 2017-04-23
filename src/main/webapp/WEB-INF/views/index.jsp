<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
<title>XTU Online Judgement System</title>
<link href="/css/bootstrap.css" rel='stylesheet' type='text/css' />
<link href="/css/style.css" rel="stylesheet" type="text/css" media="all" />
	<link href="/css/bootstrap.min.css" rel="stylesheet" type="text/css" media="all" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

</head>
<body>
	<%@ include file="/WEB-INF/views/navigation.jsp"%>
    <div align="center">
	<iframe src="/news/newsDetail" frameborder="0" height="600px" width="1000px" name="news" marginheight="50px" scrolling="auto" ></iframe>
	</div>
	<%@ include file="/WEB-INF/views/copyright.html" %>
	
</body>
</html>