<%@ page import="java.util.ArrayList"%>
<%@ page import="model.Book"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%
	ArrayList<Book> booklist=new ArrayList<Book>();
	if(request.getAttribute("books")!=null){
		booklist=(ArrayList<Book>)request.getAttribute("books");
	}
	for(int i=0;i<booklist.size();i++){
		Book b=booklist.get(i);
		int bookid=b.getId();
		String title=b.getTitle();
		String author=b.getAuthor();
		String publisher=b.getPublisher();
		String description=b.getDescription();
		%>
		<div class="book">
		<img src="<%=path %>/img/<%=bookid %>.png" class="cover" />
		<div class="describe"> 
			<p class="bookname"><%=title %></p>
			<p class="price">
				<%if(b.getStatus()==0)%>未借出
				<%if(b.getStatus()!=0) %>已借出
			</p>
		<form class="cart" action="borrowBook" method="post" auth>
			<input type="hidden" name="bookid" value="<%=bookid %>">
			<input type="hidden" name="userid" value="<%=userid %>">
			<input type="submit" value="租借">
		</form>
		<form class="cart" action="getSpecificBook?Bookid=<%=bookid %>" method="post" autocomplete="off">
			<input type="submit" value="详情">
		</form>
		</div>
		</div>
		<%
	}
%>