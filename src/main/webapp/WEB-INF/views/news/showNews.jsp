<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/4/18
  Time: 18:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE HTML>
<html>
<head>
    <title>公告</title>
    <META content="text/html; charset=utf-8" http-equiv=Content-Type>
    <link href="/css/bootstrap.css" rel='stylesheet' type='text/css' />
    <link href="/css/bootstrap.min.css" rel="stylesheet" type="type/css"/>
    <link href="/css/style.css" rel="stylesheet" />
    <style type="text/css">
        thead{
            background-color:#03a9f4;
        }
    </style>
</head>
<body>
    <div class="head">
        <h1>公告</h1>
    </div>
    <div class="formdiv">
        <table class="table table-bordered table-hover">
            <thead><tr>
                <td>ID</td>
                <td>Title</td>
                <td>Description</td>
                <td>Data</td>
                <td>Status</td>
                <td>Edit</td>
                <td><input type="checkbox" value="1" id="checkAll" onclick="checkAll()">全选</td></td>
            </tr></thead>
            <tbody><tr>
                <td>100001</td>
                <td>asdasd</td>
                <td>a123213</td>
                <td>2017-7-14 2:10:20</td>
                <td>展示</td>
                <td><a href="news/editNews">Edit</a></td>
                <td><input type="checkbox" name="select"></td></td></tr>
            <tr>
                <td>100001</td>
                <td>asdasd</td>
                <td>a123213</td>
                <td>不展示</td>
                <td>2017-7-14 2:10:20</td>
                <td><a href="news/editNews">Edit</a></td>
                <td><input type="checkbox" name="select"></td></td>
            </tr></tbody>
        </table>
    </div>
    <div class="function pull-right">
        <a class="btn btn-lg btn-primary " href="news/addNews" >添加公告</a>
        <a class="btn btn-lg btn-primary " href="deleteStuServlet">删除选中记录</a>
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
