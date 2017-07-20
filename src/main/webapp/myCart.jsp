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
		<%if(username.equals("")) 
			response.sendRedirect("getData"); %>
		<a href="getData">返回主页</a>
	</div>
	<div id="main"> 
		<%@ include file="showCart.jsp"%>
	</div>
</body> 
</html>
