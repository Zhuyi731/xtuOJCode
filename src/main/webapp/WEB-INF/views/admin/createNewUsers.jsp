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
    <link href="../../../css/bootstrap.min.css" rel='stylesheet' type='text/css'/>
    <link href="../../../css/custom.css" rel="stylesheet" type="text/css"/>
</head>
<body>
<div class="container" align="center">
    <div class="panel panel-default panel-primary" style="width: 1000px;">
        <div class="panel panel-heading">添加用户</div>
        <div class="panel panel-body" >
            <form method="post" role="form" class="form-horizontal" align="center">
                <div class="form-group">
                    <label class="control-label col-md-1 col-sm-1" for="username">Username</label>
                    <div class="col-md-2 col-sm-2">
                        <input type="text" class="form-control" id="username" name="username">
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-md-1 col-sm-1" for="password">Password</label>
                    <div class="col-md-2 col-sm-2">
                        <input type="text" class="form-control" id="password" name="password">
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-md-1 col-sm-1" for="authority">Authority</label>
                    <div class="col-md-2 col-sm-2">
                        <select id="authority" name="authority" class="form-control">
                            <option value="0">管理员</option>
                            <option value="1">老师</option>
                            <option value="2">学生</option>
                        </select>
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-md-1 col-sm-1" for="status">Status</label>
                    <div class="col-md-2 col-sm-2">
                        <input type="text" class="form-control" id="status" name="status">
                    </div>
                </div>
            <div class="panel panel-footer">
                <input type="submit" value="Confirm" class="btn btn-primary" style="width: 150px;">
            </div>
            </form>
        </div>
    </div>
</div>
</body>
</html>
