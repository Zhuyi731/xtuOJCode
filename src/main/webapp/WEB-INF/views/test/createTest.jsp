<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE HTML>
<html>
<head>
    <base href="<%=basePath%>">
    <title>Create a contest</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link href="css/bootstrap.css" rel='stylesheet' type='text/css'/>
    <link href="css/bootstrap.min.css" rel='stylesheet' type='text/css'/>
    <link href="css/style.css" rel="stylesheet"/>
    <script>
        function showProblem() {
            window.open('/contestAddProblems.jsp', 'newwindow', 'height=600, width=800, top=400, left=400, toolbar=no, menubar=no, scrollbars=no, resizable=no,location=no, status=no');
        }
    </script>
</head>
<body>
<%@include file="/WEB-INF/views/navigation.jsp" %>
<sf:form class="form-horizontal form-label-left" role="form" method="post" onsubmit="tt()">
    <div class="item form-group bad">
        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="title">比赛名称<span class="required">*</span>
        </label>
        <div class="col-md-6 col-sm-6 col-xs-12">
            <input id="title" name="title" class="form-control col-md-7 col-xs-12" placeholder="Enter Contest Title"
                   required="required" type="text">
        </div>
    </div>
    <div class="item form-group bad">
        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="startTimeStr">开始时间</label>
        <div class="col-md-6 col-sm-6 col-xs-12">
            <input type="datetime-local" id="startTimeStr" name="startTimeStr " required="required"
                   class="form-control col-md-7 col-xs-12">
        </div>
    </div>
    <div class="item form-group bad">
        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="frozenStartTimeStr">封榜时间</label>
        <div class="col-md-6 col-sm-6 col-xs-12">
            <input type="datetime-local" id="frozenStartTimeStr" name="frozenStartTimeStr"
                   class="form-control col-md-7 col-xs-12">
        </div>
    </div>
    <div class="item form-group bad">
        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="endTimeStr">结束时间</label>
        <div class="col-md-6 col-sm-6 col-xs-12">
            <input type="datetime-local" id="endTimeStr" name="endTimeStr" required="required"
                   class="form-control col-md-7 col-xs-12">
        </div>
    </div>
    <div class="item form-group bad">
        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="type">比赛类型</label>
        <div class="col-md-6 col-sm-6 col-xs-12">
            <select class="form-control  col-md-7 col-xs-12" name="type" id="type">
                <option value="0" selected="selected">公开</option>
                <option value="1">可公开看榜，看题，非注册不可交题</option>
                <option value="2">注册私有</option>
                <option value="3">密码私有</option>
                <option value="3">名单导入私有</option>
            </select>
        </div>
    </div>
    <div class="item form-group">
        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="status">线上或线下</label>
        <div class="col-md-6 col-sm-6 col-xs-12">
            <select class="form-control col-md-7 col-xs-12" id="status" name="status">
                <option value="0">线下</option>
                <option value="1" selected="selected">线上</option>
            </select>
        </div>
    </div>
    <div class="item form-group">
        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="description">比赛描述日志</label>
        <div class="col-md-6 col-sm-6 col-xs-12">
            <textarea id="description" name="description" cols="60" rows="5"></textarea>
        </div>
    </div>
    <div class="item form-group">
        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="anouncement">比赛公告</label>
        <div class="col-md-6 col-sm-6 col-xs-12">
            <textarea id="anouncement" name="anouncement" cols="60" rows="5"></textarea>
        </div>
    </div>
    <div class="item form-group" align="center">
        <button type="button" class="btn btn-warning" onclick="showProblem()">添加题目</button>
    </div>
    <div class="item form-group" align="center">
        <input type="submit" class="btn btn-primary btn-lg" value="创建" style="width:120px;">
    </div>
</sf:form>
</body>
</html>
