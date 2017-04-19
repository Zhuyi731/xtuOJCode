<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <base href="<%=basePath%>">
    <title>添加题目</title>
    <META content="text/html; charset=utf-8" http-equiv=Content-Type>
    <link rel="stylesheet" href="css/bootstrap.css">
    <link rel="stylesheet" href="css/style.css">
    <style type="text/css">
        .container{
            text-align:center;
        }
    </style>
</head>
<body>
<div class="container" align="center">
    <form role="form" class="form-horizontal" method="post"  >
        <label for="inputFile">请选择标准输入文件</label><input tyep="file" id="inputFile">
        <label for="outputFile">请选择标准输出文件</label><input tyep="file" id="outputFile">
        <input type="submit">
    </form>
</div>
</body>

</html>
