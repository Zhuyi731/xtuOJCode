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
    int ct=1;
    pageContext.setAttribute("ct",ct);
    int rank=0;
%>
<script>
    window.onload=setProblemTitle;
    function setProblemTitle() {
        var alpha = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
        <c:set value="${0}" var="ctt"/>
        for(var i=1;i<=${mapList.size()};i++){
            var a= document.getElementById("problem"+i);
            a.innerHTML=alpha[i-1];
            a.innerHTML+="(${mapList.get(ct).acProblemsNum}/${mapList.get(ct).submitProblemsNum})";
            <c:set value="${ctt+1}" scope="page" var="ctt"/>;
        }
    }
</script>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Contest Standing</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="/css/bootstrap.min.css" rel='stylesheet' type='text/css'/>
    <link href="/css/custom.css" rel="stylesheet"/>
</head>
<body style="overflow-y:auto;padding-left: 0px;">

<div class="functionNav" align="center">
<table class="table table-hover text-info">
    <tbody>
    <tr >
        <td class="col-md-2 col-sm-2 "><a  class="btn btn-link" onclick='window.history.go(-1)'>Go Back</a></td>
        <td class="col-md-2 col-sm-2"><a  class="btn btn-link" href="/test/standing/${vo.entityList[0].entityList[0].contestId}">Standing</a></td>
        <td class="col-md-2 col-sm-2"><a  class="btn btn-link" href="/status/0">Status</a></td>
    </tr>
    </tbody>
</table>

<div class="head"></div>
    <table class="table table-bordered table-hover">
        <thead>
        <tr style="background-color: #2b669a">
            <td class="col-md-1">Rank</td>
            <td class="col-md-1">Username</td>
            <td class="col-md-1">Punishment</td>
            <td class="col-md-1">Solved</td>
            <td class="col-md-1">Score</td>
            <c:forEach items="${mapList}" var="mapList" varStatus="index">
                <td class="col-md-1" id="problem${mapList.no}"></td>
            </c:forEach>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${entityList}" var="entity" varStatus="index">
            <tr>
                <td><%=++rank%></td>
                <td>${entity.entity.userId}</td>
                <td>${entity.entity.penalty}</td>
                <td>${entity.entity.acProblemsNum}</td>
                <td>${entity.entity.totScore}</td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>


<script src="/js/custom.js"></script>
</body>
</html>
