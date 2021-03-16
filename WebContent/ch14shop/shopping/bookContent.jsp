<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.*"%>
<%@ page import = "java.sql.*, javax.sql.*, javax.naming.*"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<% request.setCharacterEncoding("utf-8");%>
<%@ page import = "bookshop.master.ShopBookDataBean" %>
<%@ page import = "bookshop.master.ShopBookDBBean" %>
<%@ include file="../etc/color.jspf"%> 
<%@ page import = "java.text.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel = "stylesheet" href = "../etc/style.css">
<title>Book Shopping Mall</title>
</head>
<body bgcolor = "<%=bodyback_c%>">
	<%
		String book_kind = request.getParameter("book_kind");
		String book_id = request.getParameter("book_id");
		
		String id = "";
		int buy_price = 0;
		
		try{
			if(session.getAttribute("id") == null){
				id = "not";
			}else{
				id = (String)session.getAttribute("id");
			}
		}catch(Exception e){}
		
		ShopBookDataBean book = null;
		String book_kindName = "";
		
		ShopBookDBBean dbpro = ShopBookDBBean.getInstance();
		book = dbpro.getBook(Integer.parseInt(book_id));
		
		if(book_kind.equals("100")){
			book_kindName = "문학";
		}else if(book_kind.equals("200")){
			book_kindName = "외국어";
		}else if(book_kind.equals("300")){
			book_kindName = "컴퓨터";
		}
	%>
	<form name = "inform" method = "post" action = "cartInsert.jsp">
		<table>
			<tr height = "30">
				<td rowspan = "6" width = "150">
					<img src = "../../imageFile/<%=book.getBook_image() %>" border = "0" width = "150" height = "200">
				</td>
				<td width = "500"><font size = "+1">
					<b><%=book.getBook_title() %></b>
				</font></td>
			</tr>
			<tr><td width = "500">저자 : <%=book.getAuthor() %></td></tr>
			<tr><td width = "500">출판사 : <%=book.getPublishing_com() %></td></tr>
			<tr><td width = "500">출판일 : <%=book.getPublishing_date() %></td></tr>
			<tr><td width = "500">정가 : <%=NumberFormat.getInstance().format(book.getBook_price()) %>원<br>
						<%buy_price = (int)(book.getBook_price() * ((double)(100-book.getDiscount_rate())/100));%>
						판매가 : <b><font color = "red">
						<%=NumberFormat.getInstance().format((int)(buy_price)) %>원
						</font></b>
						</td></tr>
			<tr><td width = "500">수량 : <input type = "text" name = "buy_count" value = "1">개
			<%
				if(id.equals("not")){
					if(book.getBook_count() == 0){
			%>
				<b>일시품절</b>
			<%			
					}
				}else{
					if(book.getBook_count() == 0){
			%>		
					<b>일시품절</b>	
					<%}else{ %>
					<input type = "hidden" name = "book_id" value = "<%=book_id %>">
					<input type = "hidden" name = "book)image" value = "<%=book.getBook_image()%>">
					<input type = "hidden" name = "book_title" value = "<%=book.getBook_title() %>">
					<input type = "hidden" name = "buy_price" value = "<%=buy_price %>">
					<input type = "hidden" name = "book_kind" value = "<%=book_kind %>">
					<input type = "submit" value = "장바구니에 담기">
				<%}} %>
					<input type = "button" value = "목록으로" onclick = "location.href = 'list.jsp?book_kind=<%=book_kind%>'">
					<input type = "button" value = "메인으로" onclick = "location.href = 'shopMain.jsp'">
					</td>
					</tr>
					<tr>
						<td colspan = "2" align = "left">
							<br><%=book.getBook_content() %>
						</td>
					</tr>
		</table>
	</form>
</body>
</html>
