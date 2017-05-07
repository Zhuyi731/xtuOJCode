<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/4/27
  Time: 18:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Modify Test</title>
    <link href="/css/bootstrap.min.css" rel='stylesheet' type='text/css'/>
</head>
<body>
<div class="container">
    <sf:form role="form" class="form-horizontal" method="post" onsubmit="return check()">
        <div id="part1" style="width:800px;margin-left:150px;display:;" align="center">
            <div class="panel panel-default panel-danger">
                <div class="panel panel-heading">比赛信息填写(*号为必填选项)</div>
                <div class="panel panel-body">
                    <div class="item form-group bad">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="contestId">比赛ID<span
                                class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <input id="contestId" name="contestId" class="form-control col-md-7 col-xs-12"
                                   value="${entity.contestId}"
                                   required="required" type="text" readonly="readonly">
                        </div>
                    </div>
                    <div class="item form-group bad">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="title">比赛名称<span
                                class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <input id="problemList" type="hidden" name="problemList">
                            <input id="title" name="title" class="form-control col-md-7 col-xs-12"
                                   value="${entity.title}"
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
                            <select class="form-control col-md-7 col-xs-12" name="type" id="type">
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
                            <textarea id="description" name="description" cols="60" rows="5">${entity.description}</textarea>
                        </div>
                    </div>
                    <div class="item form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="announcement">比赛公告</label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <textarea id="announcement" name="announcement" cols="60" rows="5">${entity.announcement}</textarea>
                        </div>
                    </div>
                </div>
                <div class="panel panel-footer ">
                    <div class="item form-group" align="center">
                       <input type="submit" class="btn btn-primary" style="width: 120px;" value="修改">
                    </div>
                </div>
            </div>
        </div>
    </sf:form>
</div>

</body>
</html>
