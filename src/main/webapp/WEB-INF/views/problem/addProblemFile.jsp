<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/4/20
  Time: 14:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>添加题目数据文件</title>
</head>
<body>
<form class="form-horizontal form-label-left" role="form">
    <div class="form-group">
        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="title">题目名称:<span class="required">*</span>
        </label>
        <div class="col-md-6 col-sm-6 col-xs-12">
            <input type="text" id="title" name="title" class="form-control col-md-7 col-xs-12" name="name" placeholder="Enter Problem Title">
        </div>
    </div>
    <div class="form-group">
        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="status">题目状态:
        </label>
        <div class="col-md-6 col-sm-6 col-xs-12" id="status">
            <input type="radio"  name="status" class="form-control col-md-7 col-xs-12" value="0" checked="checked">0
            <input type="radio"  name="status" class="form-control col-md-7 col-xs-12" value="1">1
        </div>
    </div>
    <div class="form-group">
        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="timeLimit">时间限制(ms):
        </label>
        <div class="col-md-6 col-sm-6 col-xs-12">
            <input type="number" id="timeLimit" name="timeLimit" class="form-control col-md-7 col-xs-12" >
        </div>
    </div>
    <div class="form-group">
        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="timeLimit">内存限制(MB):
        </label>
        <div class="col-md-6 col-sm-6 col-xs-12">
            <input type="number" id="timeLimit" name="timeLimit" class="form-control col-md-7 col-xs-12" >
        </div>
    </div>
    <div class="form-group">
        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="context">题目内容:</label>
        <div class="col-md-6 col-sm-6 col-xs-12">
            <textarea id="context" name="context" class="form-control col-md-7 col-xs-12" cols="60" rows="8">
        </div>
    </div>
    <div class="form-group">
        <input type="submit" value="下一步">
    </div>
</form>
</body>
</html>
