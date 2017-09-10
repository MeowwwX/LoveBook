<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="model.Book" %>
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
	ArrayList<Book> books=new ArrayList<Book>();
	if(request.getAttribute("books")!=null){
		books=(ArrayList<Book>)request.getAttribute("books");
	}	
	ArrayList<User> userlist = new ArrayList<User>();
	if(request.getAttribute("users")!=null){
		userlist=(ArrayList<User>)request.getAttribute("users");
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
		<h1 style="width:1820px;margin:0">网上书店-书籍管理</h1><br/>
		<br/><br/><table class="manage" border="0" cellspacing="0" cellpadding="0" style="width:1820px;margin:0;">
			<tr>
				<th>id</th><th>书名</th><th>类型</th><th>作者</th><th>出版社</th><th>发布者</th><th>状态</th><th>修改</th><th>删除</th>
			</tr>
			<% for(int i=0;i<books.size();i++){%>
				<tr id="<%=i %>">
					<td id="id<%=i %>"><%=books.get(i).getId() %></td>
					<td><%=books.get(i).getTitle() %></td>
					<td><%=books.get(i).transCategory() %>
					<td><%=books.get(i).getAuthor() %></td>
					<td><%=books.get(i).getPublisher() %></td>
					<td><%
						for(int j=0;j<userlist.size();j++)
							if(userlist.get(j).getId()==books.get(i).getOwner()){
								out.println(userlist.get(j).getUsername());
								break; 
							}
						%>
					</td>
					<td>
					<%if(books.get(i).getStatus()==0)%>未借出
					<%if(books.get(i).getStatus()!=0) {%>已由 <%
					for(int j=0;j<userlist.size();j++)
						if(userlist.get(j).getId()==books.get(i).getStatus()){
							out.println(userlist.get(j).getUsername());
							break;
						}
					%>借阅<%} %></td>
					<td><a href="manageSpecificBook?bookid=<%=books.get(i).getId() %>">修改</a></td>
					<td><a href="delBook?bookid_s=<%=books.get(i).getId() %>">删除</a> 
				</tr>
			<%}%>
		</table>
	</div>
</body>
</html>
