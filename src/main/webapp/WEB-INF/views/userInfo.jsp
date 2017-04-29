<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/4/29
  Time: 18:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>User Information</title>
    <link href="/css/bootstrap.min.css" rel='stylesheet' type='text/css'/>
    <link href="/css/custom.css" rel="stylesheet" type="text/css"/>

</head>
<body>
     <div class="top50" align="center" style="text-align: center">
            <div class="panel panel-heading panel-primary">${entity.id}</div>
         <div class="panel panel-body " align="center">
             <p>学号:${entity.id}</p><br>
             <p>Name:${entity.name}</p><br>
             <p>Nickname:${entity.nickname}</p><br>
             <c:if test="${entity.qqOpen eq 1}">
                 <p>QQ:${entity.qq}</p><br>
             </c:if>
             <c:if test="${entity.qqOpen eq 0}">
                 <p>QQ:对方设置了不可见</p><br>
             </c:if>
             <c:if test="${entity.mailOpen eq 1}">
                 <p>Email:${entity.mail}</p><br>
             </c:if>
             <c:if test="${entity.mailOpen eq 0}">
                 <p>Email:对方设置了不可见</p><br>
             </c:if>
             <c:if test="${entity.phoneOpen eq 1}">
                 <p>Phone:${entity.phone}</p><br>
             </c:if>
             <c:if test="${entity.phoneOpen eq 0}">
                 <p>Phone:对方设置了不可见</p><br>
             </c:if>
         </div>
         <div class="panel panel-footer"></div>
     </div>
</body>
</html>
