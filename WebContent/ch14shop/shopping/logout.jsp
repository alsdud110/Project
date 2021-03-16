<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.*"%>
<%@ page import = "java.sql.*, javax.sql.*, javax.naming.*"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<% request.setCharacterEncoding("utf-8");%>
<%@ page import = "bookshop.master.ShopBookDataBean" %>
<%@ page import = "bookshop.master.ShopBookDBBean" %>
<%@ include file="../etc/color.jspf"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
<% session.invalidate(); %>
	<script>
		alert('로그아웃 되셨습니다.');
		location.href = "shopMain.jsp";
	</script>
</body>
</html>
