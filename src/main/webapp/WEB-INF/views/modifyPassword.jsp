<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<!DOCTYPE HTML >
<html>
<head>
    <base href="<%=basePath%>" target="contentFrame">
    <title>修改密码</title>
    <META content="text/html; charset=utf-8" http-equiv=Content-Type>
    <link rel="stylesheet" href="/css/bootstrap.min.css">
    <link rel="stylesheet" href="/css/custom.css">
</head>
<body>
<div align="center" class="top50">
    <sf:form commandName="dto" role="form" class="form-horizontal" method="post" onSubmit="return checkPassword()">
        <div class="form-group">
            <label for="oldPassword" class="col-md-2 col-md-offset-2 control-label">旧密码：</label>
            <div class="col-md-3">
                <input type="password" class="form-control col-md-4" id="oldPassword" name="oldPassword"
                       placeholder="请输入之前的密码" maxlength="32">
            </div>
        </div>
        <div class="form-group">
            <label for="password" class="col-md-2 col-md-offset-2 control-label">新密码：</label>
            <div class="col-md-3">
                <input type="password" class="form-control col-md-4" id="password" name="password"
                       placeholder="请输入6~32位新密码" maxlength="32">
            </div>
            <div class="col-md-3"><p id="alert0" style="color:red;display:none">密码长度过短!</p></div>
        </div>
        <div class="form-group">
            <label for="repPassword" class="col-md-2 col-md-offset-2 control-label">密码确认：</label>
            <div class="col-md-3">
                <input type="password" class="form-control col-md-4" id="repPassword" name="repPassword"
                       placeholder="请再输入一次密码">
            </div>
            <div class="col-md-3"><p id="alert" style="color:red;display:none">两次输入密码不一致!</p></div>
        </div>
        <div class="form-group" align="center">
            <div class="col-sm-1 col-sm-offset-4">
                <input type="submit" class="form-control btn-primary" id="submit" value="提交">
            </div>
            <div class="col-sm-1 ">
                <input type="reset" class="form-control btn-primary" id="reset" value="重置">
            </div>
        </div>
    </sf:form>
</div>
<script src="/js/custom.js"></script>
</body>
</html>
