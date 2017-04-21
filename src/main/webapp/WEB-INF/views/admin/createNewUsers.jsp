<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/4/20
  Time: 16:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE HTML>
<head>
    <title>createNewUsers</title>
</head>
<body>
<form method="post" class="form-horizontal">
    <div class="form-group">
        <label for="userId" class="col-sm-2 col-sm-offset-2 col-md-2 col-md-offset-2 control-label">账号:</label>
        <div class="col-sm-3 col-md-3">
            <input type="text" id="userId" name="userId" class="form-control ">
        </div>
    </div>
    <div class="form-group">
        <label for="password" class="col-sm-2 col-sm-offset-2 col-md-2 col-md-offset-2 control-label">密码:</label>
        <div class="col-sm-3 col-md-3">
            <input type="text" id="password" name="password" class="form-control ">
        </div>
    </div>
    <div class="form-group">
        <label for="name" class="col-sm-2 col-sm-offset-2 col-md-2 col-md-offset-2 control-label">姓名:</label>
        <div class="col-sm-3 col-md-3">
            <input type="text" id="name" name="name" class="form-control ">
        </div>
    </div>
    <div class="form-group">
        <label for="college" class="col-sm-2 col-sm-offset-2 col-md-2 col-md-offset-2 control-label">院系：</label>
        <div class="col-sm-3 col-md-3">
            <input type="text" id="college" name="college" class="form-control " value=${student.major} disabled>
        </div>
    </div>
    <div class="form-group">
        <label for="sex" class="col-sm-2 col-sm-offset-2 col-md-2 col-md-offset-2 control-label">性别：</label>
        <div class="col-sm-3 col-md-3">
            <input type="text" id="sex" name="sex" class="form-control " value="" disabled>
        </div>
    </div>
    <div class="form-group">
        <label for="motto" class="col-sm-2 col-sm-offset-2 col-md-2 col-md-offset-2 control-label">motto:</label>
        <div class="col-sm-3 col-md-3">
            <input type="text" class="form-control" id="motto" name="motto" value="">
        </div>
    </div>
    <div class="form-group">
        <label for="nickname" class="col-sm-2 col-sm-offset-2 col-md-2 col-md-offset-2 control-label">Nickname：</label>
        <div class="col-sm-3 col-md-3">
            <input type="text" class="form-control" name="nickname" id="nickname">
        </div>
    </div>
    <div class="form-group">
        <label for="QQ" class="col-sm-2 col-sm-offset-2 col-md-2 col-md-offset-2 control-label">QQ:</label>
        <div class="col-sm-3 col-md-3">
            <input type="text" class="form-control" id="QQ" name="QQ">
        </div>
    </div>
    <div class="form-group">
        <label for="email" class="col-sm-2 col-sm-offset-2 col-md-2 col-md-offset-2 control-label">email:</label>
        <div class="col-sm-3 col-md-3">
            <input type="text" class="form-control" id="email" name="email" value="">
        </div>
    </div>
    <div class="form-group">
        <label for="status" class="col-sm-2 col-sm-offset-2 col-md-2 col-md-offset-2 control-label">学生状态:</label>
        <div class="col-sm-3 col-md-3" style="padding-left:0;" id="status">
            <input type="radio" name="status" value="1" checked="checked">是
            <input type="radio" name="status" value="0">否
        </div>
    </div>
    <div class="form-group">
    </div>
    <div class="form-group" align="middle">
        <div class="col-sm-1 col-sm-offset-4 col-md-1 col-md-offset-1">
            <input type="submit" class="form-control" id="submit" value="修改">
        </div>
        <div class="col-sm-1 col-md-1">
            <input type="reset" class="form-control" id="reset" value="重置">
        </div>
    </div>
</form>
</body>
</html>
