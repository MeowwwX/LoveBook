<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@ page import="com.bookshop.domain.Admin" %>
<%
	//���û�е�¼����ת����¼ҳ��
	Admin admin = (Admin)session.getAttribute("admin");
	if (admin ==null) {
%>
	<jsp:forward page="/Admin/adminLogin.jsp"/>
<%}%>