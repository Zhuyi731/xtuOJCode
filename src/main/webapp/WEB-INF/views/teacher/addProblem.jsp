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
      <div class="form-group">
         <label for="inputFile" class="control-label col-md-3 ">请选择标准输入文件</label>
         <div class="col-md-2">
         <input type="file" id="inputFile" >
         </div>
      </div>
      <div class="form-group">
         <label for="outputFile" class="control-label col-md-3 ">请选择标准输出文件</label>
         <div class="col-md-2">
         <input type="file" id="outputFile" >
         </div>
      </div>
      <div class="form-group">
         <input type="submit" class="btn btn-primary ">
      </div>
   </form>
</div>
<script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
<script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</body>

</html>
