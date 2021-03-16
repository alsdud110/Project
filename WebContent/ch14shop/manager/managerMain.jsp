<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="../etc/color.jspf"%>

<%
   String managerId ="";
   try{
	   managerId = (String)session.getAttribute("managerId");
	   
	   if(managerId==null || managerId.equals("")){
          response.sendRedirect("logon/managerLoginForm.jsp");
	   }else{
%>
<html>
<head>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl"
	crossorigin="anonymous">
<title>관리자</title>
</head>
<body>

	<div align="center" class="container">
		<div class = "mb-3 my-3">
		<form method="post" action="logon/managerLogout.jsp">
			<b>관리작업중.. </b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" value="로그아웃" class = "btn btn-outline-dark">
		</form>
		</div>
	</div>
	<hr>
	<table class="table table-bordered">
		<thead>
			<tr class = "text-center table-info">
				<th bgcolor="<%=bar%>">상품 관련 작업</th>
				<th bgcolor="<%=bar%>">구매된 상품관련 작업</th>
				<th bgcolor="<%=bar%>">사용자 관련 작업</th>
			</tr>
		</thead>
		<tbody>
			<tr class = "table-success">
				<td class = "text-center"><a href='productProcess/bookRegisterForm.jsp'>상품등록</a></td>
				<td rowspan = "2" class = "text-center"><a href='orderedProduct/orderedList.jsp'>전체구매목록 확인</a></td>
				<td rowspan = "2" class = "text-center"><a href='productProcess/memberList.jsp'>사용자 목록</a></td>
			</tr>
			<tr class = "table-success">
				<td class = "text-center"><a href='productProcess/bookList.jsp?book_kind=all' >상품수정/삭제</a>
				</td>
			</tr>
		</tbody>
	</table>
		<script
			src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js"
			integrity="sha384-b5kHyXgcpbZJO/tY9Ul7kGkf1S0CWuKcCD38l8YkeH8z8QjE0GmW1gYU5S9FOnJ0"
			crossorigin="anonymous"></script>
</body>
</html>
<% 
	   }
    }catch(Exception e){
		e.printStackTrace();
	}
%>