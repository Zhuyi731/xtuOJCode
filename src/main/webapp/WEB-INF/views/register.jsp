<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<!DOCTYPE HTML >
<html>
<head>
    <base href="<%=basePath%>">
    <title>用户注册</title>
    <META content="text/html; charset=utf-8" http-equiv=Content-Type>
    <link rel="stylesheet" href="/css/bootstrap.min.css">
    <link rel="stylesheet" href="/css/custom.css">
</head>
<body>
<%@ include file="/WEB-INF/views/navigation.jsp" %>
<!-- 表单 -->
<sf:form role="form" method="post" class="form-horizontal" align="middle">
    <div class="form-group">
        <label for="accountReg" class="col-sm-2 col-sm-offset-2 control-label">账号：</label>
        <div class="col-sm-3">
            <input type="text" id="accountReg" class="form-control " name="id" placeholder="输入你的账户名">
        </div>
    </div>
    <div class="form-group">
        <label for="password" class="col-md-2 col-md-offset-2 control-label">密码：</label>
        <div class="col-md-3">
            <input type="password" class="form-control col-md-4" id="password" name="password"
                   placeholder="请输入6~32位新密码" maxlength="32">
        </div>
        <div class="col-md-3"><p id="alert0" style="color:red;display:none">密码长度过短!</p></div>
    </div>
    <div class="form-group">
        <label for="repPassword" class="col-md-2 col-md-offset-2 control-label">密码确认：</label>
        <div class="col-md-3">
            <input type="password" class="form-control col-md-4" id="repPassword" name="password"
                   placeholder="请再输入一次密码">
        </div>
        <div class="col-md-3"><p id="alert" style="color:red;display:none">两次输入密码不一致!</p></div>
    </div>
    <div class="form-group">
        <label for="name" class="col-sm-2 col-sm-offset-2 control-label">姓名：</label>
        <div class="col-sm-3">
            <input type="text" id="name" class="form-control " name="name" placeholder="输入你的姓名">
        </div>
    </div>
    <div class="form-group">
        <label for="nickname" class="col-sm-2 col-sm-offset-2 control-label">昵称：</label>
        <div class="col-sm-3">
            <input type="text" class="form-control" id="nickname" name="nickname">
        </div>
    </div>
    <div class="form-group">
        <label for="QQ" class="col-sm-2 col-sm-offset-2 control-label">QQ：</label>
        <div class="col-sm-3">
            <input type="text" class="form-control" id="QQ" name="qq" >
        </div>
    </div>
    <div class="form-group">
        <label for="qqOpen" class="col-sm-2 col-sm-offset-2 control-label">是否公开QQ：</label>
        <div class="col-sm-3 " style="padding-left:0;">
            <input type="radio" id="qqOpen" name="qqOpen" value="Y" checked="checked">是
            <input type="radio" name="qqOpen" value="N">否
        </div>
    </div>
    <div class="form-group">
        <label for="email" class="col-sm-2 col-sm-offset-2 control-label">Email：</label>
        <div class="col-sm-3">
            <input type="text" class="form-control" id="email" name="email">
        </div>
    </div>
    <div class="form-group">
        <label for="emailOpen" class="col-sm-2 col-sm-offset-2 control-label">是否公开Email：</label>
        <div class="col-sm-3 " style="padding-left:0;">
            <input type="radio" id="emailOpen" name="emailOpen" value="Y" checked="checked">是
            <input type="radio" name="emailOpen" value="N">否
        </div>
    </div>
    <div class="form-group">
        <label for="phone" class="col-sm-2 col-sm-offset-2 control-label" placeholder="联系电话">联系电话：</label>
        <div class="col-sm-3">
            <input type="text" class="form-control" id="phone" name="phone" style="text-align:center">
        </div>
    </div>
    <div class="form-group">
        <label for="phoneOpen" class="col-sm-2 col-sm-offset-2 control-label">是否公开Email：</label>
        <div class="col-sm-3 " style="padding-left:0;">
            <input type="radio" id="phoneOpen" name="phoneOpen" value="Y" checked="checked">是
            <input type="radio" name="phoneOpen" value="N">否
        </div>
    </div>
    <div class="form-group">

    </div>
    <div class="form-group" align="middle">
        <div class="col-sm-1 col-sm-offset-4">
            <input type="submit" class="form-control" id="submit" value="注册">
        </div>
        <div class="col-sm-1 ">
            <input type="reset" class="form-control" id="reset" value="重置">
        </div>
    </div>
</sf:form>
<div id="other" style="text-align:center">
    <p>已经有账户？<a href="/login">点这里登录</a></p>
</div>

<%@ include file="/WEB-INF/views/copyright.html" %>
</body>
</html>
