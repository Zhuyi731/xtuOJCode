<%@ page pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<div class="navbar  navbar-default" role="navigation" style="margin-bottom:50px;background-color:#2c333d; ">
    <div class="col-md-9">
        <div class="navbar-header">
            <a href="/index" class="navbar-brand">XTUOJ</a>
        </div>
        <ul class="nav navbar-nav" style="font-size:18px;margin:20px auto;text-align:center;">
            <li><a href="/index" style="color:white;">Home</a></li>
            <li><a href="/problem/problems/0" style="color:white;">Problem Set</a></li>
            <li><a href="/ranklist/0" style="color:white;">Ranklist</a></li>
            <li><a href="/status/0" style="color:white;">Status</a></li>
            <li><a href="/test/test" style="color:white;">Contest</a></li>
        </ul>
    </div>
    <security:authentication property="principal.username" var="userId"/>
    <div class="col-md-3 logBtn" style="width:200px;float:right;padding-top:25px;">
        <c:if test="${userId ne null}">
            <li class="dropdown">
                <a href="#" class="dropdown-toggle btn btn-primary" data-toggle="dropdown"
                   style="width: 160px;">${userId} zhuyi<b class="caret"></b></a>
                <ul class="dropdown-menu">
                    <li><a href="/main">Self Info</a></li>
                    <li class="divider"></li>
                    <li><a href="/logout">Logout</a></li>
                </ul>
            </li>
        </c:if>
        <c:if test="${userId eq null}">
            <a href="/login" class="dropdown-toggle btn btn-primary" style="width: 160px;">
                Login
            </a>
        </c:if>
    </div>
</div>
</div>
<script src="http://libs.baidu.com/jquery/1.9.0/jquery.js"></script>
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>