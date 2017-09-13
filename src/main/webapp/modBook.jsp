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
	<title>
		爱书图书分享交流平台</title>
	<script src="<%=path%>/js/top.js"></script>
</head>
<body style="background-image: url(<%=path%>/img/bg.png)">
	<div id="title">
		爱书平台后台管理系统
		<a href="quitLogin">退出登录</a>
		<a href="index">返回主页</a>
		<a href="getManage?manage=user">用户管理</a>
		<a href="getManage?manage=book">书籍管理</a>
	</div>
	<div id="main">
		<%	Book b=new Book();
			if(request.getAttribute("book")!=null){
				b=(Book)request.getAttribute("book"); %>
		<form action="modBook" method="post" autocomplete=off>
			<input type="hidden" name="bookid" value="<%=b.getId() %>">
			类型：<select name="category" style="width:170px">
					<option value="经典名著">经典名著</option>
					<option value="现代小说">现代小说</option>
					<option value="教材教辅">教材教辅</option>
					<option value="励志读物">励志读物</option>
					<option value="艺术美术">艺术美术</option>
					<option value="儿童文学">儿童文学</option>
			</select><br/><br/>
			书名：<input type="text" name="title" value="<%=b.getTitle() %>"><br/><br/>
			作者：<input type="text" name="author" value="<%=b.getAuthor() %>"><br/><br/>
			出版社：<input type="text" name="publisher" value="<%=b.getPublisher() %>"><br/><br/>
			描述：<textarea name="description" rows="5" cols="20"><%=b.getDescription() %></textarea>
			<br/>
			<input type="submit" value="修改">
		</form>
		<%}%>
	</div>
</body> 
</html>