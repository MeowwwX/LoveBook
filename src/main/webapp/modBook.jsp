<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="model.book" %>

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
		网上书店后台管理系统
		<a href="quitLogin">退出登录</a>
		<a href="getData">返回主页</a>
		<a href="getUsers">用户管理</a>
		<a href="getBooks">书籍管理</a>
	</div>
	<div id="main">
		<%	book b=new book();
			if(request.getAttribute("book")!=null){
				b=(book)request.getAttribute("book"); %>
		<form action="modBook" method="post" autocomplete=off>
			<input type="hidden" name="bookid_s" value="<%=b.getId() %>">
			书名：<input type="text" name="title" value="<%=b.getTitle() %>"><br/><br/>
			作者：<input type="text" name="author" value="<%=b.getAuthor() %>"><br/><br/>
			价格：<input type="text" name="price_s" value="<%=String.format("%.2f",b.getPrice()) %>"><br/><br/>
			库存：<input type="text" name="stock_s" value="<%=b.getStock() %>"><br/><br/>
			<input type="submit" value="提交">
		</form>
		<%}
			if(request.getAttribute("book")==null){%>
		<form action="addBook" method="post" autocomplete=off>
			<input type="hidden" name="bookid_s" value="">
			书名：<input type="text" name="title" value=""><br/><br/>
			作者：<input type="text" name="author" value=""><br/><br/>
			价格：<input type="text" name="price_s" value=""><br/><br/>
			库存：<input type="text" name="stock_s" value=""><br/><br/>
			<input type="submit" value="提交">
		</form>
		<%} %>
	</div>
</body> 
</html>