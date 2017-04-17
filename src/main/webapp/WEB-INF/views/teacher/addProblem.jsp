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
        <form role="form" class="form-horizontal" method="get" action="addProServlet" >       
        <div class="form-group">
        <label for="title" class="control-label col-md-2">Title</label>
        <div class="col-md-4">
        <input type="text" name="title" id="title" class="form-control" placeholder="请输入标题">
        </div>
        </div>
        <div class="form-group">
        <label for="des" class="contol-label col-md-2">Description</label>
        <div class="col-md-4">
        <textarea rows="5" cols="40" name="des" id="des" placeholder="请输入内容描述" class="form-control"></textarea>
        </div></div>
        <div class="form-group">
        <label for="inputDes" class="contol-label col-md-2">Input Description</label>
        <div class="col-md-4">
        <textarea rows="5" cols="40" name="inputDes" id="inputDes" placeholder="请输入输入内容描述" class="form-control"></textarea>
        </div></div>
        <div class="form-group">
        <label for="outputDes" class="contol-label col-md-2">Output Description</label>
        <div class="col-md-4">
        <textarea rows="5" cols="40" name="outputDes" id="outputDes" placeholder="请输入内容描述" class="form-control"></textarea>
        </div></div>
        <div class="form-group">
        <label for="input" class="contol-label col-md-2">Sample Input</label>
        <div class="col-md-4">
        <textarea rows="5" cols="40" name="input" id="input"  class="form-control"></textarea>
        </div></div>
        <div class="form-group">
        <label for="output" class="contol-label col-md-2">Sample Output</label>
        <div class="col-md-4">
        <textarea rows="5" cols="40" name="output" id="output" class="form-control"></textarea>
        </div></div>
        <div class="form-group">
        <label for="comment" class="contol-label col-md-2">备注</label>
        <div class="col-md-4">
        <textarea rows="5" cols="40" name="comment" id="comment" class="form-control"></textarea>
        </div></div>
        <div class="form-group">
        <label for="display" class="contol-label col-md-2">权限设置</label>
        <div class="col-md-2">
        <input type="radio" name="isDisplay" id="display" value="0" checked >公有
        <input type="radio" name="isDisplay" id="noDisplay" value="1" >私有
        </div></div>
        </form>
     </div>		
  </body>
  
</html>
