<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML>
<html>
<head>
    <base href="<%=basePath%>">
    <title>所有用户</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link href=./css/bootstrap.min.css" rel='stylesheet' type='text/css'/>
    <link href="/css/custom.css" rel="stylesheet" type="text/css"/>
</head>
<body>
<div class="searchDiv">
    <form class="" method="get" role="form">
        <div class="form-group">
        <select name="roleID" class="col-md-2">
            <option value="0">所有</option>
            <option value="1">老师</option>
            <option value="2">学生</option>
        </select>
        </div>
        <div class="form-group">
            <label role="label" class="control-label col-md-1" for="userId">学号:</label>
            <div class="col-md-2">
            <input type="text" name="userId" id="userId" class="form-control">
            </div>
        </div>
        <div class="form-group">
            <label role="label" class="control-label col-md-1" for="classId">班级:</label>
            <div class="col-md-2">
                <input type="text" name="classId" id="classId" class="form-control">
            </div>
        </div>
    </form>

</div>
<div class="container">
    <table class="table table-hover table-bordered" >
        <thead>
        <tr><td class="col-md-2">学号</td><td class="col-md-2">姓名</td><td class="col-md-3">专业</td><td class="col-md-3">班级</td><td class="col-md-2"><input type="checkbox" value="1" id="checkAll" onclick="checkAll()">全选</td>
        </tr></thead>
        <tbody>
        <tr><td>2013550336</td><td>朱义</td><td>计算机</td><td>1班</td><td><input type="checkbox" name="select"></td></tr>
        <tr><td>2013550337</td><td>潘定荣</td><td>软件</td><td>3班</td><td><input type="checkbox" name="select"></td></tr>
        </tbody>
    </table>
    <div class="function">
        <a class="btn btn-lg btn-primary " href="teacher/addStudent.jsp">添加学生</a>
        <a class="btn btn-lg btn-primary " href="deleteStuServlet">删除选中</a>
    </div>
</div>
<script type="text/javascript">
    function checkAll(){
        var a=document.getElementById("checkAll");
        var b=document.getElementsByName("select");
        if(a.checked==true){
            for(var i=0;i<b.length;i++){
                b[i].checked=true;
            }
        }else{
            for(var i=0;i<b.length;i++){
                b[i].checked=false;
            }
        }
    }
</script>
</body>
</html>