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
<!-- 表单 -->
<div style="margin-top: 50px;">
<form role="form" method="post" class="form-horizontal" align="middle">
    <div class="form-group">
        <label for="name" class="col-sm-2 col-sm-offset-2 control-label">姓名:</label>
        <div class="col-sm-3">
            <input type="text" id="name" name="name" class="form-control " value="${entity.name}">
        </div>
    </div>
    <div class="form-group">
        <label for="college" class="col-sm-2 col-sm-offset-2 control-label">班级:</label>
        <div class="col-sm-3">
            <input type="text" id="college" name="college" class="form-control " value="" readonly="readonly">
        </div>
    </div>
    <div class="form-group">
        <label for="nickName" class="col-sm-2 col-sm-offset-2 control-label">Nickname：</label>
        <div class="col-sm-3">
            <input type="text" class="form-control" name="nickName" id="nickName" value=${entity.nickName}>
        </div>
    </div>
    <div class="form-group">
        <label for="QQ" class="col-sm-2 col-sm-offset-2 control-label">QQ：</label>
        <div class="col-sm-3">
            <input type="text" class="form-control" id="QQ" name="QQ" value=${entity.QQ}>
        </div>
    </div>
    <div class="form-group">
        <label for="email" class="col-sm-2 col-sm-offset-2 control-label">Email：</label>
        <div class="col-sm-3">
            <input type="text" class="form-control" id="email" name="email" value="${entity.Email}">
        </div>
    </div>
    <div class="form-group">
        <label for="status" class="col-sm-2 col-sm-offset-2 control-label">是否展示个人信息：</label>
        <div class="col-sm-3 " style="padding-left:0;">
            <input type="radio" id="status" name="status" value="1" checked="checked">是
            <input type="radio" name="display" value="0">否
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
</form>

<div align="center">
</div>
<div id="other" style="text-align:center">
    <br>
    <p style="font-size:18px;color:red">若姓名、班级信息有错误，请联系谢勇老师</p>
</div>
</div>
</body>
</html>
