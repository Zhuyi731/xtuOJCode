<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
    String contestId = request.getParameter("contestId");
    String no = request.getParameter("no");
    pageContext.setAttribute("contestId", contestId);
    pageContext.setAttribute("no", no);
%>
<!DOCTYPE HTML >
<html>
<head>
    <title>${entity.problemId}&nbsp;&nbsp;${entity.title}</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link href="/css/bootstrap.min.css" rel='stylesheet' type='text/css'/>
    <link href="/css/custom.css" rel="stylesheet"/>
    <style type="text/css">
        label {
            padding-top: 7px;
        }
    </style>
</head>
<body>
<%@ include file="/WEB-INF/views/navigation.jsp" %>
<div class="container" align="center">
    <sf:form  action="/problem/submit/${entity.problemId}" role="form" method="post" class="form-horizontal">
        <div class="form-group">
            <label for="contestId" class="col-md-2 col-md-offset-2 control-label">Contest.ID:</label>
            <div class="col-md-4">
                <input id="contestId" name="contestId" type="text" class="form-control" width="60px;"
                       value="${contestId}" readonly="readonly">
            </div>
        </div>
        <div class="form-group">
            <label for="no" class="col-md-2 col-md-offset-2 control-label">no</label>
            <div class="col-md-4">
                <input id="no" name="no" type="text" class="form-control" width="60px;" value="${no}"
                       readonly="readonly">
            </div>
        </div>

        <div class="form-group">
            <label for="language" class="col-md-2 col-md-offset-2 control-label">Language:</label>
            <div class="col-md-4">
                <select id="language" name="language" class="form-control">
                    <option value="C++" selected="selected">C++</option>
                    <option value="Java">Java</option>
                    <option value="C">C</option>
                </select>
            </div>
        </div>
        <div class="form-group">
            <label for="open" class="col-md-2 col-md-offset-2 control-label">是否公开代码:</label>
            <div class="col-md-4">
                <select id="open" name="open" class="form-control">
                    <option value="0" selected="selected">否</option>
                    <option value="1">是</option>
                </select>
            </div>
        </div>
        <div class="form-group">
            <label for="code" class="col-md-2 col-md-offset-2 control-label">Source code:</label>
            <div class="col-md-6 ">
            <textarea class="form-control" name="code" id="code" style="height:400px;padding-left:0;">
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
    </sf:form>
</div>

<%@ include file="/WEB-INF/views/copyright.html" %>
</body>
</html>
