<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="model.User" %>
<%@ page import="model.Book" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<title>LoveBook图书分享交流平台</title>
</head>
<body>
	<%	
	ArrayList<User> userlist = new ArrayList<User>();
	if(request.getAttribute("users")!=null){
		userlist=(ArrayList<User>)request.getAttribute("users");
	}
	Cookie[] cookies=null;
	cookies=request.getCookies();
	String username="";
	User user=new User("","");
	int admin=0;
	int userid=0;
	if(cookies!=null){
		for(int i=0;i<cookies.length;i++)
			if(cookies[i].getName().equals("uid")){
				userid=Integer.valueOf(cookies[i].getValue());
				for(int j=0;j<userlist.size();j++){
					User u=userlist.get(j);
					if(u.getId()==userid){
						username=u.getUsername();
						admin=u.getIsAdmin();
						user=u;
					}
				}
				if(username.equals("")){
					cookies[i].setMaxAge(0);
					response.addCookie(cookies[i]);
				}
			}
	}
	if(!username.equals("")) out.println("<p>logged in as "+username+".</p>");
	else out.println("<p>not logged in.</p>");
	ArrayList<Book> books = new ArrayList<Book>();
	if(request.getAttribute("books")!=null){
		books=(ArrayList<Book>)request.getAttribute("books");
	}
 %>
 	<p><%=books.size() %> books found</p>
 	<h3>Test of login</h3>
 	<form action="userLogin" method="post">
 		username:<input type="text" name="username" value=""><br/>
 		password:<input type="password" name="password" value=""><br/>
 		<input type="submit" name="登录">
 	</form>
 	<h3>Test of register</h3>
 	<form action="userRegister" method="post">
 		username:<input type="text" name="username" value=""><br/>
 		password:<input type="password" name="password" value=""><br/>
 		repeat:<input type="password" name="password_rep" value=""><br/>
 		<input type="submit" name="登录">
 	</form>
 	<h3>Test of quitLogin</h3>
 	<a href="quitLogin">退出登录</a>
 	<h3>Test of publishBook</h3>
 	<form action="publishBook" method="post">
 		<input type="hidden" name="userid" value="<%=userid %>"><br/>
 		<select name="category">
 			<option value="Example">Example</option>
 		</select><br/>
 		title:<input type="text" name="title" value=""><br/>
 		author:<input type="text" name="author" value=""><br/>
 		publisher:<input type="text" name="publisher" value=""><br/>
 		description:<input type="text" name="description" value=""><br/>
 		<input type="submit" value="提交">
 	</form>
 	<h3>Test of modifyProfile</h3>
 	<form action="modifyProfile" method="post">
 		<input type="hidden" name="uid" value="<%=userid %>"><br/>
 		<input type="password" name="password" value=""><br/>
 		<input type="password" name="password_rep" value=""><br/>
 		<select name="gender">
 			<option value="male">male</option>
 			<option value="female"
 			<% if(user.getGender()==0) out.println("selected=\"selected\""); %>
 			>female</option>
 		</select><br/>
 		<input type="text" name="mail" value="<%=user.getMail() %>"><br/>
 		<input type="text" name="phone" value="<%=user.getPhone() %>"><br/>
 		<input type="text" name="bio" value="<%=user.getBio() %>"><br/>
 		<input type="submit" value="提交">
 	</form>
 	<h3>Test of searchBook</h3>
 	<form action="getData" method="post">
 		category:<select name="category">
 			<option value="All">All</option>
 			<option value="Example">Example</option>
 		</select><br/>
 		title:<input type="text" name="title" value=""><br/>
 		author:<input type="text" name="author" value=""><br/>
 		publisher:<input type="text" name="publisher" value=""><br/>
 		<input type="submit" value="搜索">
 	</form>
</body>
</html>