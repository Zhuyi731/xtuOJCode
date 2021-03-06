<%@ page pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<%
     String contestId=request.getParameter("contestId");
     String no=request.getParameter("no");
     pageContext.setAttribute("contestId",contestId);
     pageContext.setAttribute("no",no);
%>
<!DOCTYPE HTML>
<html>
<head>
    <title>${entity.problemId} ${entity.title}</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link href="/css/bootstrap.min.css" rel='stylesheet' type='text/css'/>
    <link href="/css/bootstrap.min.css" rel='stylesheet' type='text/css'/>
    <link href="/css/custom.css" rel="stylesheet" type="text/css"/>
</head>
<body>
<%@ include file="/WEB-INF/views/navigation.jsp" %>
<div class="head" align="middle">
    <h1 class="title">${entity.title}</h1>
    <small>Time Limit:${entity.timeLimit}</small>
    <small>Memory Limit:${entity.memoryLimit}</small>
    <br>
</div>
<div class="functionNav" align="center">
    <table class="table table-hover text-info">
        <tbody>
        <tr>
            <td class="col-md-2 col-sm-2"><a class="btn btn-danger glyphicon glyphicon-arrow-left" onclick='window.history.go(-1)'>Go Back</a></td>
            <td class="col-md-2 col-sm-2"><a class="btn  btn-primary" href="/test/standing/${contestId}">Standing</a></td>
            <td class="col-md-2 col-sm-2"><a class="btn  btn-primary" href="/status/0">Status</a></td>
        </tr>
        </tbody>
    </table>
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
    <a class="btn btn-info btn-lg " href="/test/testSubmit/${entity.problemId}?contestId=${contestId}&no=${no}">Submit code</a>
    <a class="btn btn-info btn-lg" style="margin-left:40px;" href="/discuss/${entity.problemId}" disabled="disabled">Discuss</a>
</div>
<%@ include file="/WEB-INF/views/copyright.html" %>
<script>
</script>
</body>
</html>