<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/4/18
  Time: 14:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>查看考试</title>
    <META content="text/html; charset=utf-8" http-equiv=Content-Type>
    <link rel="stylesheet" href="css/bootstrap.css">
    <link rel="stylesheet" href="css/style.css">
    <style type="text/css">
      .container{
          margin:20 20;
      }
      h1{
          font-size:30px;
          font-color:blue;
          text-align:center;
      }

    </style>
</head>
<body>
<h1 >Contest List</h1>
    <div class="container">
        <table class="table table-hover table-bordered" >
            <thead>
            <tr><td class="col-md1">Test.ID</td>
                <td class="col-md-2">考试名称</td>
                <td class="col-md-2">开始时间</td>
                <td class="col-md-2">封榜时间</td>
                <td class="col-md-2">结束时间</td>
                <td class="col-md-1">创建人</td>
                <td class="col-md-1">Authority</td>
                <td class="col-md-1"><a href="#">考试成绩</a></td>
                <td class="col-md-2"><input type="checkbox" value="1" id="checkAll" onclick="checkAll()">全选</td>
            </tr></thead>
            <tbody>
            <tr><td>10001</td>
                <td>程序设计考试</td>
                <td>2017-4-18 14:00;</td>
                <td>2017-4-18 17:30;</td>
                <td>2017-4-18 18:00;</td>
                <td>谢勇</td>
                <td>private</td>
                <td><a href="#">点击查看</a></td>
                <td><input type="checkbox" name="select"></td></tr>
            <tr><td>10001</td>
                <td>程序设计考试</td>
                <td>2017-4-18 14:00;</td>
                <td>2017-4-18 17:30;</td>
                <td>2017-4-18 18:00;</td>
                <td>xxx;</td>
                <td>public</td>
                <td><a href="#">点击查看</a></td>
                <td><input type="checkbox" name="select"></td></tr>
            </tbody>
        </table>
    <div class="function">
        <a class="btn btn-lg btn-primary " href="test/createTest" target="_top">创建新考试</a>
        <a class="btn btn-lg btn-primary " href="deleteStuServlet">删除选中记录</a>
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
