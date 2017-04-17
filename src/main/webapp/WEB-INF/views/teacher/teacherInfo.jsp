<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>教师信息修改</title>    
    <META content="text/html; charset=utf-8" http-equiv=Content-Type>
	<link rel="stylesheet" href="css/bootstrap.css">
	<link rel="stylesheet" href="css/style.css">
  </head>
  <body>
	<!-- 表单 -->
	<form role="form" method="post" class="form-horizontal" action="updateStudentServlet"  align="middle" >
	<div class="form-group">
		<label for="stuID" class="col-sm-2 col-sm-offset-2 control-label" >账号：</label>
		<div class="col-sm-3" >
		<input type="text" id="stuID"  name="stuID" class="form-control " value="" disabled> 
		</div>
	</div>
	<div class="form-group">
		<label for="name" class="col-sm-2 col-sm-offset-2 control-label" >姓名：</label>
		<div class="col-sm-3" >
		<input type="text" id="name"  name="name" class="form-control " value="" disabled> 
		</div>
	</div>
	<div class="form-group">
		<label for="college" class="col-sm-2 col-sm-offset-2 control-label" >院系：</label>
		<div class="col-sm-3" >
		<input type="text" id="college"  name="college" class="form-control " value=${student.major} disabled> 
		</div>
	</div>
	<div class="form-group">
		<label for="sex" class="col-sm-2 col-sm-offset-2 control-label" >性别：</label>
		<div class="col-sm-3" >
		<input type="text" id="sex"  name="sex" class="form-control " value="" disabled> 
		</div>
	</div><div class="form-group">
		<label for="motto" class="col-sm-2 col-sm-offset-2 control-label">motto：</label>
		<div class="col-sm-3" >
		<input type="text" class="form-control" id="motto" name="motto" value=""> 
		</div>
	</div>
	<div class="form-group">
		<label for="nickname" class="col-sm-2 col-sm-offset-2 control-label">Nickname：</label>
		<div class="col-sm-3" >
		<input type="text" class="form-control" name="nickname" id="nickname" value="">
		</div>
	</div>
	<div class="form-group">
		<label for="phone" class="col-sm-2 col-sm-offset-2 control-label" >phone：</label>
		<div class="col-sm-3">
		<input type="text" class="form-control" id="phone" name="phone"  value="" >
		</div>
	</div>
	<div class="form-group">
		<label for="email" class="col-sm-2 col-sm-offset-2 control-label" >email：</label>
		<div class="col-sm-3">
		<input type="text" class="form-control" id="email" name="email"  value="" >
		</div>
	</div>
	<div class="form-group">
		<label for="display" class="col-sm-2 col-sm-offset-2 control-label" >是否展示个人信息：</label>
		<div class="col-sm-3 " style="padding-left:0;" >
		<input type="radio"  id="display" name="display" value="1" checked="checked">是
		<input type="radio"  name="display" value="0">否
	</div>
	</div>
	<div class="form-group">
	</div>
	<div class="form-group" align="middle">
		<div class="col-sm-1 col-sm-offset-4">
		<input type="submit" class="form-control" id="submit" value="修改" >
		</div>
		<div class="col-sm-1 ">
		<input type="reset" class="form-control" id="reset" value="重置">
		</div>
		
	</div>
	</form>
	
	<div align="center">
	</div>
	<div id="other" style="text-align:center" >
	<br>
	<p style="font-size:18px;color:red">若有错误，请联系谢勇老师</p>
	</div>
	
</body>
</html>
