<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="model.Book" %>

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
		<a href="getData">返回主页</a>
	</div>
	<div id="main">
		<%
			Book b=new Book();
			if(request.getAttribute("book")!=null) b=(Book)request.getAttribute("book");
		%>
		<div class="book">
			<img src="<%=path %>/img/<%=String.valueOf(b.getId()) %>.png" class="cover" />
			<div class="describe">
				<p class="bookname"><%=b.getTitle() %></p>
				<p class="category" style="font-size:24px">类型：<%=b.transCategory() %></p>
				<p class="author" style="font-size:24px">作者：<%=b.getAuthor() %></p>
				<p class="price" style="font-size:24px">出版社：<%=b.getPublisher() %></p>
				<p class="status" style="font-size:24px">状态：<%=b.transStatus() %></p> 
				<p class="stock" style="font-size:24px">描述：<%=b.getDescription() %></p>
			</div>
			<%if(userid!=0){ %>
			<form class="cart" action="borrowBook" method="post" autocomplete=off> 
				<input type="hidden" name="bookid_s" value="<%=b.getId() %>">
				<input type="hidden" name="userid_s" value="<%=userid %>">
				<input type="submit" value="租借">
			</form>
			<%} %>
		</div>
	</div>
</body> 
</html>