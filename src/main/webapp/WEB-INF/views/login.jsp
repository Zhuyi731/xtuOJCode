<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<%@page pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Login Page</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta content="text/html; charset=utf-8" http-equiv=Content-Type>
    <link rel="stylesheet" href="css/bootstrap.css">
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
<%@ include file="/WEB-INF/views/navigation.jsp"%>
<div class="row ">
    <div class="col-md-4 col-md-offset-4 col-sm-6 col-sm-offset-3 col-xs-10 col-xs-offset-1">
        <div class="panel panel-default">
            <div class="panel-heading">
                <strong> Please Login First </strong>
            </div>
            <div class="panel-body">
                <sf:form commandName="usersEntity" role="form" method="post">
                    <br>
                    <div class="form-group input-group">
                        <span class="input-group-addon">Username</span>
                        <input type="text" class="form-control" id="username"  name="username" placeholder="Enter your username">
                    </div>
                    <div class="form-group input-group">
                        <span class="input-group-addon">Password</span>
                        <input type="password" id="password" name="password" class="form-control"  placeholder="Enter your password">
                    </div>
                    <div class="form-group">
                        <label class="checkbox-inline">
                            <%--<input type="checkbox" name="remember"> Remember me--%>
                        </label>
                        <span class="pull-right">
                            <a href="forgetPassword">Forget password ? </a>
                        </span>
                    </div>
                    <input type="submit" class="btn btn-primary" value="Login Now">
                    <hr>
                    Not register ? <a href="register">click here </a>
                </sf:form>
            </div>

        </div>
    </div>


</div>
</body>
</html>
