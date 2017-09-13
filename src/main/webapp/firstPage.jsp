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
			int cate=0;
			if(request.getAttribute("cate")!=null) cate=(Integer)request.getAttribute("cate");
			int pageNumber=0;
			if(request.getAttribute("page")!=null) pageNumber=(Integer)request.getAttribute("page");
			ArrayList<User> userlist = new ArrayList<User>();
			if(request.getAttribute("users")!=null)
				userlist=(ArrayList<User>)request.getAttribute("users");
			ArrayList<Book> books = new ArrayList<Book>();
			if(request.getAttribute("books")!=null)
				books=(ArrayList<Book>)request.getAttribute("books");
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
					<button style="margin-top:2px;margin-left:3px" onclick="location.replace('<%=path %>/register.jsp');return false;">注册</button>
				</form>、
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
	<div class="books" style="text-align:center">
	<%
		int head=12*pageNumber;
		int tail=head+12;
		if(books.size()<tail) tail=books.size();
		while(head<tail){
			if(head%4==0){%><div class="row"><%}%>
			<a href="getSpecificBook?bookid=<%=books.get(head).getId() %>" class="col-md-3">
				<img class="img-thumbnail imt-responsive" src="<%=path %>/img/<%=books.get(head).getCover() %>"/> 
				<p><font size="4"><%=books.get(head).getTitle() %></font></p>
			</a>
			<%head++;
			if(head%4==0){%></div><%}
		}
		if(head%4!=0){%></div><%}
	%>
	<ul class="pagination pagination-lg" style="text-align:center">
	<%if(pageNumber!=0){ %>
    	<li><a href="search?cate=<%=cate%>&page=<%=pageNumber-1%>">&laquo;</a></li>
    <%}else{ %>
    	<li class="disabled"><a href="#">&laquo;</a>
    
	<%}for(int i=0;i<(books.size()+11)/12;i++){
		if(i==pageNumber){%>
			<li class="active"><a href="#"><%=i+1 %></a></li>
		<%}else{%>
			<li><a href="search?cate=<%=cate%>&page=<%=i%>"><%=i+1 %></a></li>
		<%}
	}
	if(tail==books.size()){%>
		<li class="disabled"><a href="#">&raquo;</a></li>
	<%}else{%>
    	<li><a href="search?cate=<%=cate%>&page=<%=pageNumber+1%>">&raquo;</a></li>
	<%}%>
	</ul>
	</div>
</div>
</body>
</html>
