<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>添加学生</title>    
	<META content="text/html; charset=utf-8" http-equiv=Content-Type>
	<link rel="stylesheet" href="css/bootstrap.css">
	<link rel="stylesheet" href="css/style.css">
	<style type="text/css">
	.container{
	 margin:50 50;
	 }
	.selectMod{
	  margin-bottom:60;
	  text-align:left;
	}
	.table-container{
	  margin:10 40;
	  text-align:center;
	}
	</style>
  </head>
  <body>
      <div class="container">
      
      <form role="form" action="addStudentServlet" method="get">
       <div class="selectMod">
      <span>查询方式&nbsp;&nbsp;</span><select class="select" id="select" onclick="show()">
       <option value="0" selected>学号</option>
       <option value="1">姓名</option>
       <option value="2">专业</option>
       <option value="3">专业及班级</option>
       </select>
       </div>
       
       <div class="form-group s1" name="s1">
       <label class="control-label col-md-2" for="stuID">学号</label>
       <div class="col-md-4">
       <input type="text" id="stuID" name="stuID" class="form-control">
       </div></div>
       <div class="form-group s1" name="s1" style="display:none;">
       <label class="control-label col-md-2" for="stuName">姓名</label>
       <div class="col-md-4">
       <input type="text" id="stuName" name="stuName" class="form-control">
       </div></div>
       <div class="form-group s1" name="s1" style="display:none;">
       <label class="control-label col-md-2" for="marjor">专业</label>
       <div class="col-md-4">
       <input type="text" id="major" name="major" class="form-control">
       </div></div>
       <div name="s1" style="display:none">
       <div class="form-group ">
       <label class="control-label col-md-2" for="marjor">专业</label>
       <div class="col-md-4">
       <input type="text" id="major" name="major" class="form-control">
       </div></div>
       <div class="form-group ">
       <label class="control-label col-md-2" for="classes">班级</label>
       <div class="col-md-4">
       <input type="text" id="classes" name="classes" class="form-control">
       </div></div>
       </div>
       <input type="submit" value="查询" class="btn btn-success btn-lg" > 
      </form>
      </div>
      <div class="table-container">
      <table class="table table-hover table-bordered" >
  	   <thead>
  	   <tr><td class="col-md-1">学号</td><td class="col-md-1">姓名</td><td class="col-md-2">专业</td><td class="col-md-2">班级</td><td class="col-md-1"><input type="checkbox" value="1" id="checkAll" onclick="checkAll()">全选</td>
  	   </tr></thead>
  	   <tbody>
  	   <tr><td>2013550336</td><td>朱义</td><td>计算机</td><td>1班</td><td><input type="checkbox" name="select"></td></tr>
  	   <tr><td>2013550337</td><td>潘定荣</td><td>软件</td><td>3班</td><td><input type="checkbox" name="select"></td></tr>
  	   </tbody>
  	   </table>
  	   </div>
      
<script type="text/javascript">
 function show(){
   var a=document.getElementById("select");
   var b=document.getElementsByName("s1");
   var index=a.selectedIndex; 
     for(var i=0;i<4;i++){
       b[i].style.display="none";
     }
       b[index].style.display="";

}
</script>  
  </body>
</html>
