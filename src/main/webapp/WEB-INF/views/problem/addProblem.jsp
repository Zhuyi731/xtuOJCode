<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <base href="<%=basePath%>">
    <title>添加题目</title>
    <META content="text/html; charset=utf-8" http-equiv=Content-Type>
    <link rel="stylesheet" href="css/bootstrap.css">
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <style type="text/css">
        .container {
            text-align: center;
        }
    </style>
</head>
<body>
<div class="head">
</div>
<form class="form-horizontal form-label-left" role="form">
    <div class="form-group">
        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="title">题目名称:<span class="required">*</span>
        </label>
        <div class="col-md-6 col-sm-6 col-xs-12">
            <input type="text" id="title" name="title" class="form-control col-md-7 col-xs-12" name="name"
                   placeholder="Enter Problem Title">
        </div>
    </div>
    <div class="form-group">
        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="status">题目状态:
        </label>
        <div class="col-md-6 col-sm-6 col-xs-12" id="status">
            <input type="radio" name="status"  value="0" checked="checked">0
            <input type="radio" name="status" class="col-md-offset-2" value="1">1
        </div>
    </div>
    <div class="form-group">
        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="timeLimit">时间限制(ms):
        </label>
        <div class="col-md-6 col-sm-6 col-xs-12">
            <input type="number" id="timeLimit" name="timeLimit" class="form-control col-md-7 col-xs-12">
        </div>
    </div>
    <div class="form-group">
        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="memoryLimit">内存限制(MB):
        </label>
        <div class="col-md-6 col-sm-6 col-xs-12">
            <input type="number" id="memoryLimit" name="memoryLimit" class="form-control col-md-7 col-xs-12">
        </div>
    </div>
    <div class="form-group">
        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="context">题目内容:</label>
        <div class="col-md-6 col-sm-6 col-xs-12">
            <textarea id="context" name="context" class="form-control col-md-7 col-xs-12" cols="60" rows="8"></textarea>
        </div>
    </div>
    <div class="form-group" align="center">
        <input type="submit" class="btn btn-lg btn-primary" value="确定">
    </div>
</form>
</body>
</html>