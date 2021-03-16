<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.*"%>
<%@ page import = "java.sql.*, javax.sql.*, javax.naming.*"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<% request.setCharacterEncoding("utf-8");%>
<%@ page import = "bookshop.shopping.CartDataBean" %>
<%@ page import = "bookshop.shopping.CartDBBean" %>
<%@ include file="../etc/color.jspf"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel = "stylesheet" href = "../etc/style.css">
<title></title>
</head>
<body bgcolor = "<%=bodyback_c%>">
	<%
		String cart_id = request.getParameter("cart_id");
		String buy_count = request.getParameter("buy_count");
		String book_kind = request.getParameter("book_kind");
		
		if(session.getAttribute("id") == null){
			response.sendRedirect("shopMain.jsp");
		}else{
	%>
			<form method = "post" name = "updateForm" action = "updateCart.jsp">
				변경할 수량 :
				<input type = "text" name = "buy_count" size = "5" value = "<%=buy_count %>">
				<input type = "hidden" name ="cart_id" value = "<%=cart_id %>">
				<input type = "hidden" name = "book_kind" value = "<%=book_kind %>">
				<input type = "submit" value = "변경">
			</form>
		<%} %>
</body>
</html>
