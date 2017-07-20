<%@ page import="java.util.ArrayList"%>
<%@ page import="model.User"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%
	ArrayList<User> userlist = new ArrayList<User>();
	if(request.getAttribute("users")!=null){
		userlist=(ArrayList<User>)request.getAttribute("users");
	}
	Cookie[] cookies=null;
	cookies=request.getCookies();
	String username="";
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
					}
				}
				if(username.equals("")){
					cookies[i].setMaxAge(0);
					response.addCookie(cookies[i]);
				}
			}
	}
	if(!username.equals("")){
		out.println("<a href=\"quitLogin\">退出登录</a><a href=\"getSpecificUser?userid="+String.valueOf(userid)+"\">"+username+"</a>");
	if(admin==1)
		out.println("<a href=\"getBooks\" >管理</a>");
	}else{
		out.println("<a href=\"\" onclick=\"register();return false;\">注册</a><a href=\"\" onclick=\"login();return false;\">登录</a>");
		}
%>