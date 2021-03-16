<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="../etc/color.jspf"%> 
<html>
<head>
<link href="../etc/style.css" rel="stylesheet" type="text/css">
</head>
<body bgcolor="<%=bodyback_c%>">

<%
 try{
   if(session.getAttribute("id")==null){%>
   <a class = "btn btn-outline-dark btn-sm" href="../shopping/list.jsp?book_kind=all">전체목록보기</a>&nbsp;
   <hr>
      
   <form name="inform" method="post" action="loginPro.jsp">
		<div class="input-group mb-3">
			<span class="input-group-text" id="basic-addon1">아이디</span> <input
				type="text" name = "id" size = "15" maxlength = "50" style = "width:100px" class="form-control" placeholder="Username"
				aria-label="Username" aria-describedby="basic-addon1">
		</div>
		<div class = "input-group mb-3">
			<span class="input-group-text" id="basic-addon1">패스워드</span> <input
				type="password" name = "passwd"size = "15" maxlength = "16" style = "width:100px" class="form-control" placeholder="Password"
				aria-label="Username" aria-describedby="basic-addon1">
		</div>
		<div>
			<input type = "submit" class = "btn btn-outline-dark btn-sm" value = "로그인">
		    <input type = "button" class = "btn btn-outline-dark btn-sm" value = "회원가입" onclick = "location.href = '../shopping/joinForm.jsp'">
		</div>
   </form>
   <hr>
   <font color="red">* 반드시 로그인을 하셔야 쇼핑을 하실 수 있습니다.*</font>    
   <hr>
   
 <%}else{%>

    <a href="../shopping/list.jsp?book_kind=all" class = "btn btn-outline-dark">전체목록보기</a>&nbsp;
    <a href="../shopping/cartList.jsp?book_kind=all" class = "btn btn-outline-dark">장바구니보기</a>&nbsp;
    <a href="../shopping/buyList.jsp" class = "btn btn-outline-dark">구매목록보기</a>&nbsp;
      
    <br><br> 
    <b><%=session.getAttribute("id")%></b> 님 , 즐거운 쇼핑시간이 되세요.
    
    <div>   
    <input type="button"  value="로그아웃" class = "btn btn-outline-dark btn-sm"
        onclick="javascript:window.location='../shopping/logout.jsp'">
    <input type = "button" class = "btn btn-outline-dark btn-sm" value = "회원정보 수정" onclick = "location.href = '../shopping/updateMemberForm.jsp'"> 
    </div>
 <%}
 }catch(NullPointerException e){
	 e.printStackTrace();
 }
 %>
</body>
</html>