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
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">
<title>Book Shopping Mall</title>
</head>
<body bgcolor = "<%=bodyback_c%>">
	<%
		String book_kind = request.getParameter("book_kind");
	%>
	
	<table>
		<tr>
			<td width = "150" valign = "top">
				<jsp:include page = "../module/left.jsp" flush = "false"/>
			</td>
			<td width = "700">
			
			<%
				List<ShopBookDataBean> bookLists = null;
				ShopBookDataBean book = null;
				String book_kindName = "";
				
				ShopBookDBBean dbpro = ShopBookDBBean.getInstance();
				bookLists = dbpro.getBooks(book_kind);
				if(book_kind.equals("100")){
					book_kindName = "문학";
				}else if(book_kind.equals("200")){
					book_kindName = "외국어";
				}else if(book_kind.equals("300")){
					book_kindName = "컴퓨터";
				}else if(book_kind.equals("all")){
					book_kindName = "전체";
				}
			%>
			<h3><b><%=book_kindName %> 분류목록</b></h3>
				<a href = "shopMain.jsp">메인으로</a>
			<%
				for(int i = 0; i<bookLists.size();i++){
					book = (ShopBookDataBean)bookLists.get(i);
			%>
				<table>
					<tr height = "30" bgcolor = "<%=value_c %>">
						<td rowspan = "4" width = "100">
							<a href = "bookContent.jsp?book_id=<%=book.getBook_id() %>&book_kind=<%=book.getBook_kind() %>">
								<img src = "../../imageFile/<%=book.getBook_image() %>" border = "0" width = "60" height = "90">
							</a>
						</td>
						<td width = "350"><font size = "+1"><b>
							<a href = "bookContent.jsp?book_id=<%=book.getBook_id() %>&book_kind=<%=book.getBook_kind() %>">
							<%=book.getBook_title() %></a></b></font></td>
						<td rowspan = "4" width = "100" align = "center" valign = "middle">
						<%if(book.getBook_count() == 0){
							%><b>일시품절</b>
						<%}else{%>
							&nbsp;
						<%} %>
						</td>
					</tr>
					<tr height = "30" bgcolor = "<%=value_c %>">
						<td width = "350">출판사 : <%=book.getPublishing_com() %></td>
					</tr>
					<tr height = "30" bgcolor = "<%=value_c %>">
						<td width = "350">저자 : <%=book.getAuthor() %></td>
					</tr>
					<tr height = "30" bgcolor = "<%=value_c %>">
						<td width = "350">정가 : <%=NumberFormat.getInstance().format(book.getBook_price()) %><br>
						판매가 : <b><font color = "red">
						<%=NumberFormat.getInstance().format((int)(book.getBook_price() * ((double)(100-book.getDiscount_rate())/100))) %>
						</font></b>
						</td>
					</tr>
				</table>
				<%}%>
			</td>
		</tr>
	</table>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js" integrity="sha384-b5kHyXgcpbZJO/tY9Ul7kGkf1S0CWuKcCD38l8YkeH8z8QjE0GmW1gYU5S9FOnJ0" crossorigin="anonymous"></script>
</body>
</html>
