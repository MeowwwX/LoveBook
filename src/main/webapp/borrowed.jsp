<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="model.User"%>
<%@ page import="model.Book" %>

<!DOCTYPE html>
<html>
<head>
	<%String path = request.getContextPath();%>
	<meta charset="utf-8">
	<link rel="shortcut icon" type="image/x-icon" href="<%=path%>/img/ico.ico" />
	<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
	<script src="https://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<title>爱书平台</title>
</head>
<body>
<div class="container" style="width:68%;margin-left:15%;background-color:#EEEEEE;min-height:980px">
	<div class="row">
		<h1 class="col-md-7" style="margin:5%">LoveBook爱书图书分享交流平台</h1>
		<%
			ArrayList<User> userlist = new ArrayList<User>();
			if(request.getAttribute("users")!=null)
				userlist=(ArrayList<User>)request.getAttribute("users");
			ArrayList<Book> books=new ArrayList<Book>();
			if(request.getAttribute("books")!=null)
				books=(ArrayList<Book>)request.getAttribute("books");
			Cookie[] cookies=null;
			cookies=request.getCookies();
			User p=new User();
			int isAdmin=0;
			String username="";
			int userid=0;
			if(cookies!=null){
				for(int i=0;i<cookies.length;i++)
					if(cookies[i].getName().equals("uid")){
						userid=Integer.valueOf(cookies[i].getValue());
						for(int j=0;j<userlist.size();j++){
							User u=userlist.get(j);
							if(u.getId()==userid){
								username=u.getUsername();
								p=u;
								isAdmin=u.getIsAdmin();
							}
						}
						if(username.equals("")){
							cookies[i].setMaxAge(0);
							response.addCookie(cookies[i]);
						}
					}
			}
			if(!username.equals("")){%>
				<div class="col-md-3" style="text-align:right;margin-top:7%;margin-left:3%"><font size="4">
					<a href="#"><%=username %></a><br/></font>
					<a href="quitLogin">退出登录</a>
				</div>
			<%}else response.sendRedirect("index");%>
	</div>
	<br/>
	<div class="row" style="border-top:20px solid #000066">
	<br/>
	<br/>
	<br/>
	<div class="col-md-3" style="text-align:center"><font size="4">
		<ul class="list-group">
    		<li class="list-group-item"><a href="profile">个人资料</a></li>
    		<li class="list-group-item"><a href="getBorrowed?userid=<%=userid %>">已借阅书籍<a></li>
    		<li class="list-group-item"><a href="getPublished?userid=<%=userid %>">已发布书籍<a></li>
    		<li class="list-group-item"><a href="publish">发布书籍<a></li>
    		<%if(isAdmin!=0) {%>
    			<li class="list-group-item"><a href="manageBook">管理书籍</a></li>
    			<li class="list-group-item"><a href="manageUser">管理用户</a></li>
    		<%} %>
    		<li class="list-group-item"><a href="index.jsp">返回主页<a></li>
		</ul>
	</font></div>
	<div class="col-md-9">
		<%int i;
		for(i=0;i<books.size();){
			if(i%3==0){%><div class="row"><%}%>
			<a href="getSpecificBook?bookid=<%=books.get(i).getId() %>" class="col-md-4">
				<img class="img-thumbnail imt-responsive" src="<%=path %>/img/<%=books.get(i).getCover() %>"/> 
				<p><font size="4"><%=books.get(i).getTitle() %></font></p>
			</a> 
			<%i++;
			if(i%3==0){%></div><%}
		}
		if(i%3!=0){%></div><%}%>
	</div>
	</div>
</div>
</body>
</html>
