<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*, javax.sql.*, javax.naming.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="bookshop.shopping.CustomerDBBean"%>
<%@ page import="bookshop.shopping.CustomerDataBean"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl"
	crossorigin="anonymous">
<title>회원정보 수정하기</title>
</head>
<body>
	<%
		String id = (String) session.getAttribute("id");

		CustomerDBBean dbpro = CustomerDBBean.getInstance();

		CustomerDataBean member = dbpro.getMember(id);
	%>
	<form name = "writeform" method="post" action="updateMemberPro.jsp">
		<div class="container mx-auto">
			<div class="mb-3 my-3">
				<label for="exampleInputEmail1" class="form-label">아이디</label> 
				<input
					type="text" name="id" class="form-control"
					id="exampleInputEmail1" aria-describedby="emailHelp"
					style="width: 250px;" size="15" maxlength="15"
					value="<%=id%>">
				<div id="emailHelp" class="form-text">*아이디 변경 불가*</div>
			</div>
			<div class="mb-3">
				<label for="exampleInputPassword1" class="form-label">비밀번호</label>
				<input
					type="password" name="passwd" class="form-control"
					id="exampleInputPassword1" style="width: 250px;" size="15"
					maxlength="15" value="<%=member.getPasswd()%>">
			</div>
			<div class="mb-3">
				<label for="exampleInputEmail1" class="form-label">이름</label> 
				<input
					type="text" name="name" class="form-control"
					id="exampleInputEmail1" aria-describedby="emailHelp"
					style="width: 250px;" size="15" maxlength="15"
					value="<%=member.getName()%>">
				<div id="emailHelp" class="form-text">이름을 입력하세요.</div>
			</div>
			<div class="mb-3">
				<label for="exampleInputEmail1" class="form-label">주소</label> 
				<input
					type="text" name="address" class="form-control"
					id="exampleInputEmail1" aria-describedby="emailHelp"
					style="width: 250px;" size="50" maxlength="50"
					value="<%=member.getAddress()%>">
				<div id="emailHelp" class="form-text">주소를 입력하세요.</div>
			</div>
			<div class="mb-3">
				<label for="exampleInputEmail1" class="form-label">전화번호</label>
				<input
					type="tel" name="tel" class="form-control" id="exampleInputEmail1"
					aria-describedby="emailHelp" style="width: 250px;" size="15"
					maxlength="15" value="<%=member.getTel()%>">
				<div id="emailHelp" class="form-text">전화번호를 입력하세요.</div>
			</div>

			<input type="submit" class="btn btn-primary" value="수정하기">
			<input type="button" class="btn btn-primary" value="삭제하기" onclick = "action = 'deletePro.jsp';submit();">
		</div>
	</form>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-b5kHyXgcpbZJO/tY9Ul7kGkf1S0CWuKcCD38l8YkeH8z8QjE0GmW1gYU5S9FOnJ0"
	crossorigin="anonymous"></script>
</body>
</html>
