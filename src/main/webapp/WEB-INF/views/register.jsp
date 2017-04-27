<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>用户注册</title>    
    <META content="text/html; charset=utf-8" http-equiv=Content-Type>
	<link rel="stylesheet" href="css/bootstrap.css">
	<link rel="stylesheet" href="css/custom.css">
  </head>
  <body>
<%@ include file="/WEB-INF/views/navigation.jsp"%>
	<!-- 表单 -->
	<form role="form" method="post" class="form-horizontal" action="registerServlet"  align="middle" >
	<div class="form-group">
		<label for="accountReg" class="col-sm-2 col-sm-offset-2 control-label" >账号：</label>
		<div class="col-sm-3" >
		<input type="text" id="accountReg" class="form-control " placeholder="输入你的账户名"> 
		</div>
	</div>
	<div class="form-group">
		<label for="passwordReg" class="col-sm-2 col-sm-offset-2 control-label">密码：</label>
		<div class="col-sm-3" >
		<input type="password" class="form-control col-xs-4" id="passwordReg" placeholder="请输入密码">
	    </div>
	</div>
	<div class="form-group">
		<label for="passwordRep" class="col-sm-2 col-sm-offset-2 control-label">密码确认：</label>
		<div class="col-sm-3" >
		<input type="password" class="form-control col-xs-4" id="passwordRep" placeholder="请再输入一次密码">
	    </div>
	</div>
	
	<div class="form-group">
		<label for="stuId" class="col-sm-2 col-sm-offset-2 control-label" placeholder="非本校学生不填" >学号：</label>
		<div class="col-sm-3" >
		<input type="text" class="form-control" id="stuId"> 
		</div>
	</div>
	<div class="form-group">
		<label for="nickname" class="col-sm-2 col-sm-offset-2 control-label">昵称：</label>
		<div class="col-sm-3" >
		<input type="text" class="form-control" id="nickname">
		</div>
	</div>
	<div class="form-group">
		<label for="phone" class="col-sm-2 col-sm-offset-2 control-label" placeholder="联系电话">联系电话：</label>
		<div class="col-sm-3">
		<input type="text" class="form-control" id="phone" style="text-align:center">
		</div>
	</div>
	<div class="form-group">
		
	</div>
	<div class="form-group" align="middle">
		<div class="col-sm-1 col-sm-offset-4">
		<input type="submit" class="form-control" id="submit" value="注册" >
		</div>
		<div class="col-sm-1 ">
		<input type="reset" class="form-control" id="reset" value="重置">
		</div>
	</div>
	</form>
	<div id="other" style="text-align:center">
	<p>已经有账户？<a href="/login">点这里登录</a></p>
	</div>
	
    <%@ include file="/WEB-INF/views/copyright.html" %>
</body>
</html>
