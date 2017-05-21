<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/4/20
  Time: 16:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE HTML>
<html>
<head>
    <title>add Student</title>

    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link href="/css/bootstrap.min.css" rel='stylesheet' type='text/css'/>
    <link href="/css/custom.css" rel="stylesheet" type="text/css"/>
</head>
<body>
<div class="container" align="center">
    <div class="panel panel-default panel-primary" style="width: 1000px;">
        <div class="panel panel-heading">添加用户</div>
        <div class="panel panel-body">
            <%--<form method="post" role="form" class="form-horizontal" align="center">--%>
            <%--<div class="form-group">--%>
            <%--<label class="control-label col-md-1 col-sm-1" for="username">Username</label>--%>
            <%--<div class="col-md-2 col-sm-2">--%>
            <%--<input type="text" class="form-control" id="username" name="username">--%>
            <%--</div>--%>
            <%--</div>--%>
            <%--<div class="form-group">--%>
            <%--<label class="control-label col-md-1 col-sm-1" for="password">Password</label>--%>
            <%--<div class="col-md-2 col-sm-2">--%>
            <%--<input type="text" class="form-control" id="password" name="password">--%>
            <%--</div>--%>
            <%--</div>--%>
            <%--<div class="form-group">--%>
            <%--<label class="control-label col-md-1 col-sm-1" for="authority">Authority</label>--%>
            <%--<div class="col-md-2 col-sm-2">--%>
            <%--<select id="authority" name="authority" class="form-control">--%>
            <%--<option value="0">管理员</option>--%>
            <%--<option value="1">老师</option>--%>
            <%--<option value="2">学生</option>--%>
            <%--</select>--%>
            <%--</div>--%>
            <%--</div>--%>
            <%--<div class="form-group">--%>
            <%--<label class="control-label col-md-1 col-sm-1" for="status">Status</label>--%>
            <%--<div class="col-md-2 col-sm-2">--%>
            <%--<input type="text" class="form-control" id="status" name="status">--%>
            <%--</div>--%>
            <%--</div>--%>
            <%--<div class="panel panel-footer">--%>
            <%--<input type="submit" value="Confirm" class="btn btn-primary" style="width: 150px;">--%>
            <%--</div>--%>
            <%--</form>--%>
        </div>
        <div>
            <sf:form method="post" class="form-horizontal form-label-left" role="form" enctype="multipart/form-data">
            <div class="form-group">
                文件类型为txt文本文件，单行表示添加单个用户，单行格式：顺序为id,name,class,role（0为管理员，1为老师，2为学生）,用一个'|'分隔。
                <br/>
                如：2013551833|潘帅|软件4班|2（其中表示添加学号为2013551833，班级为软件4班，名字为潘帅，角色为学生的用户）
                <br/>
                <p style="color:red">注意：请不要添加多余空格或者空行.</p>
            </div>
            <div class="form-group">
                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="uploadFile">上传数据文件(txt):</label>
                <div class="col-md-6 col-sm-6 col-xs-12">
                    <input type="file" id="uploadFile" accept="text/plain" name="usersFile" class="form-control">
                </div>
            </div>
            <div class="form-group" align="center">
                <input type="submit" class="btn btn-lg btn-primary" value="确定">
            </div>
        </div>
        </sf:form>
    </div>
</div>
</body>
</html>
