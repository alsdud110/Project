<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.*"%>
<%@ page import = "java.sql.*, javax.sql.*, javax.naming.*"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ page import = "bookshop.master.ShopBookDBBean" %>
<% request.setCharacterEncoding("utf-8");%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
	<%
		int book_id = Integer.parseInt(request.getParameter("book_id"));
		String book_kind = "all";
		
		ShopBookDBBean dbpro = ShopBookDBBean.getInstance();
		dbpro.deleteBook(book_id);
		
		response.sendRedirect("bookList.jsp?book_kind="+book_kind);
	%>
</body>
</html>
