<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.*"%>
<%@ page import = "java.sql.*, javax.sql.*, javax.naming.*"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ page import = "bookshop.shopping.BuyDataBean" %>
<%@ page import = "bookshop.shopping.BuyDBBean" %>
<%@ page import = "java.util.List" %>
<%@ page import = "java.text.NumberFormat" %>
<% request.setCharacterEncoding("utf-8");%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
	<%
		String buyer = (String)session.getAttribute("id");
		String book_kind = request.getParameter("book_kind");
		
		if(session.getAttribute("id") == null){
			response.sendRedirect("shopMain.jsp");
		}else{
			BuyDBBean dbpro = BuyDBBean.getInstance();
			dbpro.delete(buyer);
			%>
			<script>
				alert('삭제되었습니다.');
				location.href = "bookContent.jsp?book_kind="+book_kind;
			</script>
		<%
		}
		
	%>
</body>
</html>
