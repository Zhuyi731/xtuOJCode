<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="securityrity" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE HTML >
<html>
<head>
    <base href="<%=basePath%>">
    <title>教师信息修改</title>
    <META content="text/html; charset=utf-8" http-equiv=Content-Type>
    <link rel="stylesheet" href="/css/bootstrap.min.css">
    <link rel="stylesheet" href="/css/custom.css">
</head>
<body>
<security:authorize access="isAuthenticated()">
    <securityrity:authentication property="principal.username" var="userId"/>
</security:authorize>
<!-- 表单 -->
<div style="margin-top: 50px;">
<sf:form  role="form" method="post" class="form-horizontal" align="center">
    <div class="form-group">
        <label for="name" class="col-sm-2 col-sm-offset-2 control-label">姓名:</label>
        <div class="col-sm-3">
            <input type="text" id="name" name="name" class="form-control " value="${entity.name}" readonly="readonly">
        </div>
    </div>
    <div class="form-group">
        <label for="college" class="col-sm-2 col-sm-offset-2 control-label">班级:</label>
        <div class="col-sm-3">
            <input type="text" id="college" name="college" class="form-control " value="" readonly="readonly">
        </div>
    </div>
    <div class="form-group">
        <label for="nickname" class="col-sm-2 col-sm-offset-2 control-label">Nickname：</label>
        <div class="col-sm-3">
            <input type="text" class="form-control" name="nickname" id="nickname" value=${entity.nickname}>
        </div>
    </div>
    <div class="form-group">
        <label for="QQ" class="col-sm-2 col-sm-offset-2 control-label">QQ：</label>
        <div class="col-sm-3">
            <input type="text" class="form-control" id="QQ" name="QQ" value=${entity.qq}>
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
            <input type="text" class="form-control" id="email" name="email" value="${entity.email}">
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
        <label for="phone" class="col-sm-2 col-sm-offset-2 control-label">Phone：</label>
        <div class="col-sm-3">
            <input type="text" class="form-control" id="phone" name="phone" value="${entity.phone}">
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
            <input type="submit" class="form-control btn btn-warning" id="submit" value="修改">
        </div>
        <div class="col-sm-1 ">
            <input type="reset" class="form-control btn btn-primary" id="reset" value="重置">
        </div>

    </div>
</sf:form>

<div align="center">
</div>
<div id="other" style="text-align:center">
    <br>
    <p style="font-size:18px;color:red">若姓名、班级信息有错误，请联系谢勇老师</p>
</div>
</div>
</body>
</html>
