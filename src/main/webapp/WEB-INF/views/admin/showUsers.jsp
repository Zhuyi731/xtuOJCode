<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE HTML>
<html>
<head>
    <base href="<%=basePath%>">
    <title>所有用户</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link href="/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    <link href="/css/custom.css" rel="stylesheet" type="text/css"/>
</head>
<body>
<div class="searchDiv">
    <sf:form method="post" role="form">
        <div class="form-group col-md-2 col-md-offset-1">
            <select class="form-control" name="roleId">
                <option value="-1">所有</option>
                <option value="0">管理员</option>
                <option value="1">老师</option>
                <option value="2">学生</option>
            </select>
        </div>
        <div class="form-group">
            <label role="label" class="control-label col-md-1" for="id">学号:</label>
            <div class="col-md-2">
                <input type="text" name="id" id="id" class="form-control">
            </div>
        </div>
        <div class="form-group">
            <label role="label" class="control-label col-md-1" for="classId">班级:</label>
            <div class="col-md-2">
                <input type="text" name="classId" id="classId" class="form-control">
            </div>
        </div>
        <div class="form-group col-md-1">
            <input type="submit" value="search" class="btn btn-primary form-control">
        </div>
    </sf:form>
</div>

<div class="container">
    <table class="table table-hover table-bordered">
        <thead>
        <tr>
            <td class="col-md-2">User.ID</td>
            <td class="col-md-2">User.name</td>
            <td class="col-md-2">Nickname</td>
            <td class="col-md-2">Class</td>
            <td class="col-md-2">Modify</td>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${vo}" var="entity" varStatus="index">
            <tr>
                <td>${entity.id}</td>
                <td>${entity.name}</td>
                <td>${entity.nickname}</td>
                <td>${entity.classId}</td>
                <td>
                    <button type="button" class="btn btn-primary"
                            onclick="setButtonName('${entity.id}','${entity.password}',${entity.roleId},'${entity.name}','${entity.nickname}','${entity.classId}','${entity.status}','${entity.email}','${entity.emailOpen}','${entity.qq}','${entity.qqOpen}','${entity.phone}','${entity.phoneOpen}');"
                            data-toggle="modal" data-target="#myModal">Enter To
                        Modify
                    </button>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <div class="function pull-right">
        <a class="btn btn-lg btn-primary " href="/admin/createNewUsers">添加学生</a>
    </div>
</div>
<div class="modal fade  " id="myModal" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel"
     aria-hidden="true">
    <div class="modal-dialog" style=" position: absolute; top: 0; bottom: 0; left: 0; right: 0; ">
        <div class="modal-content" style=" position: absolute; top: 0; bottom: 0; width: 100%;">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span>
                </button>
                <h4 id="title" align="center"></h4>
            </div>
            <%--modal-header--%>
            <div class="modal-body" align="center"
                 style="overflow-y: scroll;position: absolute;top:55px;bottom:65px;width: 100%; ">
                <sf:form action="/admin/modifyUserInfo/" class="form-horizontal" role="form" method="post">
                <div class="form-group">
                    <label class="control-label col-md-2 col-sm-2" for="modifyId">User.ID:</label>
                    <div class="col-md-4 col-sm-4">
                        <input type="text" class="form-control" name="id" id="modifyId">
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-md-2 col-sm-2" for="modifyRoleId">Role:</label>
                    <div class="col-md-4 col-sm-4">
                        <select class="form-control" name="roleId" id="modifyRoleId">
                            <option value="0" id="role0">管理员</option>
                            <option value="1" id="role1">老师</option>
                            <option value="2" id="role2">一般用户</option>
                        </select>
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-md-2 col-sm-2" for="modifyPassword">Password:</label>
                    <div class="col-md-4 col-sm-4">
                        <input type="text" class="form-control" name="password" id="modifyPassword">
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-md-2 col-sm-2" for="modifyName">Name:</label>
                    <div class="col-md-4 col-sm-4">
                        <input type="text" class="form-control" name="name" id="modifyName">
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-md-2 col-sm-2" for="modifyNickname">Nickname:</label>
                    <div class="col-md-4 col-sm-4">
                        <input type="text" class="form-control" name="nickname" id="modifyNickname">
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-md-2 col-sm-2" for="modifyClassId">Class Name:</label>
                    <div class="col-md-4 col-sm-4">
                        <input type="text" class="form-control" name="classId" id="modifyClassId">
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-md-2 col-sm-2" for="modifyStatus">Status:</label>
                    <div class="col-md-4 col-sm-4">
                        <input type="text" class="form-control" name="status" id="modifyStatus">
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-md-2 col-sm-2" for="modifyEmail">Email:</label>
                    <div class="col-md-4 col-sm-4">
                        <input type="text" class="form-control" name="status" id="modifyEmail">
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-md-2 col-sm-2">Email Open?:</label>
                    <div class="col-md-4 col-sm-4">
                        <input type="radio" name="emailOpen" id="modifyEmailOpenN" value="N">No
                        <input type="radio" name="emailOpen" id="modifyEmailOpenY" value="Y">Yes
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-md-2 col-sm-2" for="modifyQQ">QQ:</label>
                    <div class="col-md-4 col-sm-4">
                        <input type="text" class="form-control" name="status" id="modifyQQ">
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-md-2 col-sm-2">QQ Open?:</label>
                    <div class="col-md-4 col-sm-4">
                        <input type="radio" name="qqOpen" id="modifyQQOpenN" value="N">No
                        <input type="radio" name="qqOpen" id="modifyQQOpenY" value="Y">Yes
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-md-2 col-sm-2" for="modifyPhone">Phone:</label>
                    <div class="col-md-4 col-sm-4">
                        <input type="text" class="form-control" name="phone" id="modifyPhone">
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-md-2 col-sm-2">Phone Open?:</label>
                    <div class="col-md-4 col-sm-4">
                        <input type="radio" name="phoneOpen" id="modifyPhoneOpenN" value="N">No
                        <input type="radio" name="phoneOpen" id="modifyPhoneOpenY" value="Y">Yes
                    </div>
                </div>
            </div>
                <%--body--%>
            <div class="modal-footer" style=" position: absolute;width: 100%;bottom: 0; ">
                <input type="submit" class="btn btn-primary" value="Save Changes">
                <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                </sf:form>
            </div>
            <%--footer--%>
        </div>
        <%--modal-content--%>
    </div>
    <%--modal-dialog--%>
</div>
<%--modal--%>
<script src="/js/jquery.min.js"></script>
<script src="/js/bootstrap.min.js"></script>
<script>
    function setButtonName(id, password, roleId, name, nickname, classId, status, email, emailOpen, qq, qqOpen, phone, phoneOpen) {
        var title = document.getElementById("title");
        title.innerHTML = "#" + id + "  用户信息修改";

        var modifyId = document.getElementById("modifyId");
        var modifyPassword = document.getElementById("modifyPassword");
        var modifyName = document.getElementById("modifyName");
        var modifyNickname = document.getElementById("modifyNickname");
        var modifyStatus = document.getElementById("modifyStatus");
        var modifyClassId = document.getElementById("modifyClassId");
        var modifyEmail = document.getElementById("modifyEmail");
        var modifyQQ = document.getElementById("modifyQQ");
        var modifyPhone = document.getElementById("modifyPhone");

        modifyId.value = id;
        modifyPassword.value = password;
        modifyName.value = name;
        modifyNickname.value = nickname;
        modifyClassId.value = classId;
        modifyStatus.value = status;
        modifyEmail.value = email;
        modifyQQ.value = qq;
        modifyPhone.value = phone;


        //openStatus judge
        if (emailOpen == 'Y') {
            document.getElementById("modifyEmailOpenY").setAttribute("checked", "checked");
        } else {
            document.getElementById("modifyEmailOpenN").setAttribute("checked", "checked");
        }
        if (qqOpen == 'Y') {
            document.getElementById("modifyQQOpenY").setAttribute("checked", "checked");
        } else {
            document.getElementById("modifyQQOpenN").setAttribute("checked", "checked");
        }

        if (phoneOpen == 'Y') {
            document.getElementById("modifyPhoneOpenY").setAttribute("checked", "checked");
        } else {
            document.getElementById("modifyPhoneOpenN").setAttribute("checked", "checked");

        }
        //modifyStatus
        if (roleId == '0') {
            document.getElementById("role0").setAttribute("selected", "selected");
        } else if (roleId == '1') {
            document.getElementById("role1").setAttribute("selected", "selected");
        } else {
            document.getElementById("role2").setAttribute("selected", "selected");
        }


    }
</script>
</body>
</html>