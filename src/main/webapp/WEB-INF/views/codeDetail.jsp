
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE HTML>
<html>
<head>
    <title>CodeDetail</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link href="/css/bootstrap.min.css" rel='stylesheet' type='text/css'/>
    <link href="/css/custom.css" rel='stylesheet' type='text/css'/>
    <script src="/js/run_prettify.js?autoLoad=true&amp;skin=sunburst" defer=""></script>

</head>
<body>
<div class="top50" align="center">
<div class="panel panel-default panel-primary " style="width:800px;">
    <div class="panel panel-heading" align="center">
        <strong style="color:Black">Source Code</strong>
        <p>**********************************************************************<br/>
            Problem: ${entity.problemId}<br/>
            User: ${entity.id}<br/>
            Language: ${entity.language}<br/>
            Result: ${entity.resultCode}<br/>
            Time:${entity.runTime} ms<br/>
            Memory:${entity.runMemory} kb<br/>
            **********************************************************************
        </p>
    </div>
    <div class="panel panel-body" align="left" >
        <pre class="prettyprint linenums" >
            <xmp>${entity.code}</xmp>
        </pre>
    </div>
    <div class="panel panel-footer"></div>
</div></div>

</body>
</html>
