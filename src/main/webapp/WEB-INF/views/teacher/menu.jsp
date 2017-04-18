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
	 margin-top:20px;
	}
	</style>
	<script  language=javascript1.2>
	function showSubmenu(sid){
	  whichEL=eval("sumMenu"+sid);
	  if(whichEL.style.display=="none"){
	  	eval("subMenu" + sid + ".style.display=\"\";")
	  }else{
	    eval("subMenu"+ sid + ".style.display=\"none\";")
	  }
	}
	
	</script>
  </head>
  <body style="background-color:DCDCDC">
	  <div class="head" align="center">
	     	<p size="5px" color="0099CC">教师后台管理</p>
	  </div>
    
   <div class="menuBar"  style="padding-left:30px;" >
    <table class="table table-hover table-border"  >
     <thead >
      <tr >
     	<td id="menuTitle1" onclick="showSubmenu(1)"><span class="title">个人信息管理</span><td>
     </tr>
     </thead>
     <tbody id="subMenu1" style="display:;">
     <tr><td >
     	<a href="teacher/modifyPassword">修改密码</a>
     	</td></tr>
     	<tr><td>
     	<a href="teacher/teacherInfo">修改个人信息</a>
     	</td></tr>
     	<tr><td>
     	<a href="logoutServlet">退出登录</a>
     	</td></tr>
     </tbody></table>
     	
     <table class="table table-hover table-border">
     <thead>
     <tr><td id="menuTitle2" onclick="showSubmenu(2)"><span>学生管理</span>
     </td></tr></thead>
     <tbody id="subMenu2" style="display:on;"> 
     <tr><td>
     <a href="teacher/showStudent">所有学生</a>
     </td></tr>
     <tr><td>
     <a href="teacher/addStudent">添加学生</a>
     </td></tr>
     </tbody>
     </table>
    
    <table class="table table-hover table-border">
     <thead>
     <tr><td id="menuTitle3" onclick="showSubmenu(3)"><span>题库管理</span>
     </td></tr></thead>
     <tbody id="subMenu3" style="display:on;"> 
     <tr><td>
     <a href="teacher/proManager">查看自己所有题目</a>
     </td></tr>
     <tr><td>
     <a href="teacher/addProblem">添加题目</a>
     </td></tr>
     <tr><td>
     </td></tr>
     </tbody>
     </table>
    
    
    <table class="table table-hover table-border">
     <thead>
     <tr><td id="menuTitle4" onclick="showSubmenu(4)"><span>考试管理</span>
     </td></tr></thead>
     <tbody id="subMenu4" style="display:on;"> 
     <tr><td>
     <a href="teacher/showTest">查看所有考试</a>
     </td></tr>
     <tr><td>
     <a href="/test/createTest" target="_top">创建考试</a>
     </td></tr>
     <tr><td>
     <a href="/test/pastTest" target="_top">过往考试</a>
     </td></tr>
     <tr><td>
     <a href="/test/joinTest" target="_top">正在进行</a>
     </td></tr>
     </tbody>
     </table>
    
    </div>
   </body>
</html>
