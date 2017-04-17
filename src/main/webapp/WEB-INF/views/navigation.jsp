<%@ page pageEncoding="UTF-8"%>
<%@ taglib  prefix="c"  uri="http://java.sun.com/jsp/jstl/core"  %>
<div class="navbar navbar-default " role="navigation" style="margin-bottom:50px;">
	<div class="col-md-9" >
	<div class="navbar-header">
	<a href=<%=basePath+"index" %> class="navbar-brand">XTUOJ</a>
	  　</div>
    <ul class="nav navbar-nav" style="font-size:18px;margin:20px auto;text-align:center;">
        <li><a href="index">首页</a></li>
      	<li><a href="problems">题库</a></li>
      	<li><a href="ranklist">Ranklist</a></li>
      	<li><a href="status">Status</a>
      	<li class="dropdown">
          <a href="test/test" data-toggle="dropdown" class="dropdown-toggle">考试<span class="caret"></span></a>
          <ul class="dropdown-menu">
        	<li><a href="test/joinTest">参加考试</a></li>
        	<li><a href="test/createTest">创建考试（仅老师）</a></li>
          </ul>
       </li>

    </ul>
   </div>
    <div class="col-md-3" style="float:right;top:0px;">
     <c:if test="${student eq null}">
     <c:if test="${teachers eq null }">
     <a class="btn btn-primary btn-lg" href=<%=basePath+"login"%> style="width:150px;float:right;">登录</a>
     </c:if>
     <c:if test="${teachers ne null }">
     <a class="btn btn-primary btn-lg" href=<%=basePath+"teacher/main"%>  style="width:150px;float:right;">${teachers.tID}</a></c:if>
     </c:if>
     <c:if test="${student ne null}">
     <a class="btn btn-primary btn-lg" href=<%=basePath+"student/main"%>  style="width:150px;float:right;">${student.stuID}</a>
     </c:if>
     </div>
   <!-- 搜索按钮 -->
    <!-- 
    <div class="col-md-3" style="float:left;">
     <form action="##" class="navbar-form navbar-left" rol="search">
   	    <div class="form-group">
   		   <input type="text" class="form-control" placeholder="请输入关键词" />
   	    </div>
        <button type="submit" class="btn btn-default">搜索</button>
      -->
     </form>
     </div>
</div>
