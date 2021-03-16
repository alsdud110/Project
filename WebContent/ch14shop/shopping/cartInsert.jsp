<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.*"%>
<%@ page import = "java.sql.*, javax.sql.*, javax.naming.*"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<% request.setCharacterEncoding("utf-8");%>
<%@ page import = "bookshop.shopping.CartDataBean" %>
<%@ page import = "bookshop.shopping.CartDBBean" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
	<%
		String book_kind = request.getParameter("book_kind");
		String buy_count = request.getParameter("buy_count");
		String book_id = request.getParameter("book_id");
		String book_title = request.getParameter("book_title");
		String book_image = request.getParameter("book_image");
		String buy_price = request.getParameter("buy_price");
		String buyer = (String)session.getAttribute("id");
	%>
	<jsp:useBean id = "cart" class = "bookshop.shopping.CartDataBean" scope = "page"/>
	<%
		cart.setBook_id(Integer.parseInt(book_id));
		cart.setBook_image(book_image);
		cart.setBook_title(book_title);
		cart.setBuy_count(Byte.parseByte(buy_count));
		cart.setBuy_price(Integer.parseInt(buy_price));
		cart.setBuyer(buyer);
		
		CartDBBean dbpro = CartDBBean.getInstance();
		dbpro.insertCart(cart);
		response.sendRedirect("cartList.jsp?book_kind="+book_kind);
	%>
</body>
</html>
