<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE HTML>
<html>
<head>
    <base href="<%=basePath%>">
    <title>修改题目</title>
    <META content="text/html; charset=utf-8" http-equiv=Content-Type>
    <link rel="stylesheet" href="/css/bootstrap.min.css">
    <link rel="stylesheet" href="/css/custom.css">
</head>
<body>
<div class="container">
</div>
<sf:form class="form-horizontal form-label-left" role="form" method="post" enctype="multipart/form-data">
    <div class="form-group">
        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="problemId">Pro.ID:</label>
        <div class="col-md-6 col-sm-6 col-xs-12">
            <input type="text" class="form-control col-md-7 col-xs-12"
                   value="${entity.problemId}" disabled="disabled">
        </div>
    </div>
    <div class="form-group">
        <input type="hidden" id="problemId" name="problemId" class="form-control col-md-7 col-xs-12"
               value="${entity.problemId}">
    </div>
    <div class="form-group">
        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="title">题目名称:<span class="required">*</span>
        </label>
        <div class="col-md-6 col-sm-6 col-xs-12">
            <input type="text" id="title" name="title" class="form-control col-md-7 col-xs-12" value="${entity.title}">
        </div>
    </div>
    <div class="form-group">
        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="status">题目状态:
        </label>
        <div class="col-md-6 col-sm-6 col-xs-12" id="status">
            隐藏<input type="radio" name="status" value="0" style="margin-right: 20px;">
            公开<input type="radio" name="status" value="1" checked="checked">
        </div>
    </div>
    <div class="form-group">
        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="timeLimit">时间限制(ms):
        </label>
        <div class="col-md-6 col-sm-6 col-xs-12">
            <input type="number" id="timeLimit" name="timeLimit" class="form-control col-md-7 col-xs-12"
                   value="${entity.timeLimit}">
        </div>
    </div>
    <div class="form-group">
        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="memoryLimit">内存限制(MB):
        </label>
        <div class="col-md-6 col-sm-6 col-xs-12">
            <input type="number" id="memoryLimit" name="memoryLimit" class="form-control col-md-7 col-xs-12"
                   value="${entity.memoryLimit}">
        </div>
    </div>
    <div class="form-group">
        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="problemDes">题目描述:</label>
        <div class="col-md-6 col-sm-6 col-xs-12">
            <textarea id="problemDes" name="problemDes" class="context form-control col-md-7 col-xs-12" cols="60"
                      rows="4">${entity.problemDes}</textarea>
        </div>
    </div>
    <div class="form-group">
        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="inputDes">输入描述:</label>
        <div class="col-md-6 col-sm-6 col-xs-12">
            <textarea id="inputDes" name="inputDes" class="context form-control col-md-7 col-xs-12" cols="60"
                      rows="4">${entity.inputDes}</textarea>
        </div>
    </div>
    <div class="form-group">
        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="outputDes">输出描述:</label>
        <div class="col-md-6 col-sm-6 col-xs-12">
            <textarea id="outputDes" name="outputDes" class="context form-control col-md-7 col-xs-12" cols="60"
                      rows="4">${entity.outputDes}</textarea>
        </div>
    </div>
    <div class="form-group">
        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="sampleInput">Sample Input:</label>
        <div class="col-md-6 col-sm-6 col-xs-12">
            <textarea id="sampleInput" name="sampleInput" class="context form-control col-md-7 col-xs-12" cols="60"
                      rows="4">${entity.sampleInput}</textarea>
        </div>
    </div>
    <div class="form-group">
        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="sampleOutput">Sample Output:</label>
        <div class="col-md-6 col-sm-6 col-xs-12">
            <textarea id="sampleOutput" name="sampleOutput" class="context form-control col-md-7 col-xs-12" cols="60"
                      rows="4">${entity.sampleOutput}</textarea>
        </div>
    </div>
    <div class="form-group">
        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="uploadFile">上传数据文件(.zip):</label>
        <div class="col-md-6 col-sm-6 col-xs-12">
            <input type="file" accept=".zip" id="uploadFile" name="uploadFile" class="form-control">
        </div>
    </div>
    <div class="form-group" align="center">
        <input type="submit" class="btn btn-lg btn-primary" value="确定">
    </div>
</sf:form>
<%--<script language="JavaScript">--%>
<%--var context="1{{{(>_<)}}}2{{{(>_<)}}}3{{{(>_<)}}}4{{{(>_<)}}}5";--%>
<%--var des=new Array();--%>
<%--des=context.split("{{{(>_<)}}}");--%>
<%--var out=document.getElementsByClassName("context");--%>
<%--alert(out.length)--%>
<%--for(var i=0;i<des.length;i++){--%>
<%--out[i].innerHTML=des[i];--%>
<%--}--%>
<%--</script>--%>
</body>
</html>