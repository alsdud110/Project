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
		String list = request.getParameter("list");
		String book_kind = request.getParameter("book_kind");
		String buyer = (String)session.getAttribute("id");
		
		if(session.getAttribute("id") == null){
			response.sendRedirect("shopMain.jsp");
		}else{
			CartDBBean dbpro = CartDBBean.getInstance();
			
			if(list.equals("all")){
				dbpro.deleteAll(buyer);
			}else{
				dbpro.deleteList(Integer.parseInt(list));
			}
			response.sendRedirect("cartList.jsp?book_kind="+book_kind);	
		}
		
	%>
</body>
</html>
