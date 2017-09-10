<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="model.User" %>
<%@ page import="model.Book" %>
<%@ page import="model.Comment" %>

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
			ArrayList<Comment> comments=new ArrayList<Comment>();
			if(request.getAttribute("comments")!=null)
				comments=(ArrayList<Comment>)request.getAttribute("comments");
			Book b=new Book();
			if(request.getAttribute("book")!=null) b=(Book)request.getAttribute("book");
			Cookie[] cookies=null;
			cookies=request.getCookies();
			String username="";
			int userid=0;
			if(cookies!=null){
				for(int i=0;i<cookies.length;i++)
					if(cookies[i].getName().equals("uid")){
						userid=Integer.valueOf(cookies[i].getValue());
						for(int j=0;j<userlist.size();j++){
							User u=userlist.get(j);
							if(u.getId()==userid)
								username=u.getUsername();
						}
						if(username.equals("")){
							cookies[i].setMaxAge(0);
							response.addCookie(cookies[i]);
						}
					}
			}
			if(!username.equals("")){%>
				<div class="col-md-3" style="text-align:right;margin-top:7%;margin-left:3%"><font size="4">
					<a href="profile"><%=username %></a><br/></font>
					<a href="quitLogin">退出登录</a>
				</div>
			<%}else{%>
				<form method="post" action="userLogin" autocomplete=off 
					class="col-md-3" style="text-align:right;margin-top:5%;margin-left:5%">
					用户名：<input type="text" name="username" value="" style="margin-top:2px;"><br/>
					密码：<input type="password" name="password" style="margin-top:2px;"><br/>
					<input style="margin-top:2px;" type="submit" value="登录">
					<button style="margin-top:2px;margin-left:3px" onclick="location.replace("<%=path%>/register.jsp");">注册</button>
				</form>
			<%}%>
	</div>
	<nav class="navbar navbar-default row" role="navigation" style="text-align:center;background-color:#99CCFF;border:1px solid #99CCFF">
		<div class="navbar-header col-md-2">
			<a class="navbar-brand" href="index.jsp" style="">爱书平台</a>
		</div>
		<div>
			<ul class="nav navbar-nav col-md-10">
				<li class="col-md-2" style="border-left:1px dotted #EEEEEE"><a href="search?cate=1&page=0">经典名著</a></li>
				<li class="col-md-2" style="border-left:1px dotted #EEEEEE"><a href="search?cate=2&page=0">现代小说</a></li>
				<li class="col-md-2" style="border-left:1px dotted #EEEEEE"><a href="search?cate=3&page=0">教材教辅</a></li>
				<li class="col-md-2" style="border-left:1px dotted #EEEEEE"><a href="search?cate=4&page=0">励志读物</a></li>
				<li class="col-md-2" style="border-left:1px dotted #EEEEEE"><a href="search?cate=5&page=0">艺术美术</a></li>
				<li class="col-md-2" style="border-left:1px dotted #EEEEEE"><a href="search?cate=6&page=0">儿童文学</a></li>
			</ul>
		</div>
	</nav>
	<div class="row">
		<img class="img-thumbnail col-md-4" src="<%=path %>/img/<%=b.getCover() %>" style="margin:20px"/>
		<div class="col-md-7" style="text-align:right"><font size="8">
			<br/>
			<p style="text-align:center">《<%=b.getTitle() %>》</p>
			<br/></font>
			<font size="5"><p><%=b.getAuthor() %> 编著</p>
			<p><%=b.getPublisher() %> 出版</p>
			<br/><p>发布者描述：<%=b.getDescription() %></p><br/>
			<%if(b.getStatus()==0){%>
				<p>未借出</p>
				<%if(!username.equals("")){ %>
				<form action="borrowBook" method="post" autocomplete=off> 
					<input type="hidden" name="bookid" value="<%=b.getId() %>">
					<input type="hidden" name="userid" value="<%=userid %>">
					<input class="btn btn-lg" type="submit" value="借阅">
				</form>
				<%}
			}else{ %><p>已借出</p>
				<%if(b.getStatus()==userid){ %>
					<form action="returnBook" method="post" autocomplete=off> 
						<input type="hidden" name="bookid" value="<%=b.getId() %>">
						<input class="btn btn-lg" type="submit" value="归还">
					</form>
				<%}
			} %>
		</font></div>
	</div>
	<div class="row" style="margin:5%">
		<h2 class="col-md-12" style="text-align:center">评论</h2>
	</div>
		<%for(int i=0;i<comments.size();i++){
			Comment c=comments.get(i);
			for(int j=0;j<userlist.size();j++){
				if(userlist.get(j).getId()==c.getUserid()){%>
					<div class="row" style="border-top:2px dotted #99CCFF">
					<br/>
					<p class="col-md-4" style="text-align:center">
					<font size="5"><%=userlist.get(j).getUsername()%></font><br/>发布于<br/>
					<%=c.getTime() %></p>
					<p class="col-md-8"><%=c.getContent() %></p><br/><br/>
					</div>
					<%
					break;
				}
			}%>
		<%}%>
		<div class="row" style="padding:5%;border-top:2px dotted #99CCFF"><br/>
			<form class="col-md-12" style="text-align:right" action="postComment" method="post" autocomplete=off>
				<input type="hidden" name="userid" value="<%=userid %>">
				<input type="hidden" name="bookid" value="<%=b.getId() %>">
				<textarea name="content" rows="10" cols="150"></textarea><br/>
				<input type="submit" value="发表评论">
			</form>
		</div>
</div>
</body>
</html>
