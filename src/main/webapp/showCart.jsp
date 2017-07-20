<%@ page import="java.util.ArrayList"%>
<%@ page import="model.book"%>
<%@ page import="model.cartitem"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%
	Cookie[] cookiess=null;
	cookiess=request.getCookies();
	String pathh = request.getContextPath();
	int uid=0;
	int bookid=0;
	double total=0;
	if(cookiess!=null){
		for(int i=0;i<cookiess.length;i++)
			if(cookiess[i].getName().equals("uid")){
				uid=Integer.valueOf(cookiess[i].getValue());
			}
	}
	ArrayList<book> booklist=new ArrayList<book>();
	ArrayList<cartitem> itemlist=new ArrayList<cartitem>();
	if(request.getAttribute("cartitems")!=null){
		itemlist=(ArrayList<cartitem>)request.getAttribute("cartitems");
	}
	if(request.getAttribute("books")!=null){
		booklist=(ArrayList<book>)request.getAttribute("books");
	}
	for(int i=0;i<itemlist.size();i++){
		cartitem item=itemlist.get(i);
		bookid=item.getBookid();
		for(int j=0;j<booklist.size();j++){
			book b=booklist.get(j);
			if(b.getId()==bookid){
				String title=b.getTitle();
				String author=b.getAuthor();
				double price=b.getPrice();
				total=total+price;
				int amount=item.getAmount();
				out.println("<div class=\"book\">\n");
				out.println("<img src=\""+pathh+"/img/"+String.valueOf(bookid)+".png\" class=\"cover\" />");
				out.println("<div class=\"describe\">");
				out.println("<p class=\"bookname\">"+title+"("+author+")</p>");
				out.println("<p class=\"price\">"+String.format("%.2f",price)+"元(已选"+String.valueOf(amount)+"本)</p>");
				out.println("<form class=\"cart\" action=\"delCart\" method=\"post\" autocomplete=off>");
				if(uid!=0){
					out.println("<input type=\"text\" name=\"bookid_s\" hidden=true value=\""+String.valueOf(bookid)+"\">");
					out.println("<input type=\"text\" name=\"userid_sss\" hidden=true value=\""+String.valueOf(uid)+"\">");
					out.println("<input type=\"submit\" value=\"从购物车移除\">");
				}
				out.println("</form>");
				out.println("</form>");
				out.println("<form class=\"cart\" action=\"getSpecificBook?bookid="+String.valueOf(bookid)+"\" method=\"post\" autocomplete=off>");
				out.println("<input type=\"submit\" value=\"详情\">");
				out.println("</form>");
				out.println("</div>");
				out.println("</div>");
			}
		}
	}
	out.println("<p style=\"text-align:right;font-size:80px;\">合计："+String.format("%.2f",total)+"元");
%>
<form action="submitOrder" method="post" autocomplete=off>
	<input type="text" name="userid_ss" hidden=true value="<%=String.valueOf(uid)%>">
	<input type="submit" value="结算">
</form>
<form action="clrCart" method="post" autocomplete=off>
	<input type="text" name="userid_s" hidden=true value="<%=String.valueOf(uid)%>">
	<input type="submit" value="清空购物车">
</form>