<%@ page pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE HTML >
<html>
<head>
    <title>${entity.problemId} ${entity.title}</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link href="/css/bootstrap.min.css" rel='stylesheet' type='text/css'/>
    <link href="/css/custom.css" rel="stylesheet" type="text/css"/>
</head>
<body>
<%@ include file="/WEB-INF/views/navigation.jsp" %>
<div class="head" align="middle">
<h1 class="title" >${entity.title}</h1>
<small >Time Limit:${entity.timeLimit}</small>
<small >Memory Limit:${entity.memoryLimit}</small><br>
<%--<small >Accept:${entity.acProblemsNum}</small>--%>
<%--<small >Submit:${entity.submitProblemsNum}</small>--%>
</div>
<div class="proDetail">
    <h3>Problem Description</h3>
    <p width="800px" height="auto">
        ${entity.problemDes}
    </p>
    <h3>Input Description</h3>
    <p>
       ${entity.inputDes}
    </p>
    <h3>Output Description</h3>
    <p>
        ${entity.outputDes}
    </p>
    <h3>Sample Input</h3>
    <p>
        ${entity.sampleInput}
    <p>
    <h3>Sample Output</h3>
    <p>
        ${entity.sampleOutput}
    <p>
</div>
<div class="tailSubmit" align="center">
    <a class="btn btn-info btn-lg " href="/problem/submit/${entity.problemId}">Submit code</a>
    <a class="btn btn-info btn-lg" style="margin-left:40px;" href="/discuss/${entity.problemId}" disabled="disabled">Discuss</a>
</div>
<%@ include file="/WEB-INF/views/copyright.html" %>
</body>
</html>