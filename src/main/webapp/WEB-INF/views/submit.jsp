<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
   <head>
    <title>10001 题目</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="/css/bootstrap.css" rel='stylesheet' type='text/css' />
<link href="/css/bootstrap.min.css" rel='stylesheet' type='text/css' />
<link href="/css/style.css" rel="stylesheet" />
<style type="text/css">
  label{
   padding-top:7px;
  }
</style>
</head>
	<body>
	 <%@ include file="/WEB-INF/views/navigation.jsp" %>
        <div class="container" align="center">
          <form role="form" method="post" class="form-horizontal" action="submitServlet">
          <div class="form-group">
         	<label for="proID" class="col-md-2 col-md-offset-2 control-label">Pro.ID:</label>
            <div class="col-md-4">
            <input id="proID" name="proID" type="text" class="form-control" width="60px;"></input>
           	</div>
          </div>
          
         <div class="form-group">
         	<label for="language" class="col-md-2 col-md-offset-2 control-label">Language:</label>
            <div class="col-md-4">
            	<select id="language" name="language" class="form-control">
           			 <option value="GUN G++" selected="selected">GUN G++</option>
            		<option value="java">java</option>
            		<option value="c" >c</option>
            	</select> 
          </div>
          </div>
          <div class="form-group">
           <label for="code" class="col-md-2 col-md-offset-2 control-label">Source code:</label>
            <div class="col-md-6 " >
            <textarea  class="form-control" name="code" id="code" style="height:400px;padding-left:0;">
input your code...
            </textarea>
            </div>
          </div>
          <div class="form-group">
           <div class="col-md-offset-4 col-md-2" text-align="middle">
           <input type="submit" class="form-control btn btn-info btn-lg" value="submit">
           </div>
           <div class="col-md-2">
           <input type="reset" class="form-control btn btn-info btn-lg" value="reset">
          </div>
          </div>
          </form>
        </div>  

     <%@ include file="/WEB-INF/views/copyright.html" %>
	</body>
</html>
