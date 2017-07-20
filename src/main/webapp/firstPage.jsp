<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<!DOCTYPE html>
<html>
<head>
	<%String path = request.getContextPath();%>
	<meta charset="utf-8">
	<link rel="shortcut icon" type="image/x-icon" href="<%=path%>/img/ico.ico" />
	<link rel="stylesheet" type="text/css" href="<%=path%>/css/style.css" />
	<title>网上书店</title>
	<script src="<%=path%>/js/top.js"></script>
</head>
<body style="background-image: url(<%=path%>/img/bg.png)">
	<div id="title">
		我的网上书店
		<%@ include file="judgeLogin.jsp"%>		
		<a href="" onclick="sch();return false;">搜索</a>
		<a href="" onclick="publish();return false">发布书籍</a>
	</div>
	<div class="form">
		<form action="userLogin" method="post" id="login" hidden=true autocomplete=off>
			用户名：<input type="text" name="username" value=""><br/>
			密码：<input type="password" name="password"><br/>
			<input type="submit" onclick="remove();" value="登录">
			<button onclick="remove();return false;">取消</button> 
		</form>
		<form action="userRegister" method="post" id="register" hidden=true autocomplete=off>
			用户名：<input type="text" name="username" value=""><br/>
			密码：<input type="password" name="password"><br/>
			确认密码：<input type="password" name="password_rep"><br/>
			<input type="submit" onclick="remove();" value="注册">
			<button onclick="remove();return false;">取消</button>
		</form>
		<form action="getData" method="post" id="search" hidden=true autocomplete=off>
			类型：<select name="category">
				<option value="All">All</option>
				<option value="Example">Example</option>
			</select><br/>
			书名：<input type="text" name="title" value=""><br/>
			作者：<input type="text" name="author" value=""><br/>
			出版社：<input type="text" name="publisher" value=""><br/>
			<input type="submit" onclick="remove();" value="搜索"> 
			<button onclick="remove();return false;">取消</button>
		</form>
		<form action="publishBook" method="post" id="addbook" hidden=true>
			<input type="hidden" name="userid" value="<%=userid %>">
			类型：<select name="category" style="width:170px">
				<option value="Example">Example</option>
			</select><br/>
			书名：<input type="text" name="title" value=""><br/> 
			作者：<input type="text" name="author" value=""><br/> 
			出版社：<input type="text" name="publisher" value=""><br/><br/>
			描述：<textarea name="description" rows="5" cols="20"></textarea>
			<br/>
			<input type="submit" onclick="remove();" value="添加">
			<button onclick="remove();return false;">取消</button>
		</form>
	</div> 
	<div id="main">
		<%@ include file="showBooks.jsp"%>
	</div> 
</body> 
</html>
