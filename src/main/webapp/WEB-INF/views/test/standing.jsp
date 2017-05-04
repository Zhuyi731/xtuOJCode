<%@ page import="com.xtu.DB.vo.StandingEntityVO" %>
<%@ page import="com.xtu.DB.entity.ContestRanklistEntity" %>
<%@ page import="com.xtu.DB.entity.ContestDetailEntity" %>
<%@ page import="java.util.List" %>
<%@ page import="com.xtu.DB.vo.StandingVO" %>
<%@ page import="java.util.Map" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    StandingVO vo= (StandingVO) request.getAttribute("vo");
    List<StandingEntityVO> entityList=vo.getEntityList();
    List<Map<String, Integer>> mapList=vo.getMapList();
    pageContext.setAttribute("entityList",entityList);
    pageContext.setAttribute("mapList",mapList);
    int problemNum= mapList.size();
%>
<script>

</script>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Contest Standing</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="/css/bootstrap.min.css" rel='stylesheet' type='text/css'/>
    <link href="/css/custom.css" rel="stylesheet"/>
</head>
<body style=" overflow-y:auto;">
<div class="functionNav" align="center">
<table class="table table-hover text-info">
    <tbody>
    <tr>
        <td class="col-md-2 col-sm-2 "><a  class="btn btn-link" onclick='window.history.go(-1)'>Go Back</a></td>
        <td class="col-md-2 col-sm-2"><a  class="btn btn-link" href="/test/standing/${vo.entityList[0].contestId}">Standing</a></td>
        <td class="col-md-2 col-sm-2"><a  class="btn btn-link" href="/status/0">Status</a></td>
    </tr>
    </tbody>
</table>

<div class="head"></div>
<div class="container" align="center">
    <table class="table table-bordered table-hover">
        <thead>
        <tr>
            <td class="col-md-1">Rank</td>
            <td class="col-md-1">Username</td>
            <td class="col-md-1">Punishment</td>
            <td class="col-md-1">Solved</td>
            <td class="col-md-1">Punishment</td>
            <c:forEach items="${mapList}" var="mapList" varStatus="index">
                <td class="col-md-1" id="problem${mapList.no}">(${mapList.acProblemsNum}/${mapList.submitProblemsNum})</td>
            </c:forEach>
            <td> </td>
        </tr>
        </thead>
    </table>
</div>
</div>
<script>
    window.onload=setProblemTitle();
    function setProblemTitle() {
        for(var i=0;i<${mapList.size()};i++)
        var a= document.getElementById("problem"+i);
        var head='A'+i;
        alert(head);
        a.innerHTML=head+"(${mapList.acProblemsNum}/${mapList.submitProblemsNum})";
    }

</script>
</body>
</html>
