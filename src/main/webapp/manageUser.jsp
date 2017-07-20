<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="model.user" %>
<%@ page import="model.profile" %>

<!DOCTYPE html>
<html>
<head>
	<%String path = request.getContextPath();%>
	<meta charset="utf-8">
	<link rel="shortcut icon" type="image/x-icon" href="<%=path%>/img/ico.ico" />
	<link rel="stylesheet" type="text/css" href="<%=path%>/css/style.css" />
	<title>网上书店</title>
</head>
<body style="background-image: url(<%=path%>/img/bg.png)">
	<%
	ArrayList<user> users=new ArrayList<user>();
	ArrayList<profile> profiles=new ArrayList<profile>();
	if(request.getAttribute("users")!=null){
		users=(ArrayList<user>)request.getAttribute("users");
	}
	if(request.getAttribute("profiles")!=null){
		profiles=(ArrayList<profile>)request.getAttribute("profiles");
	}
	%>
	<div id="title">
		网上书店后台管理系统
		<a href="quitLogin">退出登录</a>
		<a href="getData">返回主页</a>
		<a href="getUsers">用户管理</a>
		<a href="getBooks">书籍管理</a>
	</div>
	<div id="main" style="text-align:center"><br/><br/>
		<h1 style="width:1820px;margin:0">网上书店-用户管理</h1><br/>
		<br/><br/><table class="manage" border="0" cellspacing="0" cellpadding="0" style="width:1820px;margin:0;">
			<tr>
				<th>id</th><th>用户名</th><th>性别</th><th>电子邮箱</th><th>手机</th><th>地址</th><th>权限</th><th>提升为管理员</th><th>删除</th>
			</tr>
			<% for(int i=0;i<users.size();i++){%>
				<tr id="<%=i %>">
					<td><%=users.get(i).getId() %></td>
					<td><%=users.get(i).getUsername() %></td>
					<td><%
						if(profiles.get(i).getGender()==1) out.println("男");
						else out.println("女");
					%></td>
					<td><%=profiles.get(i).getMail() %></td>
					<td><%=profiles.get(i).getPhone() %></td>
					<td><%=profiles.get(i).getAddress() %></td>
					<td><%
						if(users.get(i).getIsAdmin()==1) out.println("管理员");
						else out.println("用户");
					%></td>
					<td><a href="promoteUser?userid=<%=users.get(i).getId() %>">提升为管理员</a></td>
					<td><a href="delUser?userid=<%=users.get(i).getId() %>">删除</a> 
				</tr>
			<%}%>
		</table>
	</div>
</body>
</html>
