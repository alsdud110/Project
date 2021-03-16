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
		int cart_id = Integer.parseInt(request.getParameter("cart_id"));
		byte count = Byte.parseByte(request.getParameter("buy_count"));
		String book_kind = request.getParameter("book_kind");
		
		CartDBBean dbpro = CartDBBean.getInstance();
		dbpro.updateCount(cart_id, count);
		response.sendRedirect("cartList.jsp?book_kind="+book_kind);
	%>

</body>
</html>
