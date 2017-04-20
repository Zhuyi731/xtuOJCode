<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base target="contentFrame" href="<%=basePath%>">
    <title>教师后台管理</title>
	<META content="text/html; charset=utf-8" http-equiv=Content-Type>
	<link rel="stylesheet" href="css/bootstrap.css">
	<link rel="stylesheet" href="css/style.css">
	<style type="text/css">
	div{
	 margin-top: 20px;
    }
     table{
      margin-bottom: 0px;
     }
	</style>
	</head>
  <body style="background-color:DCDCDC">
	  <div class="head" align="center">
	     	<p size="5px" class="text-muted">教师后台管理</p>
	  </div>
      <div class="dropdown" >
       <button class="btn btn-primary dropdown-toggle form-control" type="button" id="dropdownMenu1" data-toggle="dropdown">
        个人信息管理
        <span class="caret"></span>
       </button>
       <ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu1">
        <li role="presentation"><a href="/modifyPassword">修改密码</a></li>
        <li role="presentation"><a href="/modifyUserInfo">修改个人信息</a></li>
        </ul>
      </div>
      <div class="dropdown" >
       <button class="btn btn-primary dropdown-toggle form-control" type="button" id="dropdownMenu2" data-toggle="dropdown">
        学生管理
        <span class="caret"></span>
       </button>
       <ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu2" >
        <li role="presentation"><a href="common/showStudent">查看自己所有学生</a></li>
        <li role="presentation"><a href="common/addStudent">添加学生</a></li>
       </ul>
      </div>
      <div class="dropdown" >
       <button class="btn btn-primary dropdown-toggle form-control" type="button" id="dropdownMenu3" data-toggle="dropdown">
        题库管理
        <span class="caret"></span>
       </button>
       <ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu3" >
        <li role="presentation"><a href="problem/proManager">查看题库</a></li>
        <li role="presentation"><a href="problem/addProblem">添加题目</a></li>
       </ul>
      </div>
      <div class="dropdown" >
       <button class="btn btn-primary dropdown-toggle form-control" type="button" id="dropdownMenu4" data-toggle="dropdown">
        比赛管理
        <span class="caret"></span>
       </button>
       <ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu4" >
        <li role="presentation"><a href="test/allTest">所有比赛</a></li>
        <li role="presentation"><a href="test/createTest">创建比赛</a></li>
       </ul>
      </div>
      <div >
       <button class="btn btn-danger form-control" type="button">退出登录</button>
      </div>
  </body>
  <script src="http://libs.baidu.com/jquery/1.9.0/jquery.js"></script>
  <script src="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
</html>
