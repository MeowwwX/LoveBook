<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="model.User" %>

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
	<div id="main" style="text-align:left">
		<%
			User p=new User();
			if(request.getAttribute("User")!=null) p=(User)request.getAttribute("User");
		%>
		<br/><br/>
		<h2><%=username %>的个人资料</h2>
		<br/><br/>
		<div class="profile">
			<form class="profile" action="modifyProfile" method="post" autocomplete=off style="text-align:left;">
				<input type="hidden" name="id" value="<%=p.getId() %>">
				密码：　　<input type="password" name="password" value="">
				确认密码：<input type="password" name="password_rep" value="">
				（若不需要修改密码以上两项请留空）
				性别：　　<select name="gender">
					<option value="male">男</option>
					<option value="female" <%
						if(p.getGender()==0) out.println("selected=\"selected\"");
					%>>女</option>
				</select><br/><br/>
				电子邮箱：<input type="text" name="mail" value="<%=p.getMail() %>"><br/><br/>
				手机：　　<input type="text" name="phone" value="<%=p.getPhone() %>"><br/><br/>
				个人介绍：<br/><br/><textarea name="bio" rows="5" cols="100"><%=p.getBio() %></textarea><br/><br/>
				<input type="submit" value="提交修改"> 
			</form>
		</div>
	</div>
</body> 
</html>