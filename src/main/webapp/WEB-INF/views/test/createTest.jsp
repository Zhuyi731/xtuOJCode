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
    <link href="css/bootstrap.min.css" rel='stylesheet' type='text/css'/>
    </head>
<body>
<sf:form role="form" class="form-horizontal" method="post" onsubmit="return check()">
    <div id="part1" style="width:800px;margin-left:150px;display:;" align="center">
        <div class="panel panel-default  panel-danger">
            <div class="panel panel-heading">比赛信息填写(*号为必填选项)</div>
            <div class="panel panel-body">
                <div class="item form-group bad">
                    <label class="control-label col-md-3 col-sm-3 col-xs-12" for="title">比赛名称<span
                            class="required">*</span>
                    </label>
                    <div class="col-md-6 col-sm-6 col-xs-12">
                    <input id="problemList" type="hidden" name="problemList">
                        <input id="title" name="title" class="form-control col-md-7 col-xs-12"
                               placeholder="Enter Contest Title"
                               required="required" type="text">
                    </div>
                </div>
                <div class="item form-group bad">
                    <label class="control-label col-md-3 col-sm-3 col-xs-12" for="startTimeStr">开始时间<span
                            class="required">*</span></label>
                    <div class="col-md-6 col-sm-6 col-xs-12">
                        <input type="datetime-local" id="startTimeStr" name="startTimeStr" required="required"
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
                    <label class="control-label col-md-3 col-sm-3 col-xs-12" for="endTimeStr">结束时间<span
                            class="required">*</span></label>
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
            </div>
            <div class="panel panel-footer ">
                <div class="item form-group" align="center">
                    <button type="button" class="btn btn-primary " onclick="next()" style="width:120px;">下一步
                    </button>
                </div>
            </div>
        </div>
    </div>
    <div id="part2" style="display:none; width: 800px;margin-left:150px;">
        <div class="panel panel-default panel-danger">
            <div class="panel panel-heading" align="center">添加题目</div>
            <div class="panel panel-body" align="center">
                <div  class="item form-group"   style="width:700px;">
                    <table id="addProblemTable" class="table table-bordered ">
                        <thead>
                        <tr>
                            <td class="col-md-2">考试题目序号</td>
                            <td class="col-md-2">题目ID</td>
                            <td class="col-md-2">分数</td>
                            <td class="col-md-2">删除</td>
                        </tr>
                        </thead>
                        <tbody id="problemSequence">
                        <tr id="line1">
                            <td id="No1">1</td>
                            <td ><input id="problemId1" type="number"></td>
                            <td ><input id="score1" type="number"></td>
                            <td ><button class="btn btn-danger btn-sm" id="d1" onclick="deleteProblem(1)">删除</button></td>
                        </tr>
                        </tbody>
                    </table>
                </div>
                <div class="item form-group" align="center">
                    <button type="button" class="btn btn-warning" id="addButton" onclick="addProblem(1)" style="width:100px; "><span class="glyphicon glyphicon-plus"></span></button>
                </div>
            </div>
            <div class="panel panel-footer">
                <div class="item form-group" align="center">
                    <button type="button" class="btn btn-primary bnt-lg" id="deleteButton1" style="width:120px;" onclick="back()">上一步
                    </button>
                    <input type="submit" class="btn btn-primary " value="创建"  style="width:120px;" >
                    <input type="reset" class="btn btn-primary " value="重置"  style="width:120px;" >
                </div>
            </div>
        </div>
    </div>
</sf:form>
<script src="/js/custom.js" rel="script" language="JavaScript"></script>
</body>
</html>
