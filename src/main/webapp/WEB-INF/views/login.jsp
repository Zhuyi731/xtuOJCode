<%--
  Created by IntelliJ IDEA.
  User: Ilovezilian
  Date: 2017/4/15
  Time: 10:21
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<sf:form commandName="usersEntity" method="POST" name="login" class="form-horizontal"  role="form">
    <%--<sf:form commandName="usersEntity" method="POST" name="login" class="form-horizontal" action="${basePath}/info.jsp" role="form">--%>
    <div class="form-group">
        <label for="username" class="col-sm-2 col-sm-offset-2 control-label">账号：</label>
        <div class="col-sm-3">
            <sf:input path="id" type="text" class="form-control" id="username" name="username" placeholder="请输入账号"/>
        </div>
    </div>
    <div class="form-group">
        <label for="username" class="col-sm-2 col-sm-offset-2 control-label">名字：</label>
        <div class="col-sm-3">
            <sf:input path="name" type="text" class="form-control" id="username" name="username" placeholder="请输入账号"/>
        </div>
    </div>
    <div class="form-group">
        <label for="password" class="col-sm-2 col-sm-offset-2 control-label">密码：</label>
        <div class="col-sm-3">
            <%--<sf:password path="password" type="password" id="password" name="password" class="form-control"--%>
            <%--placeholder="请输入密码"/>--%>
            <%--<sf:errors path="password"/>--%>
            <sf:input path="password" type="password" id="password" name="password" class="form-control"
                   placeholder="请输入密码"/>
        </div>
    </div>
    <div>
        <div class="col-sm-offset-4 col-sm-2">
            <input type="checkbox" id="remember"/>记住密码
        </div>
        <div class="col-sm-2">
            <input type="submit" class="btn btn-info btn-lg" value="登录"/>
        </div>
    </div>
</sf:form>

</body>
</html>
