<%@ page pageEncoding="UTF-8"%>
<%@ taglib  prefix="c"  uri="http://java.sun.com/jsp/jstl/core"  %>
<div class="navbar  navbar-default" role="navigation" style="margin-bottom:50px;background-color:#2c333d; ">
	<div class="col-md-9" >
	<div class="navbar-header">
	<a href="index"  class="navbar-brand">XTUOJ</a>
	  　</div>
    <ul class="nav navbar-nav" style="font-size:18px;margin:20px auto;text-align:center;style="color:white;">
        <li><a href="/index" style="color:white; ">Home</a></li>
      	<li><a href="/problem/problems" style="color:white;">Problem Set</a></li>
      	<li><a href="/ranklist" style="color:white;">Ranklist</a></li>
        <li><a href="/status" style="color:white;">Status</a></li>
      	<li><a href="/test/test"style="color:white;">Contest</a></li>

    </ul>
   </div>
    <div class="col-md-3" style="float:right;top:0px;">
     <c:if test="${student eq null}">
     <c:if test="${teachers eq null }">
     <a class="btn btn-primary btn-lg" href="/login" style="width:150px;float:right;">Login</a>
     </c:if>
     <c:if test="${teachers ne null }">
     <a class="btn btn-primary btn-lg" href="/teacher/main"  style="width:150px;float:right;">${teachers.tID}</a></c:if>
     </c:if>
     <c:if test="${student ne null}">
     <a class="btn btn-primary btn-lg" href="/student/main"  style="width:150px;float:right;">${student.stuID}</a>
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
