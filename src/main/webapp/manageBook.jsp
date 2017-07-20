<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="model.book" %>

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
	ArrayList<book> books=new ArrayList<book>();
	if(request.getAttribute("books")!=null){
		books=(ArrayList<book>)request.getAttribute("books");
	}
	%>
	<div id="title">
		网上书店后台管理系统
		<a href="quitLogin">退出登录</a>
		<a href="getData">返回主页</a>
		<a href="getUsers">用户管理</a>
		<a href="getBooks">书籍管理</a>
		<a href="modBook.jsp">添加书籍</a>
	</div>
	<div id="main" style="text-align:center"><br/><br/>
		<h1 style="width:1820px;margin:0">网上书店-书籍管理</h1><br/>
		<br/><br/><table class="manage" border="0" cellspacing="0" cellpadding="0" style="width:1820px;margin:0;">
			<tr>
				<th>id</th><th>书名</th><th>作者</th><th>价格</th><th>库存</th><th>修改</th><th>删除</th>
			</tr>
			<% for(int i=0;i<books.size();i++){%>
				<tr id="<%=i %>">
					<td id="id<%=i %>"><%=books.get(i).getId() %></td>
					<td><%=books.get(i).getTitle() %></td>
					<td><%=books.get(i).getAuthor() %></td>
					<td><%=books.get(i).getPrice() %></td>
					<td><%=books.get(i).getStock() %></td>
					<td><a href="getSpecificBook?bookid=<%=books.get(i).getId() %>&manage=1">修改</a></td>
					<td><a href="delBook?bookid_s=<%=books.get(i).getId() %>">删除</a> 
				</tr>
			<%}%>
		</table>
	</div>
</body>
</html>
