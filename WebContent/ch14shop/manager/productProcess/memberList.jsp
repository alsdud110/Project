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
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl"
	crossorigin="anonymous">
<title>고객 목록</title>
</head>
<body>
	<%
		List<CustomerDataBean> List = null;
		CustomerDataBean memberList = null;
		CustomerDBBean dbpro = CustomerDBBean.getInstance();
		List = dbpro.selectMember();
	%>
	
	<p>
	<div class = "container text-center" align = "center">
		<h3>고객 목록</h3>
		<hr>
		<table class="table table-bordered" border = "1">
			<tr class = "table-info">
				<td width = "200">고객 ID</td>
				<td width = "200">고객 PW</td>
				<td width = "200">고객 이름</td>
				<td width = "200">가입일자</td>
				<td width = "300">고객 주소</td>
				<td width = "300">고객 전화번호</td>
			</tr>
			
			<%
				for(int i = 0; i < List.size(); i++){
					memberList = List.get(i);%>
					<tr class = "table-success">
						<td align = "center" ><%=memberList.getId() %></td>
						<td align = "center" ><%=memberList.getPasswd() %></td>
						<td align = "center" ><%=memberList.getName() %></td>
						<td align = "center" ><%=memberList.getReg_date() %></td>
						<td align = "center" ><%=memberList.getAddress() %></td>
						<td align = "center"><%=memberList.getTel() %></td>
					</tr>
				<%}
			%>
			
		</table>
	</div>
	<script
			src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js"
			integrity="sha384-b5kHyXgcpbZJO/tY9Ul7kGkf1S0CWuKcCD38l8YkeH8z8QjE0GmW1gYU5S9FOnJ0"
			crossorigin="anonymous"></script>
</body>
</html>
