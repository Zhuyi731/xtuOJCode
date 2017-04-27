<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<!DOCTYPE HTML >
<html>
<head>
    <base href="<%=basePath%>" target="contentFrame">
    <title>修改密码</title>
    <META content="text/html; charset=utf-8" http-equiv=Content-Type>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/custom.css">
</head>

<body>
<div align="center" style="margin-top:40px;">
    <form role="form" class="form-horizontal" method="post" onSubmit="return check()">
        <div class="form-group">
            <label for="password" class="col-md-2 col-md-offset-2 control-label">密码：</label>
            <div class="col-md-3">
                <input type="password" class="form-control col-md-4" id="password" name="password"
                       placeholder="请输入6~10位密码" maxlength="10">
            </div>
            <div class="col-md-3"><p id="alert0" style="color:red;display:none">密码长度过短!</p></div>
        </div>
        <div class="form-group">
            <label for="passwordRep" class="col-md-2 col-md-offset-2 control-label">密码确认：</label>
            <div class="col-md-3">
                <input type="password" class="form-control col-md-4" id="passwordRep" name="passwordRep"
                       placeholder="请再输入一次密码">
            </div>
            <div class="col-md-3"><p id="alert" style="color:red;display:none">两次输入密码不一致!</p></div>
        </div>

        <div class="form-group" align="center">
            <div class="col-sm-1 col-sm-offset-4">
                <input type="submit" class="form-control btn-primary" id="submit" value="提交">
            </div>
            <div class="col-sm-1 ">
                <input type="reset" class="form-control btn-primary" id="reset" value="重置">
            </div>
        </div>
    </form>
</div>
<script type="text/javascript" language="javascript">
    function check() {
        var s = document.getElementById("alert");
        var ss = document.getElementById("alert0");
        var p1 = document.getElementById("password");
        var p2 = document.getElementById("passwordRep");
        if (p1.value.length < 6) {
            ss.style.display = "";
            return false;
        } else {
            ss.style.display = "none";
        }

        if (p1.value != p2.value) {
            s.style.display = "";
            return false;
        } else {
            s.style.display = "none";
            return true;
        }
    }
</script>
</body>
</html>
