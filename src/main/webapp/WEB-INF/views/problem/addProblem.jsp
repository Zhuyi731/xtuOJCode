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
    <title>添加题目</title>
    <META content="text/html; charset=utf-8" http-equiv=Content-Type>
    <link rel="stylesheet" href="/css/bootstrap.min.css">
    <link rel="stylesheet" href="/css/custom.css">
</head>
<body>
<div class="headTitle">
</div>
<sf:form class="form-horizontal form-label-left" role="form" enctype="multipart/form-data">
    <div class="form-group">
        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="title">题目名称:<span class="required">*</span>
        </label>
        <div class="col-md-6 col-sm-6 col-xs-12">
            <input type="text" id="title" name="title" class="form-control col-md-7 col-xs-12"
                   placeholder="Enter Problem Title">
        </div>
</div>
    <div class="form-group">
        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="status">题目状态:
        </label>
        <div class="col-md-6 col-sm-6 col-xs-12" id="status">
            隐藏 <input type="radio" name="status" value="0" style="margin-right: 20">
            公开 <input type="radio" name="status" value="1" checked="checked">
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
        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="problemDes">题目描述:</label>
        <div class="col-md-6 col-sm-6 col-xs-12">
            <textarea id="problemDes" name="problemDes" class="form-control col-md-7 col-xs-12" cols="60" ></textarea>
        </div>
    </div>
    <div class="form-group">
        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="inputDes">输入描述:</label>
        <div class="col-md-6 col-sm-6 col-xs-12">
            <textarea id="inputDes" name="inputDes" class="form-control col-md-7 col-xs-12" cols="60" ></textarea>
        </div>
    </div>
    <div class="form-group">
        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="outputDes">输出描述:</label>
        <div class="col-md-6 col-sm-6 col-xs-12">
            <textarea id="outputDes" name="outputDes" class="form-control col-md-7 col-xs-12" cols="60" ></textarea>
        </div>
    </div>
    <div class="form-group">
        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="sampleInput">Sample Input:</label>
        <div class="col-md-6 col-sm-6 col-xs-12">
            <textarea id="sampleInput" name="sampleInput" class="form-control col-md-7 col-xs-12" cols="60" ></textarea>
        </div>
    </div>
    <div class="form-group">
        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="sampleOutput">Sample Output:</label>
        <div class="col-md-6 col-sm-6 col-xs-12">
            <textarea id="sampleOutput" name="sampleOutput" class="form-control col-md-7 col-xs-12" cols="60" ></textarea>
        </div>
    </div>
    <div class="form-group">
        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="uploadFile">上传数据文件(.zip):</label>
        <div class="col-md-6 col-sm-6 col-xs-12">
            <input type="file" id="uploadFile" accept=".zip" name="uploadFile" class="form-control">
        </div>
    </div>
    <div class="form-group" align="center">
        <input type="submit" class="btn btn-lg btn-primary" value="确定">
    </div>
</sf:form>
</body>
</html>