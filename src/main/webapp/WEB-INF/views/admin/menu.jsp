<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base target="contentFrame" href="<%=basePath%>">
    <title>后台管理</title>
	<META content="text/html; charset=utf-8" http-equiv=Content-Type>
	<link rel="stylesheet" href="css/bootstrap.css">
	<link rel="stylesheet" href="css/style.css">
	<style type="text/css">
	div{
	 margin-top:20px;
    }
	</style>
	</head>
  <body style="background-color:DCDCDC">
	  <div class="head" align="center">
	     	<p size="5px" color="0099CC">教师后台管理</p>
	  </div>

   <div class="menuBar"  style="padding-left:30px;" >
    <table class="table table-hover table-border table-condensed" style="margin-bottom: -20px;" >
     <thead >
      <tr>
     	<td id="menuTitle1"><button class="btn btn-primary btn-sm " onclick="showSubmenu(1)">个人信息管理</button><td>
     </tr></thead>
     <tbody id="subMenu1" style="display:none;">
     <tr><td ><a href="admin/modifyPassword">修改密码</a>
     	</td></tr>
     <tr><td><a href="logoutServlet">退出登录</a>
     	</td></tr></tbody></table>
     	
     <table class="table table-hover table-border table-condensed" style="margin-bottom: -20px;">
     <thead>
     <tr><td id="menuTitle2"><button class="btn btn-primary btn-sm " onclick="showSubmenu(2)">前台管理</button>
     </td></tr></thead>
     <tbody id="subMenu2" style="display:none;">
     <tr><td><a href="status/status">查看Status</a>
     </td></tr>
     <tr><td><a href="news/showNews">查看公告</a>
     </td></tr>
     <tr><td><a href="news/addNews">添加公告</a>
     </td></tr>
     </tbody>
     </table>
    
    <table class="table table-hover table-border table-condensed" style="margin-bottom: -20px;">
     <thead>
     <tr><td id="menuTitle3" ><button class="btn btn-primary btn-sm "  onclick="showSubmenu(3)">题库管理</button>
     </td></tr></thead>
     <tbody id="subMenu3" style="display:none;">
     <tr><td><a href="admin/proManager">查看题库</a>
     </td></tr>
     <tr><td><a href="admin/addProblem">添加题目</a>
     </td></tr>
     </tbody>
     </table>
    
    
    <table class="table table-hover table-border table-condensed" style="margin-bottom: -20px;">
     <thead>
     <tr><td id="menuTitle4" ><button class="btn btn-primary btn-sm " onclick="showSubmenu(4)">比赛管理</button>
     </td></tr></thead>
     <tbody id="subMenu4" style="display:none;">
     <tr><td><a href="teacher/showTest">查看所有考试</a>
     </td></tr>
     <tr><td><a href="/test/createTest" target="_top">创建考试</a>
     </td></tr>
     <tr><td><a href="/test/pastTest" target="_top">过往考试</a>
     </td></tr>
     <tr><td><a href="/test/joinTest" target="_top">正在进行</a>
     </td></tr>
     </tbody>
     </table>
    
    </div>
      <script  language=javascript1.2>
          function showSubmenu(sid){
              var ss="subMenu"+sid;
              var whichEL=document.getElementById(ss);
              if(whichEL.style.display=="none"){
                  eval("subMenu" + sid + ".style.display=\"inline\";")
              }else{
                  eval("subMenu"+ sid + ".style.display=\"none\";")
              }
          }
      </script>

  </body>
</html>
