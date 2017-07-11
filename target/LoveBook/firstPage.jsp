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
	</div>
	<div class="form">
		<form action="userLogin" method="post" id="login" hidden=true autocomplete=off>
			用户名：<input type="text" name="username" value=""><br/>
			密码：<input type="password" name="password"><br/>
			<input type="submit" onclick="remove();" value="登录">
			<button onclick="remove();return false;">取消</button> 
		</form>
		<form action="userRegister" method="post" id="register" hidden=true>
			用户名：<input type="text" name="username" value=""><br/>
			密码：<input type="password" name="password"><br/>
			确认密码：<input type="password" name="password_rep"><br/>
			<input type="submit" onclick="remove();" value="注册">
			<button onclick="remove();return false;">取消</button>
		</form>
		<form action="addBook" method="post" id="addbook" hidden=true>
			书名：<input type="text" name="title" value=""><br/>
			作者：<input type="text" name="author" value=""><br/>
			库存：<input type="text" name="stock_s" value=""><br/>
			价格：<input type="text" name="price_s" value=""><br/>
			<input type="submit" onclick="remove();" value="添加">
			<button onclick="remove();return false;">取消</button>
		</form>
		<form action="modBook" method="post" id="modbook" hidden=true>
			书本id：<input type="text" name="bookid_s" value=""><br/>
			价格：<input type="text" name="price_s" value=""><br/>
			现有库存：<input type="text" name="stock_s" value=""><br/>
			<input type="submit" onclick="remove();" value="修改">
			<button onclick="remove();return false;">取消</button>
		</form>
		<form action="delBook" method="post" id="delbook" hidden=true>
			书本id：<input type="text" name="bookid_s" value=""><br/>
			<input type="submit" onclick="remove();" value="删除">
			<button onclick="remove();return false;">取消</button>
		</form>
	</div>
	<div id="main">
	</div> 
</body>
</html>
