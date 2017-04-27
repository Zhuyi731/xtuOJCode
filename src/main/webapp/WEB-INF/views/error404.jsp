<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML >
<html>
  <head>
    <base href="<%=basePath%>">
      <title>error!</title>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<link href="/css/bootstrap.min.css" rel='stylesheet' type='text/css' />
    <script type="text/javascript">
    function goback(){
     history.go(-1);
    }
    
    </script>
    </head>
  
  <body>
    <%@ include file="/WEB-INF/views/navigation.jsp" %>
    <div align="center" >
     <p style="font-size:20px;">抱歉您访问的页面不存在!<br></p>
     <p class="btn btn-lg btn-danger" onclick="goback()">返回上一页</p>
    </div>
  </body>
</html>
