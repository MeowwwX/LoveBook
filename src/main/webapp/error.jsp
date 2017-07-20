
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
	
	
<%String path = request.getContextPath();%>
<script>
	alert("<%=(String)request.getAttribute("err") %>");
	location.replace("<%=path%>/index.jsp");
</script>