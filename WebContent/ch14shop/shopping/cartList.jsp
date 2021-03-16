<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.*"%>
<%@ page import = "java.sql.*, javax.sql.*, javax.naming.*"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<% request.setCharacterEncoding("utf-8");%>
<%@ page import = "bookshop.shopping.CartDataBean" %>
<%@ page import = "bookshop.shopping.CartDBBean" %>
<%@ include file="../etc/color.jspf"%>
<%@ page import = "java.text.*" %>
<!DOCTYPE html>
<html>
<head>
<link rel = "stylesheet" href = "../etc/style.css">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js" integrity="sha384-b5kHyXgcpbZJO/tY9Ul7kGkf1S0CWuKcCD38l8YkeH8z8QjE0GmW1gYU5S9FOnJ0" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.6.0/dist/umd/popper.min.js" integrity="sha384-KsvD1yqQ1/1+IA7gi3P0tyJcT3vR+NdBTt13hSJ2lnve8agRGXTTyNaBYmCR/Nwi" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.min.js" integrity="sha384-nsg8ua9HAw1y0W1btsyWgBklPnCUAFLuTMS2G72MMONqmOymq585AcH49TLBQObG" crossorigin="anonymous"></script>
<meta charset="UTF-8">
<title>Book Shopping Mall</title>
</head>
<body bgcolor = "<%=bodyback_c%>">
	<%
		String book_kind = request.getParameter("book_kind");
		String buyer = (String)session.getAttribute("id");
				
		List<CartDataBean> cartLists = null;
		CartDataBean cartList = null;
		int count = 0;
		int number = 0;
		int total = 0;
		
		if(session.getAttribute("id") == null){
			response.sendRedirect("shopMain.jsp");
		}else{
			CartDBBean dbpro = CartDBBean.getInstance();
			count = dbpro.getListCount(buyer); //aaaa@
			if(count == 0){
				%>
				<h3><b>장바구니</b></h3>
				<table>
					<tr><td>장바구니에 담긴 물품이 없습니다.</td></tr>
				</table>
				<input type = "button" value = "쇼핑계속" onclick = "location.href='list.jsp?book_kind=<%=book_kind%>'">
				<%
			}else{
				cartLists = dbpro.getCart(buyer);
				%>
				<h3><b>장바구니</b></h3>
				<form name = "cartform" method = "post" action = "updateCart.jsp">
					<table>
						<tr>
							<td width = "50">번호</td>
							<td width = "300">책이름</td>
							<td width = "100">판매가격</td>
							<td width = "150">수량</td>
							<td width = "150">금액</td>
						</tr>
				<%
					for(int i=0; i<cartLists.size();i++){
						cartList = (CartDataBean)cartLists.get(i);					
				%>
					<tr>
						<td width = "50"><%=++number %></td>
					<td  width="300" align="left">
         <img src = "../../imageFile/<%=cartList.getBook_image() %>"
             border="0" width="30" height="50" align="middle">
             <%=cartList.getBook_title()%>
       </td> 
						<td width = "100"><%=NumberFormat.getInstance().format(cartList.getBuy_price()) %></td>
						<td width = "150">
						<input type = "text" name = "buy_count" size = "5" value = "<%=cartList.getBuy_count() %>">
						<input type = "hidden" name = "cart_id" value = "<%=cartList.getCart_id() %>">
						<input type = "hidden" name = "book_kind" value = "<%=book_kind%>">
						<input type = "submit" value = "수정">
						</td>
						<td align = "center" width = "150">
						<%total += cartList.getBuy_count() * cartList.getBuy_price();%>
						
						<%=NumberFormat.getInstance().format(cartList.getBuy_count()*cartList.getBuy_price()) %>
						<input type = "button" value = "삭제" onclick = "location.href = 'cartListDel.jsp?list=<%=cartList.getCart_id() %>%book_kind=<%=book_kind %>'">
						</td>
						</tr>
					<% }%>
					<tr>
					<td colspan = "5" align = "right"><b>총금액 :
					<%=NumberFormat.getInstance().format(total) %>
					</b></td>
					</tr>
					<tr>
					<td colspan = "5">
					<input type = "button" value = "구매하기" onclick = "javascript:window.locaion = 'buyForm.jsp'">
					<input type = "button" value = "쇼핑 계속" onclick = "javascript:window.locaion = 'list.jsp?book_kind=<%=book_kind%>'">
					<input type = "button" value = "장바구니 비우기" onclick = "location.href ='CartListDel.jsp?list=all&book_kind=<%=book_kind %>'">
					</td>
					</tr>
					</table>
				</form>
		<%
			}
		}
	%>
	
	
</body>
</html>
