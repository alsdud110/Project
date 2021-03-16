<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.*"%>
<%@ page import = "java.sql.*, javax.sql.*, javax.naming.*"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<% request.setCharacterEncoding("utf-8");%>
<%@ page import = "bookshop.shopping.CartDataBean" %>
<%@ page import = "bookshop.shopping.CartDBBean" %>
<%@ page import = "bookshop.shopping.CustomerDBBean" %>
<%@ page import = "bookshop.shopping.BuyDBBean" %>
<%@ page import = "bookshop.shopping.CustomerDataBean" %>
<%@ include file="../etc/color.jspf"%>
<%@ page import = "java.text.*" %>
<!DOCTYPE html>
<html>
<head>
<link rel = "stylesheet" href = "../etc/style.css">
<meta charset="UTF-8">
<title>Book Shopping Mall</title>
</head>
<body bgcolor = "<%=bodyback_c%>">
	<%
		String book_kind = request.getParameter("book_kind");
		String buyer = (String)session.getAttribute("id");
				
		List<CartDataBean> cartLists = null;
		List<String> accountLists = null;
		CartDataBean cartList = null;
		CustomerDataBean member = null;
		
		int number = 0;
		int total = 0;
		
		if(session.getAttribute("id") == null){
			response.sendRedirect("shopMain.jsp");
		}else{
			CartDBBean dbpro = CartDBBean.getInstance();
			cartLists = dbpro.getCart(buyer); //aaaa@
			
			CustomerDBBean memberProcess = CustomerDBBean.getInstance();
			member = memberProcess.getMember(buyer);
			
			BuyDBBean buyProcess = BuyDBBean.getInstance();
			accountLists = buyProcess.getAccount();
			%>
			<h3><b>구매목록</b></h3>
				<form name = "inform" method = "post" action = "updateCart.jsp">
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
						cartList = cartLists.get(i);					
				%>
					<tr>
						<td width = "50"><%=++number %></td>
					<td  width="300" align="left">
         <img src="/StudyBasicJSP/imageFile/<%=cartList.getBook_image()%>" 
             border="0" width="30" height="50" align="middle">
             <%=cartList.getBook_title()%>
       </td> 
						<td width = "100"><%=NumberFormat.getInstance().format(cartList.getBuy_price()) %></td>
						<td width = "150"><%=cartList.getBuy_count() %></td>
						<td align = "center" width = "150">
						<%total += cartList.getBuy_count() * cartList.getBuy_price();%>
						
						<%=NumberFormat.getInstance().format(cartList.getBuy_count()*cartList.getBuy_price()) %>
						</td>
						</tr>
					<% }%>
					<tr>
					<td colspan = "5" align = "right"><b>총 구매금액 :
					<%=NumberFormat.getInstance().format(total) %>
					</b></td>
					</tr>
					
					</table>
				</form>
		<%
			}
		
	%>
	<br>
	<form method = "post" action = "buyPro.jsp" name = "buyinput">
		<table>
			<tr>
			<td colspan = "2"><font size ="+1"><b>주문자 정보</b></font></td>
			</tr>
			<tr> 
				<td width = "200" align = "left">성명</td>
				<td width = "400" align = "left"><%=member.getName() %></td>
			</tr>
			<tr>
				<td width = "200" align = "left">전화번호</td>
				<td width = "400" align = "left"><%=member.getTel() %></td>
			</tr>
			<tr>
				<td width = "200" align = "left">주소</td>
				<td width = "400" align = "left"><%=member.getAddress() %></td>
			</tr>
			<tr>
				<td width = "200" align = "left">결제계좌</td>
				<td width = "400" align = "left">
					<select name = "account">
						<%
							for(int i=0;i<accountLists.size();i++){
								%>
								<option value = "<%=accountLists %>"><%=accountLists %></option>
							<%}%>
					
					</select>
				</td>
			</tr>
			
		</table>
	
	
	<br>
	<table>
		<tr>
			<td colspan = "2"><font size = "+1"><b>배송지 정보</b></font></td>
		</tr>
		<tr>
			<td width = "200" align = "left">성명</td>
			<td width = "400" align = "left"><input type = "text" name = "deliveryName" value = "<%=member.getName() %>" ></td>
		</tr>
		<tr>
			<td width = "200" align = "left">전화번호</td>
			<td width = "400" align = "left"><input type = "text" name = "deliveryTel" value = "<%=member.getTel() %>" ></td>
		</tr>
		<tr>
			<td width = "200" align = "left">주소</td>
			<td width = "400" align = "left"><input type = "text" name = "deliveryAddress" value = "<%=member.getAddress() %>" ></td>
		</tr>
		<tr>
			<td colspan = "2" alian = "center" bgcolor = "<%=value_c%>">
				<input type = "submit" value = "확인">
				<input type = "button" value = "취소" onclick = "location.href = 'shopMain.jsp''">
			</td>
		</tr>
	</table>
	
	</form>
</body>
</html>
