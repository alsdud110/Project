<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.*"%>
<%@ page import = "java.sql.*, javax.sql.*, javax.naming.*"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ page import = "bookshop.shopping.CustomerDBBean" %>
<%@ page import = "bookshop.shopping.CustomerDataBean" %>
<% request.setCharacterEncoding("utf-8");%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
<jsp:useBean id = "member" class = "bookshop.shopping.CustomerDataBean">
	<jsp:setProperty name = "member" property = "*"/>
</jsp:useBean>
	<%
		String id = (String)session.getAttribute("id");
	
		member.setPasswd(request.getParameter("passwd"));
		member.setName(request.getParameter("name"));
		member.setTel(request.getParameter("tel"));
		member.setAddress(request.getParameter("address"));
		member.setId(id);
		
		CustomerDBBean dbpro = CustomerDBBean.getInstance();
		dbpro.updateMember(member);
		response.sendRedirect("shopMain.jsp");
		
	%>
</body>
</html>
