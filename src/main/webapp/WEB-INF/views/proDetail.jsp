<%@ page pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>10001 题目</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="css/bootstrap.css" rel='stylesheet' type='text/css' />
<link href="css/bootstrap.min.css" rel='stylesheet' type='text/css' />
<link href="css/style.css" rel="stylesheet" />
  <style type="text/css">
  .proDetail{
    font-family:Times New Roman;
    margin:10 30;
    padding:20 250;
    background-color:;
  }
  .proDetail>p{
    font-family:Times New Roman;
    font-size:20px;
    background-color:#FFF093;
  }
  .proDetail>h3{
    margin-top:20px;
    
  }
  </style>
  </head>
 <body>
	<%@ include file="/WEB-INF/views/navigation.jsp"%>
    <div class="head">
    	
    </div>
	<h1 class="title" align="middle">A+B</h1>
	<div class="proDetail">
	<h3>Problem Description</h3>
	<p width="800px" height="auto">
	 Your task is to calculate two interge
	</p>
	<h3>Input Description</h3>
	<p>
	Two Interge A,B (A,B<100000000)
	</p>
	<h3>Output Description</h3>
	<p>
	Print one interge equals A+B
	</p>
	<h3>Sample Input</h3>
	<p>
	1 2<br>
	150 340
	<p>
	<h3>Sample Output</h3>
	<p>
	3<br>
	490
	<p>
	</div>
	<div class="tail" align="center">
	  <a class="btn btn-info btn-lg "  style="width:150px;" href="submit.jsp?id=10001">Submit code</a>
	  <a class="btn btn-info btn-lg" style="width:150px; margin-left:40;" href="discuss.jsp?id=10001">Discuss</a>
	</div>
	<%@ include file="/WEB-INF/views/copyright.html"%>
 </body>
  
  
  
 </html>
  