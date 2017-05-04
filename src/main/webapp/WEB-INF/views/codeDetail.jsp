
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
        <pre class="prettyprint linenums">
            <xmp>
            ${entity.code}
            </xmp>
        </pre>
    </div>
    <div class="panel panel-footer"></div>
</div></div>
<script type="text/javascript">//<![CDATA[
window.onload=
(function () {
    function htmlEscape(s) {
        return s
//            .replace(/&/g, '&amp;')
            .replace(/</g, '&lt;')
            .replace(/>/g, '&gt;');
    }

    // this page's own source code
    var quineHtml = htmlEscape(
        document.getElementById("quine").innerHTML );
    // Highlight the operative parts:
//    quineHtml = quineHtml.replace(
//        /&lt;script src[\s\S]*?&gt;&lt;\/script&gt;|&lt;!--\?[\s\S]*?--&gt;|&lt;pre\b[\s\S]*?&lt;\/pre&gt;/g,
//        '<span class="operative">$&<\/span>');

    // insert into PRE
    document.getElementById("quine").innerHTML = quineHtml;
})();
//]]>
</script>
</body>
</html>
