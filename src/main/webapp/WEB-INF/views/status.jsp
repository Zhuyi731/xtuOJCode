<%@ page import="com.xtu.DB.vo.StatusVO" %>
<%@ page import="com.xtu.DB.vo.StatusEntityVO" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="java.util.ArrayList" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";

    StatusVO vo = (StatusVO) request.getAttribute("vo");
    String currentPage = String.valueOf(vo.getStart() + 1);
    pageContext.setAttribute("currentPage", currentPage);
    String totalPage = String.valueOf(vo.getTotal() / 20 + 1);
    pageContext.setAttribute("totalPage", totalPage);
    List<StatusEntityVO> list = vo.getEntityList();
    Iterator it = list.iterator();
    String[] trans = {"All","Accept", "Wrong Answer", "Compile Error", "Runtime Error", "Presentation Error", "Time Limit Exceed", "Memory Limit Exceed", "Output Limit Exceed"};
    ArrayList result = new ArrayList<String>();
//    ArrayList problemId = new ArrayList<String>();
//    ArrayList language = new ArrayList<String>();
//    ArrayList resultCode = new ArrayList<String>();
//    ArrayList runMemory = new ArrayList<String>();
//    ArrayList runTime = new ArrayList<String>();
//    ArrayList runId = new ArrayList<String>();
    for (int i = 0; i < list.size(); i++) {
        result.add(trans[list.get(i).getResultCode()]);
//        problemId.add(list.get(i).getProblemId());
//        language.add(list.get(i).getLanguage());
//        resultCode.add(list.get(i).getResultCode());
//        runMemory.add(list.get(i).getRunMemory());
//        runTime.add(list.get(i).getRunTime());
//        runId.add(list.get(i).getRunId());
    }
    pageContext.setAttribute("result", result);
//    pageContext.setAttribute("problemId", problemId);
//    pageContext.setAttribute("language", language);
//    pageContext.setAttribute("resultCode", resultCode);
//    pageContext.setAttribute("runMemory", runMemory);
//    pageContext.setAttribute("runTime", runTime);
//    pageContext.setAttribute("runId", runId);
%>
<!DOCTYPE HTML>
<html>
<head>
    <base href="<%=basePath%>">
    <title>Online Status</title>
    <link href="/css/bootstrap.min.css" rel='stylesheet' type='text/css'/>
    <link href="/css/custom.css" rel='stylesheet' type='text/css'/>
    <script src="/js/run_prettify.js"></script>
</head>
<body onload="prettyPrint()">
<%
    String url = request.getHeader("referer");
    String background = "http://localhost:8080/admin/menu";
    if (background.equals(url)) {
        pageContext.setAttribute("nav", 0);
    } else {
        pageContext.setAttribute("nav", 1);
    }
%>
<c:if test="${nav eq 1}">
    <%@ include file="/WEB-INF/views/navigation.jsp" %>
</c:if>
<security:authorize access="isAuthenticated()">
    <security:authentication property="principal.username" var="userId"/>
    <security:authentication property="principal.authorities" var="roleId"/>
</security:authorize>
<h1 class="statusHead">Online Status</h1>
<div class="statusSearch" style="line-height:15px;">
    <sf:form commandName="statusDTO" role="form" method="post" class="form-inline" onsubmit="return checkStatusSubmit()">
        <div class="form-group">
            <label for="problemId" class="control-label col-md-1 col-sm-1">Pro.ID</label>
            <div class="col-md-offset-1 col-sm-offset-1">
                <input type="text" class="form-control" name="problemId" id="problemId"  placeholder="题目编号">
            </div>
        </div>
        <div class="form-group">
            <label for="id" class="control-label  col-md-1 col-sm-1">username</label>
            <div class="col-md-offset-1 col-sm-offset-1">
                <input type="text" class="form-control" name="id" id="id" placeholder="用户名">
            </div>
        </div>
        <div class="form-group">
            <label for="language" class="control-label ">Language</label>
            <select id="language" name="language" class="form-control col-sm-offset-1 col-md-offset-1">
                <option value="0">All</option>
                <option value="MS C">MS C</option>
                <option value="MS C++">MS C++</option>
                <option value="GUN C">GUN C</option>
                <option value="GUN C++">GUN C++</option>
                <option value="Java">Java</option>
            </select>
        </div>
        <div class="form-group">
            <label for="result" class="control-label">Result</label>
            <select id="result" name="result" class="form-control col-md-offset-1 col-sm-offset-1">
                <option value="0">All</option>
                <option value="1">Accept</option>
                <option value="2">Wrong Answer</option>
                <option value="3">Compile Error</option>
                <option value="4">Runtime Error</option>
                <option value="5">Presentation Error</option>
                <option value="6">Time Limit Exceed</option>
                <option value="7">Memory Exceed Exceed</option>
                <option value="8">Output Limit Exceed</option>
            </select>
        </div>
        <div class="form-group" style="padding-top:15px;">
            <input type="submit" value="Search" class="btn bg-primary  col-md-offset-1 col-sm-offset-1">
        </div>
    </sf:form>
</div>
<div class="page" style="margin:0px 160px;">
    <ul class="pager">
        <c:if test="${currentPage != 1}">
            <li class="previous"><a href="/status/0">&laquo;&laquo;The First Page</a></li>
        </c:if>
        <c:if test="${currentPage > 1}">
            <li class="previous"><a href="/status/${currentPage-2}">&laquo;Previous Page</a></li>
        </c:if>
        <c:if test="${currentPage > 2 }">
            <li class="start"><a href="/status/${currentPage-3}">${currentPage-2}</a></li>
        </c:if>
        <c:if test="${currentPage > 1 }">
            <li class="start"><a href="/status/${currentPage-2}">${currentPage-1}</a></li>
        </c:if>

        <li class="start"><a href="/status/${currentPage-1}" disabled="disabled">${currentPage}</a></li>

        <c:if test="${currentPage < totalPage}">
            <li class="start"><a href="/status/${currentPage}">${currentPage+1}</a></li>
        </c:if>
        <c:if test="${currentPage < totalPage-1}">
            <li class="start"><a href="/status/${currentPage+1}">${currentPage+2}</a></li>
        </c:if>
        <li class="start">
            The&nbsp;${currentPage}/${totalPage}&nbsp;Page&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Total&nbsp;${vo.total}&nbsp;Records
        </li>
        <c:if test="${currentPage < totalPage}">
            <li class="next"><a href="/status/${totalPage-1}">The Last Page&raquo;&raquo;</a></li>
        </c:if>
        <c:if test="${currentPage < totalPage}">
            <li class="next"><a href="/status/${vo.start+1}">Next Page&raquo;</a></li>
        </c:if>
    </ul>
</div>
<div class="status">
    <table class="table table-bordered table-hover">
        <thead>
        <tr>
            <td class="col-md-offset-1 col-md-1 col-sm-offset-1 col-sm-1">Run.ID</td>
            <td class="col-md-1 col-sm-1">Pro.ID</td>
            <td class="col-md-1 col-sm-1">Username</td>
            <td class="col-md-2 col-sm-2">Result</td>
            <td class="col-md-1 col-sm-1">Memory</td>
            <td class="col-md-1 col-sm-1">Time</td>
            <td class="col-md-1 col-sm-1">Code Status</td>
            <td class="col-md-1 col-sm-1">Language</td>
            <td class="col-md-1 col-sm-1">Code.Len</td>
            <td class="col-md-2 col-sm-2">Submit Time</td>
        </thead>
        <tbody>
        <c:forEach items="${vo.entityList}" var="entity" varStatus="loop">
            <tr class="statusTr" align="center">
                <td id="runId${loop.count-1}">${entity.runId}</td>
                <td id="problemId${loop.count-1}">${entity.problemId}</td>
                <td id="id${loop.count-1}">${entity.id}</td>
                <td  ><a id="result${loop.count-1}" style="width: 140px; padding-top:6px;">${result[loop.count-1]}</a></td>
                <td id="runMemory${loop.count-1}">${entity.runMemory}&nbsp;KB</td>
                <td id="runTime${loop.count-1}">${entity.runTime}&nbsp;MS</td>
                   <%--管理员--%>
                <c:if test="${roleId eq '[0]'}">
                    <td ><a href="/codeDetail/${entity.runId}" class="btn btn-success ">See Codes</a>
                    </td>
                </c:if>
                    <%--不是管理员--%>
                <c:if test="${roleId ne '[0]'}">
                    <%--自己人--%>
                    <c:if test="${userId eq entity.id}">
                        <td>
                            <a href="/codeDetail/${entity.runId}" class="btn btn-success">See Codes</a>
                        </td>
                    </c:if>
                    <%--别人--%>
                    <c:if test="${userId ne entity.id}">
                        <c:if test="${entity.open eq 0}">
                            <td><span class="btn btn-danger" disabled="disabled">Private</span></td>
                        </c:if>
                        <c:if test="${entity.open eq 1}">
                            <td><a
                                    href="/codeDetail/${entity.runId}" class="btn btn-success">See Codes</a></td>
                        </c:if>
                    </c:if>
                </c:if>
                <td id="language${loop.count-1}">${entity.language}</td>
                <td id="codeLength${loop.count-1}">${entity.codeLength}</td>
                <td id="submitTime${loop.count-1}" style="width: 160px;">${entity.submitTime}</td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>

<%--<!-- 模态框（Modal） -->--%>
<%--<div class="modal fade in" id="codeModal" tabindex="-1" role="dialog" aria-labelledby="codeModalTitle"--%>
     <%--aria-hidden="true">--%>
    <%--<div class="modal-dialog">--%>
        <%--<div class="modal-content">--%>
            <%--<div class="modal-header " align="center">--%>
                <%--<button type="button" class="close" data-dismiss="modal" aria-hidden="true">--%>
                    <%--&times;--%>
                <%--</button>--%>
                <%--<h4 class="modal-title" id="codeModalTitle">--%>
                <%--</h4>--%>
            <%--</div>--%>
            <%--<div class="modal-body">--%>
                <%--<pre class="prettyprint" id="codeContent" onload="prettyPrint()">--%>
                     <%--<xmp>--%>
                     <%--</xmp>--%>
                 <%--</pre>--%>
            <%--</div>--%>
            <%--<div class="modal-footer">--%>
                <%--<button type="button" class="btn btn-default" data-dismiss="modal">关闭--%>
                <%--</button>--%>
            <%--</div>--%>
        <%--</div><!-- /.modal-content -->--%>
    <%--</div><!-- /.modal -->--%>
<%--</div>--%>
<%--<script type="text/JavaScript" src="/js/jquery.js"></script>--%>
<script type="text/JavaScript" src="/js/custom.js"></script>
<script type="text/javascript">
window.onload = setClass;
function setClass() {
    for (var index = 0; index < ${vo.entityList.size()}; index++) {
        var rr = document.getElementById("result" + index);
        var result = rr.innerHTML;
        if (result == "Accept") {
            rr.className = "btn  accept";
        } else if (result == "Wrong Answer") {
            rr.className = "btn  wrongAnswer";
        } else if (result == "Runtime Error") {
            rr.className = "btn  runtimeError";
        }
        else if (result == "Compile Error") {
            rr.className = "btn compileError";
        } else if (result == "Presentation Error") {
            rr.className = "btn  presentationError";
        } else if (result == "Time Limit Exceed") {
            rr.className = "btn  timeLimitExceed";
        } else if (result == "Memory Limit Exceed") {
            rr.className = "btn  memoryLimitExceed";
        } else {
            rr.className = "btn  outputLimitExceed"
        }
    }
}
</script>
</body>
</html>