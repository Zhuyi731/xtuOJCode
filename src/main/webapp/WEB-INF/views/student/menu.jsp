<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base target="contentFrame" href="<%=basePath%>">
    <title>学生信息</title> 
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
   <div class="menuBar"  style="padding-left:30px;" >
    <table class="table table-hover table-border"  >
     <thead >
      <tr >
     	<td id="menuTitle1" onclick="showSubmenu(1)"><span class="title">个人信息管理</span><td>
     </tr>
     </thead>
     <tbody id="subMenu1" style="display:;">
     <tr><td >
     	<a href="student/modifyPassword">修改密码</a>
     	</td></tr>
     	<tr><td>
     	<a href="student/stuInfo">修改个人信息</a>
     	</td></tr>
     </tbody></table>
     	
        </div>
   </body>
</html>
