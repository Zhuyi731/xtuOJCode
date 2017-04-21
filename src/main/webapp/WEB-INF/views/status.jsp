<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/4/18
  Time: 16:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Online Status</title>
    <link href="/css/bootstrap.css" rel='stylesheet' type='text/css' />
    <link href="/css/bootstrap.min.css" rel="stylesheet" type="type/css"/>
    <link href="/css/style.css" rel="stylesheet" />
    <style type="text/css">
        h1{
            text-align: center;
            color: blue;
            size: 30px;
        }
        .search{
            margin-top:20px;
            text-align: center;
        }
        thead{
            background-color: #4cae4c;
            color:white;
        }
    </style>
</head>
<body>
  <%@ include file="/WEB-INF/views/navigation.jsp"%>
    <h1 >Online Status</h1>
    <div class="search" >
        <form role="form" method="get" class="form-inline" >
            <div class="form-group">
                <label  for="proID" class="control-label col-md-1 col-sm-1">Pro.ID</label>
                <div class="col-md-offset-1 col-sm-offset-1">
                    <input type="text" class="form-control" name="proID" id="proID" placeholder="题目编号" >
                </div>
            </div>
            <div class="form-group">
                <label  for="username" class="control-label  col-md-1 col-sm-1">username</label>
                <div class="col-md-offset-2 col-sm-offset-2">
                    <input type="text" class="form-control" name="username" id="username" placeholder="用户名" >
                </div>
            </div>
            <div class="form-group">
                <label for="language" class="control-label ">Language</label>
                <select id="language" name="language" class="form-control col-sm-offset-1 col-md-offset-1">
                    <option value="0">All</option>
                    <option value="1">C</option>
                    <option value="2">C++</option>
                    <option value="3">Java</option>
                </select>
            </div>
            <div class="form-group">
                <label for="result" class="control-label ">Result</label>
                <select id="result" name="result" class="form-control col-md-offset-1 col-sm-offset-1">
                    <option value="0">All</option>
                    <option value="1">Accept</option>
                    <option value="2">Presentation Error</option>
                    <option value="3">Wrong Answer</option>
                    <option value="4">Time Limit Error</option>
                    <option value="5">Memory Exceed Error</option>
                    <option value="6">Output Error</option>
                    <option value="7">Runtime Error</option>
                    <option value="8">Compile Error</option>
                    <option value="9">Compiling</option>
                    <option value="10">Waiting</option>
                    <option value="11">Running and Judging</option>
                </select>
            </div>
        <div class="form-group">
                <input type="submit"  value="Search" class="btn btn-info col-md-offset-1 col-sm-offset-1">
        </div>
        </form>
    </div>

    <div class="status">
        <table class="table table-bordered table-hover">
            <thead >
            <tr><td class="col-md-offset-1 col-md-1">运行编号</td>
                <td class="col-md-1">用户</td>
                <td class="col-md-1">问题编号</td>
                <td class="col-md-1">结果</td>
                <td class="col-md-1">内存</td>
                <td class="col-md-1">耗时</td>
                <td class="col-md-1">语言</td>
                <td class="col-md-1">代码长度</td>
                <td class="col-md-2">提交时间</td>
                <td class="col-md-1">判题机</td></tr>
            </thead>
            <tbody>
            <tr><td>1013</td>
                <td>admin</td>
                <td>panshuai</td>
                <td><span class="accept">accept</span></td>
                <td>0</td>
                <td>0</td>
                <td>C</td>
                <td>120B</td>
                <td>2016-12-23 10:51:55</td>
                <td>admin</td></tr>
            <tr><td>1013</td>
                <td>admin</td>
                <td>panshuai</td>
                <td><span class="accept">AC</span></td>
                <td>0</td>
                <td>0</td>
                <td>C</td>
                <td>120B</td>
                <td>2016-12-23 10:51:55</td>
                <td>admin</td></tr>
            <tr><td>1013</td>
                <td>admin</td>
                <td>panshuai</td>
                <td><span class="accept">WA</span></td>
                <td>0</td>
                <td>0</td>
                <td>C</td>
                <td>120B</td>
                <td>2016-12-23 10:51:55</td>
                <td>admin</td></tr>
            <tr><td>1013</td>
                <td>admin</td>
                <td>panshuai</td>
                <td><span class="accept">TLE</span></td>
                <td>0</td>
                <td>0</td>
                <td>C</td>
                <td>120B</td>
                <td>2016-12-23 10:51:55</td>
                <td>admin</td></tr>
            </tbody>
        </table>

    </div>
</body>
</html>
