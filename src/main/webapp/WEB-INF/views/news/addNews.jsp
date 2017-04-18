<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/4/18
  Time: 19:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>addNews</title>

    <link href="/css/bootstrap.css" rel='stylesheet' type='text/css' />
    <link href="/css/bootstrap.min.css" rel="stylesheet" type="type/css"/>
    <link href="/css/style.css" rel="stylesheet" />
    <style type="text/css">
        h1{
            font-size: 32px;
            color:blue;
            margin-top: 20px;
            text-align: center;
        }
        .head{
            text-align: center;
            margin-top: 30px;
        }
    </style>
</head>
<body>
    <h1>添加公告</h1>
    <div class="head"  >
        <form role="form" class="form-horizontal" method="post" action="">
            <div class="form-group">
                <label for="newsTitle" class="contol-label col-md-2">Title</label>
                <div class="col-md-4">
                    <input type="text" class="form-control" name="newsTitle" id="newsTitle">
                </div></div>
            <div class="form-group">
                <label for="newsContent" class="contol-label col-md-2">Content</label>
                <div class="col-md-4">
                    <textarea rows="5" cols="40" name="newsContent" id="newscontent" placeholder="请输入公告内容" class="form-control"></textarea>
                </div></div>
            <div class="form-group">
            <input type="submit" class="btn btn-primary btn-lg"  value="发布">
            </div>
        </form>
    </div>

</body>
</html>
