<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.*"%>
<%@ page import = "java.sql.*, javax.sql.*, javax.naming.*"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<% request.setCharacterEncoding("utf-8");%>
<%@ include file="../../etc/color.jspf"%> 
<%
	String managerId = "";
	managerId = (String)session.getAttribute("managerId");
	
	if(managerId.equals("") || managerId == null){
		response.sendRedirect("../logon/managerLoginForm.jsp");
	}else{
		int book_id = Integer.parseInt(request.getParameter("book_id"));
		String book_kind = request.getParameter("book_kind");
	%>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body bgcolor = "<%=bodyback_c%>">
	<div align = "center">
	<p>책삭제</p>
	<br>
	<form method = "post" name = "delform" action = "bookDeletePro.jsp?book_id=<%=book_id %>&book_kind=<%=book_kind %>" onsubmit = "return deleteSave()">
		<table>
			<tr>
				<td align = "right" bgcolor = "<%=value_c %>">
					<a href = "../managerMain.jsp">관리자 메인으로</a>&nbsp;
					<a href = "bookList.jsp?book_kind=<%=book_kind %>">목록으로</a>
				</td> 
			</tr>
			
			<tr height = "30">
				<td align = "center" bgcolor = "<%=value_c %>">
				<input type = "submit" value = "삭제">
			</tr>
		</table>
	</form>
	</div>
</body>
</html>
<%} %>
