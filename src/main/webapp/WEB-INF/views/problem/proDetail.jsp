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
    <link href="/css/bootstrap.css" rel='stylesheet' type='text/css'/>
    <link href="/css/bootstrap.min.css" rel='stylesheet' type='text/css'/>
    <style type="text/css">
        .proDetail {
            font-family: Times New Roman;
            margin: 10px 30px;
            padding: 20px 250px;
            background-color: white;
        }
        .proDetail > p {
            font-family: Times New Roman;
            font-size: 20px;
            background-color: #FFF093;
        }
        .proDetail > h3 {
            margin-top: 20px;
        }
    </style>
</head>
<body>
<%@ include file="/WEB-INF/views/navigation.jsp" %>
<div class="head">
</div>
<h1 class="title" align="middle">A+B</h1>
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
<div class="tail" align="center">
    <a class="btn btn-info btn-lg " style="width:150px;" href="problem/submit/${entity.problemId}">Submit code</a>
    <a class="btn btn-info btn-lg" style="width:150px; margin-left:40px;" href="/discuss/${entity.problemId}" disabled="disabled">Discuss</a>
</div>
<%@ include file="/WEB-INF/views/copyright.html" %>
</body>
</html>