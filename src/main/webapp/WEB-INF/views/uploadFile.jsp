<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<%--
  Created by IntelliJ IDEA.
  User: Ilovezilian
  Date: 2017/4/19
  Time: 15:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>upload files</title>
</head>
<body>
<%--<sf:form commandName="usersEntity" method="POST" name="login" class="form-horizontal" role="form">
    &lt;%&ndash;错误处理方式1:将错误提示放到表单顶部&ndash;%&gt;
    <sf:errors path="*" element="div" cssClass="error"/>
    &lt;%&ndash;<sf:form commandName="usersEntity" method="POST" name="login" class="form-horizontal" action="${basePath}/info.jsp" role="form">&ndash;%&gt;
    <div class="form-group">
            &lt;%&ndash;错误处理方式2:将错误提示放到label标签处 表单视图推荐&ndash;%&gt;
        <sf:label path="id" cssErrorClass="error" for="username"
                  class="col-sm-2 col-sm-offset-2 control-label">账号：</sf:label>
        <sf:errors path="*" element="div" cssClass="error"/>
        <div class="col-sm-3">
            <sf:input path="id" type="text" class="form-control" id="username" name="username" placeholder="请输入账号"/>
                &lt;%&ndash;错误处理方式3:将错误提示放到出错标签处&ndash;%&gt;
            <sf:label path="id" cssErrorClass="error" for="username"/>
            <sf:errors path="id" cssClass="error"/>
        </div>
    </div>
    <div class="form-group">
        <label for="username" class="col-sm-2 col-sm-offset-2 control-label">名字：</label>
        <div class="col-sm-3">
            <sf:input path="name" type="text" class="form-control" id="username" name="username" placeholder="请输入账号"/>
            <sf:errors path="name"/>
        </div>
    </div>
    <div class="form-group">
        <label for="password" class="col-sm-2 col-sm-offset-2 control-label">密码：</label>
        <div class="col-sm-3">
                &lt;%&ndash;<sf:password path="password" type="password" id="password" name="password" class="form-control"&ndash;%&gt;
                &lt;%&ndash;placeholder="请输入密码"/>&ndash;%&gt;
                &lt;%&ndash;<sf:errors path="password"/>&ndash;%&gt;
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
</sf:form>--%>
<form method="post" enctype="multipart/form-data">
    <div>
        <label>profile picture</label>
        <input id="picture" name="picture" type="file" accept="image/png,image/jpeg, image/gif"/>
    </div>
    <div>
        <label>profile zip</label>
        <input id="zip" name="zip" type="file" accept="application/zip"/>
        <input type="submit" value="上传"/>
    </div>
</form>

</body>
</html>
