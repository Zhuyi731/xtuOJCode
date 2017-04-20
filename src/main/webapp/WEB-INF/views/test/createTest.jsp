<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML>
<html>
  <head>
    <base href="<%=basePath%>">
    <title>Create a contest</title>
      <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
      <link href="css/bootstrap.css" rel='stylesheet' type='text/css' />
      <link href="css/bootstrap.min.css" rel='stylesheet' type='text/css' />
      <link href="css/style.css" rel="stylesheet" />
  </head>
  <body>
  <%@include file="/WEB-INF/views/navigation.jsp"%>
  <form class="form-horizontal form-label-left" role="form">
      <div class="item form-group bad">
          <label class="control-label col-md-3 col-sm-3 col-xs-12" for="title">比赛名称<span class="required">*</span>
          </label>
          <div class="col-md-6 col-sm-6 col-xs-12">
              <input id="title" name="title" class="form-control col-md-7 col-xs-12" data-validate-length-range="6" data-validate-words="2" name="name" placeholder="Enter Contest Title" required="required" type="text">
          </div>
          <div class="alert">input is not complete</div></div>
      <div class="item form-group bad">
          <label class="control-label col-md-3 col-sm-3 col-xs-12" for="startTime">开始时间</label>
          <div class="col-md-6 col-sm-6 col-xs-12">
              <input type="datetime-local" id="startTime" name="startTime" required="required" class="form-control col-md-7 col-xs-12">
          </div>
          <div class="alert">Start Time is invalid</div></div>
      <div class="item form-group bad">
          <label class="control-label col-md-3 col-sm-3 col-xs-12" for="frozenStartTime">封榜时间</label>
          <div class="col-md-6 col-sm-6 col-xs-12">
              <input type="datetime-local" id="frozenStartTime" name="frozenStartTime" class="form-control col-md-7 col-xs-12">
          </div>
      </div>
      <div class="item form-group bad">
          <label class="control-label col-md-3 col-sm-3 col-xs-12" for="endTime">结束时间</label>
          <div class="col-md-6 col-sm-6 col-xs-12">
              <input type="datetime-local" id="endTime" name="endTime"required="required" class="form-control col-md-7 col-xs-12">
          </div>
          <div class="alert">End Time is invalid</div>
      </div>
      <div class="item form-group bad">
          <label class="control-label col-md-3 col-sm-3 col-xs-12" for="endTime">比赛类型</label>
          <div class="col-md-6 col-sm-6 col-xs-12">
          <select class="form-control  col-md-7 col-xs-12">
              <option value="0" selected="selected">公开</option>
              <option value="1">可公开看榜，看题，非注册不可交题</option>
              <option value="2">注册私有</option>
              <option value="3">密码私有</option>
              <option value="3">名单导入私有</option>
          </select>
      </div></div>
      <div class="item form-group">
          <label class="control-label col-md-3 col-sm-3 col-xs-12" for="endTime">线上或线下</label>
          <div class="col-md-6 col-sm-6 col-xs-12">
              <select class="form-control col-md-7 col-xs-12">
              <option value="0" >线下</option>
              <option value="1" selected="selected">线上</option>
             </select>
          </div></div>
      <div class="item form-group">
          <label class="control-label col-md-3 col-sm-3 col-xs-12" for="description">比赛描述日志</label>
          <div class="col-md-6 col-sm-6 col-xs-12">
              <textarea id="description"  name="description"  cols="60" rows="5"></textarea>
          </div>
      </div>
      <div class="item form-group">
          <label class="control-label col-md-3 col-sm-3 col-xs-12" for="anouncement">比赛公告</label>
          <div class="col-md-6 col-sm-6 col-xs-12">
              <textarea id="anouncement"  name="anouncement"  cols="60" rows="5"></textarea>
          </div>
      </div>
      <div class="item form-group">
          <div class="col-md-2 col-sm-2 col-xs-4" align="center">
          <input type="submit" class="btn btn-primary btn-lg" value="创建">
          </div>
      </div>
  </form>
  </body>
</html>
