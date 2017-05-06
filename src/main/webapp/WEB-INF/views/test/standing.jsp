<%@ page import="com.xtu.DB.vo.StandingEntityVO" %>
<%@ page import="com.xtu.DB.entity.ContestRanklistEntity" %>
<%@ page import="com.xtu.DB.entity.ContestDetailEntity" %>
<%@ page import="java.util.List" %>
<%@ page import="com.xtu.DB.vo.StandingVO" %>
<%@ page import="java.util.Map" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    StandingVO vo = (StandingVO) request.getAttribute("vo");
    List<StandingEntityVO> entityList = vo.getEntityList();
    List<Map<String, Integer>> mapList = vo.getMapList();
    pageContext.setAttribute("entityList", entityList);
    pageContext.setAttribute("mapList", mapList);
    int ct = 1;
    pageContext.setAttribute("ct", ct);
    int rank = 0;
    pageContext.setAttribute("rank", rank);
%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Contest Standing</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link href="/css/bootstrap.min.css" rel='stylesheet' type='text/css'/>
    <link href="/css/custom.css" rel="stylesheet"/>

    <script src="/js/custom.js"></script>
</head>
<body style="overflow-y:auto;">
<script>
    function setProblemTitle() {
        var alpha = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
        <c:set value="${0}" var="ctt"/>
        for (var i = 1; i <=${entityList.size()}; i++) {
            var a = document.getElementById("problem" + i);
            a.innerHTML = alpha[i - 1];
        }
        <c:forEach items="${mapList}" var="map" varStatus="index">
        var b = document.getElementById("problem" + "${index.count}");
        b.innerHTML += "(${map.get('acProblemsNum')}/${map.get('submitProblemsNum')})";
        </c:forEach>
    }
</script>

<div class="top50">
    <div class="functionNav">
        <table class="table table-hover ">
            <tbody>
            <tr class="text-info">
                <td class="col-md-2 col-sm-2 "><a class="btn btn-danger glyphicon glyphicon-arrow-left" onclick='window.history.go(-1)'>Go Back</a></td>
                <td class="col-md-2 col-sm-2"><a class="btn btn-primary"
                                                 href="/test/standing/${vo.entityList[0].entityList[0].contestId}" >Standing</a>
                </td>
                <td class="col-md-2 col-sm-2"><a class="btn btn-primary" href="/status/0">Status</a></td>
            </tr>
            </tbody>
        </table>
    </div>
    <div class="statusContainer">
        <table class="table table-hover table- table-bordered  standingTable">
            <thead>
            <tr style="background-color: #2b669a">
                <td class="col-md-1">Rank</td>
                <td class="col-md-1">Username</td>
                <td class="col-md-1">Punishment</td>
                <td class="col-md-1">Solved</td>
                <td class="col-md-1">Score</td>
                <c:forEach items="${mapList}" var="mapList" varStatus="index">
                    <td class="col-md-1" id="problem${mapList.get("no")}"></td>
                </c:forEach>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${entityList}" var="entity" varStatus="index">
                <tr>
                    <td id="rank<%=++rank%>"><%=rank%>
                    </td>
                    <td>${entity.usersEntity.id}</td>
                    <td>${entity.entity.penalty}</td>
                    <td>${entity.entity.acProblemsNum}</td>
                    <td>${entity.entity.totScore}</td>
                    <c:set var="start" value="${0}"></c:set>
                    <c:set var="end" value="${entityList.size()}"></c:set>
                    <c:set var="ct" value="${0}"></c:set>
                    <c:forEach var="nullList" varStatus="index" begin="${start+1}" end="${end}">
                        <c:if test="${index.count ne entity.entityList[ct].no }">
                            <td></td>
                        </c:if>
                        <c:if test="${index.count eq entity.entityList[ct].no}">
                            <c:if test="${entity.entityList[ct].firstBlood eq 1}">
                                <td class="firstBlood">${entity.entityList[ct].acceptedTime}<br/>
                                    (-${entity.entityList[ct].penaltyTimes})
                                </td>
                            </c:if>
                            <c:if test="${entity.entityList[ct].firstBlood ne 1}">
                                <c:if test="${entity.entityList[ct].acceptedTime eq 0 }">
                                    <td class="notPassed"><br/>
                                        (-${entity.entityList[ct].penaltyTimes})
                                    </td>
                                </c:if>
                                <c:if test="${entity.entityList[ct].acceptedTime ne 0 }">
                                    <td class="notFirstBlood">${entity.entityList[ct].acceptedTime}<br/>
                                        (-${entity.entityList[ct].penaltyTimes})
                                    </td>
                                </c:if>
                            </c:if>
                            <c:set var="ct" value="${ct+1}"></c:set>
                        </c:if>
                    </c:forEach>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>
<%-- 设置ranklist的样式  --%>
<script>
    window.onload = setProblemTitle();
    window.onload = setStandingStyle();
    function setStandingStyle() {
        for (var index = 1; index <= 3; index++) {
            var rankTop3 = document.getElementById("rank" + index);
            rankTop3.className = "rankTop3";
        }
        for (var index = 4; index <= 10 && index <=${entityList.size()}; index++) {
            var rankTop10 = document.getElementById("rank" + index);
            rankTop10.className = "rankTop10";
        }
        for (var index = 10; index <${entityList.size()}; index++) {
            var rankAfter10 = document.getElementById("rank" + index);
            rankAfter10.className = "rankAfter10";
        }
    }
</script>
</body>
</html>
