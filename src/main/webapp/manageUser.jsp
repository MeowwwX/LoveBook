<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="model.User" %>

<!DOCTYPE html>
<html>
<head>
	<%String path = request.getContextPath();%>
	<meta charset="utf-8">
	<link rel="shortcut icon" type="image/x-icon" href="<%=path%>/img/ico.ico" />
	<link rel="stylesheet" type="text/css" href="<%=path%>/css/style.css" />
	<title>
		爱书图书分享交流平台</title>
</head>
<body style="background-image: url(<%=path%>/img/bg.png)">
	<%
	ArrayList<User> users=new ArrayList<User>();
	if(request.getAttribute("users")!=null){
		users=(ArrayList<User>)request.getAttribute("users");
	}
	%>
	<div id="title">
		爱书平台后台管理系统
		<a href="quitLogin">退出登录</a>
		<a href="index">返回主页</a>
		<a href="getManage?manage=user">用户管理</a>
		<a href="getManage?manage=book">书籍管理</a>
	</div> 
	<div id="main" style="text-align:center"><br/><br/>
		<h1 style="width:1820px;margin:0">网上书店-用户管理</h1><br/>
		<br/><br/><table class="manage" border="0" cellspacing="0" cellpadding="0" style="width:1820px;margin:0;">
			<tr>
				<th>id</th><th>用户名</th><th>性别</th><th>电子邮箱</th><th>手机</th><th>权限</th><th>修改</th><th>删除</th>
			</tr>
			<% for(int i=0;i<users.size();i++){%>
				<tr id="<%=i %>">
					<td><%=users.get(i).getId() %></td>
					<td><%=users.get(i).getUsername() %></td>
					<td><%
						if(users.get(i).getGender()==1) out.println("男");
						else out.println("女");
					%></td>
					<td><%=users.get(i).getMail() %></td>
					<td><%=users.get(i).getPhone() %></td>
					<td><%
						if(users.get(i).getIsAdmin()==1) out.println("管理员");
						else out.println("用户");
					%></td>
					<td><a href="getSpecificUser?userid=<%=users.get(i).getId() %>&manage=1">修改</a></td>
					<td><a href="delUser?userid=<%=users.get(i).getId() %>">删除</a> 
				</tr>
			<%}%>
		</table>
	</div>
</body>
</html>
