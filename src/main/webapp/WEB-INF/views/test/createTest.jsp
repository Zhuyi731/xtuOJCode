<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
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
  <form class="form-horizontal form-label-left" role="form">
      <div class="item form-group bad">
          <label class="control-label col-md-3 col-sm-3 col-xs-12" for="title">比赛名称<span class="required">*</span>
          </label>
          <div class="col-md-6 col-sm-6 col-xs-12">
              <input id="title" name="title" class="form-control col-md-7 col-xs-12" data-validate-length-range="6" data-validate-words="2" name="name" placeholder="Enter Contest Title" required="required" type="text">
          </div>
          <div class="alert">input is not complete</div></div>
      <div class="item form-group bad">
          <label class="control-label col-md-3 col-sm-3 col-xs-12" for="startTime">开始时间<span class="required">*</span>
          </label>
          <div class="col-md-6 col-sm-6 col-xs-12">
              <input type="datetime-local" id="startTime" name="startTime" required="required" class="form-control col-md-7 col-xs-12">
          </div>
          <div class="alert">Start Time is invalid</div></div>
      <div class="item form-group bad">
          <label class="control-label col-md-3 col-sm-3 col-xs-12" for="frozenStartTime">封榜时间 <span class="required">*</span>
          </label>
          <div class="col-md-6 col-sm-6 col-xs-12">
              <input type="datetime-local" id="frozenStartTime" name="frozenStartTime"required="required" class="form-control col-md-7 col-xs-12">
          </div>
      <div class="item form-group bad">
          <label class="control-label col-md-3 col-sm-3 col-xs-12" for="endTime">结束时间 <span class="required">*</span>
          </label>
          <div class="col-md-6 col-sm-6 col-xs-12">
              <input type="datetime-local" id="endTime" name="endTime"required="required" class="form-control col-md-7 col-xs-12">
          </div>
          <div class="alert">End Time is invalid</div></div>
      <div class="item form-group">
          <select>
              <option value="0" selected="selected">公开</option>
              <option value="1">可公开看榜，看题，非注册不可交题</option>
              <option value="2">注册私有</option>
              <option value="3">密码私有</option>
              <option value="3">名单导入私有</option>
          </select>
      </div>
          <div class="item form-group">
          <select>
              <option value="0" >线下</option>
              <option value="1" selected="selected">线上</option>
             </select>
      </div>
      <div class="item form-group">
          <label class="control-label col-md-3 col-sm-3 col-xs-12" for="occupation">Occupation <span class="required">*</span>
          </label>
          <div class="col-md-6 col-sm-6 col-xs-12">
              <input id="occupation" type="text" name="occupation" data-validate-length-range="5,20" class="optional form-control col-md-7 col-xs-12">
          </div>
      </div>
      <div class="item form-group">
          <label for="password" class="control-label col-md-3">Password</label>
          <div class="col-md-6 col-sm-6 col-xs-12">
              <input id="password" type="password" name="password" data-validate-length="6,8" class="form-control col-md-7 col-xs-12" required="required">
          </div>
      </div>
      <div class="item form-group bad">
          <label for="password2" class="control-label col-md-3 col-sm-3 col-xs-12">Repeat Password</label>
          <div class="col-md-6 col-sm-6 col-xs-12">
              <input id="password2" type="password" name="password2" data-validate-linked="password" class="form-control col-md-7 col-xs-12" required="required">
          </div>
          <div class="alert">passwords do not match</div></div>
      <div class="item form-group bad">
          <label class="control-label col-md-3 col-sm-3 col-xs-12" for="telephone">Telephone <span class="required">*</span>
          </label>
          <div class="col-md-6 col-sm-6 col-xs-12">
              <input type="tel" id="telephone" name="phone" required="required" data-validate-length-range="8,20" class="form-control col-md-7 col-xs-12">
          </div>
          <div class="alert">invalid input</div></div>
      <div class="item form-group">
          <label class="control-label col-md-3 col-sm-3 col-xs-12" for="textarea">Textarea <span class="required">*</span>
          </label>
          <div class="col-md-6 col-sm-6 col-xs-12">
              <textarea id="textarea" required="required" name="textarea" class="form-control col-md-7 col-xs-12"></textarea>
          </div>
      </div>
      <div class="ln_solid"></div>
      <div class="form-group">
          <div class="col-md-6 col-md-offset-3">
              <button type="submit" class="btn btn-primary">Cancel</button>
              <button id="send" type="submit" class="btn btn-success">Submit</button>
          </div>
      </div>
  </form>

  </body>
</html>
