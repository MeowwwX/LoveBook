<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="model.User"%>
<%@ page import="model.Book" %>

<!DOCTYPE html>
<html>
<head>
	<%String path = request.getContextPath();%>
	<meta charset="utf-8">
	<link rel="shortcut icon" type="image/x-icon" href="<%=path%>/img/ico.ico" />
	<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
	<script src="https://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<title>爱书平台</title>
</head>
<body>
<div class="container" style="width:68%;margin-left:15%;background-color:#EEEEEE;min-height:980px">
	<div class="row">
		<h1 class="col-md-7" style="margin:5%">LoveBook爱书图书分享交流平台</h1>
	</div>
	<br/><br/><br/><br/><br/>
	<div class="row">
		<form method="post" action="userRegister" autocomplete=off 
			class="col-md-7" style="text-align:right;margin-top:5%;margin-left:5%">
			用户名：　<input type="text" name="username" value="" style="margin-top:2px;width:250px;"><br/><br/>
			密码：　　<input type="password" name="password" style="margin-top:2px;width:250px;"><br/><br/>
			确认密码：<input type="password" name="password_rep" style="margin-top:2px;width:250px;"><br/><br/>
			<input class="btn" style="margin-top:2px;" type="submit" value="注册">
			<button class="btn" style="margin-top:2px;margin-left:3px" onclick="location.replace('<%=path %>/index.jsp');return false;">返回主页</button>
		</form>、
	</div>
</div>
</body>
</html>
