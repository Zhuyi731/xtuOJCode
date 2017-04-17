<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<html>
<body>
<%--使用url标签变量1--%>
<s:url var="indexUrl" value="/index" scope="request"/>

<%--使用url标签变量设置变量参数1--%>
<s:url var="indexUrl1" value="/index/{username}" scope="request">
    <s:param name="username" value="panshuai"/>
    <s:param name="max" value="10"/>
    <s:param name="count" value="10"/>
</s:url>
<%--国际化--%>
<h1><s:message code="welcome.welcome"/></h1>
<h2>Hello panshuai!</h2>
<sf:form commandName="picture" method="post" enctype="multipart/form-data">
    <label>profile picture</label>
    <input path="picture" type="file"/>
    <input type="submit" value="上传"/>
</sf:form>

<%--使用url标签变量2--%>
<a href="${indexUrl}">index page</a>
<a href="${indexUrl1}">index page</a>
</body>
</html>
