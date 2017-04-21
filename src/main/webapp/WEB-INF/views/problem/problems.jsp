<%@ page pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>题库</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link href="/css/bootstrap.css" rel='stylesheet' type='text/css'/>
    <link href="/css/bootstrap.min.css" rel='stylesheet' type='text/css'/>
    <style type="text/css">
        .container{
            margin:50px;
        }
        .pager{
            padding: 0px 150px;
        }
        .pageNo{
            padding:0px 30px;
            margin:20px 0px;
        }
        .search{
            text-align:center;
            margin-right:60px ;
        }
    </style>
</head>
<body>
<%@ include file="/WEB-INF/views/navigation.jsp" %>
<div class="search">
        <form role="form" method="get" class="form-inline" >
            <div class="form-group">
                <label  for="proID" class="control-label col-md-2 col-sm-2">Pro.ID</label>
                <div class="col-md-offset-1 col-sm-offset-1">
                    <input type="text" class="form-control" name="proID" id="proID" placeholder="题目编号" >
                </div>
            </div>
            <div class="form-group">
                <label  for="title" class="control-label  col-md-2 col-sm-2">Title</label>
                <div class="col-md-offset-2 col-sm-offset-2">
                    <input type="text" class="form-control" name="title" id="title" placeholder="题目名" >
                </div>
            </div>
            <div class="form-group">
                <div class=" col-md-offset-4 col-sm-offset-4 col-md-2">
                <input type="submit" class="btn btn-primary btn-lg" value="搜索">
                </div>
            </div>
        </form>
    </div>
<div class="container" >
    <div class="page">
        <ul class="pager">
            <li class="previous"><a href="#">&laquo;上一页</a></li>
            <li class="pageNo" ><a href="#">1</a></li>
            <li class="pageNo"><a href="#">2</a></li>
            <li class="pageNo"><a href="#">3</a></li>
            <li class="pageNo"><a href="#">4</a></li>
            <li class="pageNo"><a href="#">5</a></li>
            <li class="next"><a href="#">下一页&raquo;</a></li>
        </ul>
    </div>
    <div class="problems">
        <table class="table table-hover" style="width: 1000px;margin: 30px 100px ">
            <thead>
            <tr>
                <th class="col-md-2">ID</th>
                <th class="col-md-6">Title</th>
                <th class="col-md-2">accept/submit</th>
                <th class="col-md-2">Ratio</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <th><a href="/problem/proDetail/${entity.problemId}">${entity.problemId}</a></th>
                <th><a href="/problem/proDetail/${entity.problemId}">${entity.title}</a></th>
                <th>${entity.ACTotal}/${entity.SubmitTotal}</th>
                <th>...</th>
            </tbody>
        </table>
    </div>
</div>

<%@ include file="/WEB-INF/views/copyright.html" %>
</body>
</html>
