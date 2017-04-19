<%@ page pageEncoding="UTF-8"%>
<%@ taglib  prefix="c"  uri="http://java.sun.com/jsp/jstl/core"  %>
<!DOCTYPE html>
<html>
<head>
    <title>Navigation</title>
    <link href="/css/bootstrap.css" rel='stylesheet' type='text/css' />
    <link href="/css/style.css" rel="stylesheet" type="text/css" media="all" />
    <link href="/css/bootstrap.min.css" rel="stylesheet" type="text/css" media="all" />
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

</head>
<body>
<div class="navbar  navbar-default" role="navigation" style="margin-bottom:50px;background-color:#2c333d; ">
	<div class="col-md-9" >
	<div class="navbar-header">
	<a href="index" class="navbar-brand">XTUOJ</a>
	  　</div>
    <ul class="nav navbar-nav" style="font-size:18px;margin:20px auto;text-align:center;style="color:white;">
        <li><a href="index" style="color:white; ">首页</a></li>
      	<li><a href="problems" style="color:white;">题库</a></li>
      	<li><a href="ranklist" style="color:white;">Ranklist</a></li>
        <li><a href="status" style="color:white;">Status</a></li>
      	<li class="dropdown"><a href="test/test"style="color:white;">考试</a></li>

    </ul>
   </div>
    <div class="col-md-3" style="float:right;top:0px;">
     <c:if test="${student eq null}">
     <c:if test="${teachers eq null }">
     <a class="btn btn-primary btn-lg" href="login" style="width:150px;float:right;">登录</a>
     </c:if>
     <c:if test="${teachers ne null }">
     <a class="btn btn-primary btn-lg" href="teacher/main"  style="width:150px;float:right;">${teachers.tID}</a></c:if>
     </c:if>
     <c:if test="${student ne null}">
     <a class="btn btn-primary btn-lg" href="student/main"  style="width:150px;float:right;">${student.stuID}</a>
     </c:if>
     </div>
   <!-- 搜索按钮 -->
    <!-- 
    <div class="col-md-3" style="float:left;">
     <form action="##" class="navbar-form navbar-left" rol="search">
   	    <div class="form-group">
   		   <input type="text" class="form-control" placeholder="请输入关键词" />
   	    </div>
        <button type="submit" class="btn btn-default">搜索</button>
      -->
     </form>

</div>
</div>
</body>
</html>