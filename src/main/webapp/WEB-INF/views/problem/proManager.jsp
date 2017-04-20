<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>"> 
    <title>题库管理</title>
	<META content="text/html; charset=utf-8" http-equiv=Content-Type>
	<link rel="stylesheet" href="css/bootstrap.css">
	<link rel="stylesheet" href="css/style.css">
	<style type="text/css">
	.container{
      margin-top:50;
    }
    .function a{
     margin:0 20;
    }
	</style>
  </head>
  <body>
	  <div class="container">
  	   <table class="table table-hover table-bordered" >
  	   <thead>
  	   <tr><td class="col-md-1">ID</td>
  	   <td class="col-md-1">Title</td>
  	   <td class="col-md-1">autority</td>
  	   <td class="col-md-2">description</td>
  	   <td class="col-md-1">accept/submit</td>
  	   <td class="col-md-1">ratio</td>
  	   <td class="col-md-2">点击进入修改</td>
	   <td class="col-md-2">点击添加数据文件</td>
  	   <td class="col-md-1"><input type="checkbox" value="1" id="checkAll" onclick="checkAll()">全选</td>
  	   </tr></thead>
  	   <tbody>
  	   <tr><td>100001</td>
  	   <td>A+B</td>
  	   <td>公有</td>
  	   <td>caculate A+B</td>
  	   <td>20/23</td>
  	   <td>86.96%</td>
  	   <td><a href="#">进入修改</a></td>
	   <td><a href="addProblemFile">添加数据文件</a></td>
	   <td><input type="checkbox" name="select"></td></tr>
  	   <tr><td>10002</td>
  	   <td>A+B 2</td>
  	   <td>私有</td>
  	   <td>caulate Big integer A+B</td>
  	   <td>30/50</td>
  	   <td>60%</td>
  	   <td><a href="#">进入修改</a></td>
	   <td><a href="addProblemFile">添加数据文件</a></td>
	   <td><input type="checkbox" name="select"></td></tr>
  	   </tbody>
  	   </table>
  	   <div class="function">
  	   <a class="btn btn-lg btn-primary " href="teacher/addProblem.jsp">添加题目</a>
  	   <a class="btn btn-lg btn-primary " href="deleteProServlet">删除选中</a>
  	   </div>
  	   </div>
  	   <script type="text/javascript">
  	    function checkAll(){
  	      var a=document.getElementById("checkAll");
  	      var b=document.getElementsByName("select");
  	      if(a.checked==true){
  	         for(var i=0;i<b.length;i++){
  	           b[i].checked=true;
  	         }
  	      }else{
  	       for(var i=0;i<b.length;i++){
  	          b[i].checked=false;
  	       }
  	      }
  	    }
  	   </script>
 
	   		
	  
  </body>
</html>
