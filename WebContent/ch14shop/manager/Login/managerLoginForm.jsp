<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<html>
<head>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl"
	crossorigin="anonymous">
<title>관리자 로그인</title>
</head>
<body>
	<div class="container mt-5 mx-auto">
		<div align = "center">
		<h2>관리자 로그인</h2>
		<form method="post" action="managerLoginPro.jsp">
			아이디 <input type="text" name="id" class="form-control"
				placeholder="ID를 입력하세요." style="ime-mode: inactive; width: 250px;"><br>
			비밀번호 <input type="password" class="form-control" name = "passwd"
				placeholder="PASSWORD를 입력하세요"
				style="ime-mode: inactive; width: 250px;"><br>
				<input type = "submit" class = "btn btn-dark" value = "LogIn">
		</form>
		</div>
	</div>
		<script
			src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js"
			integrity="sha384-b5kHyXgcpbZJO/tY9Ul7kGkf1S0CWuKcCD38l8YkeH8z8QjE0GmW1gYU5S9FOnJ0"
			crossorigin="anonymous"></script>
</body>
</html>