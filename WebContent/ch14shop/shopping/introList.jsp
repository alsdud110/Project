<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "bookshop.master.ShopBookDBBean" %>
<%@ page import = "bookshop.master.ShopBookDataBean" %>
<%@ page import = "java.text.NumberFormat" %>

<%@ include file="../etc/color.jspf"%> 

<html>
<head>
<title>Book Shopping Mall</title>
<link href="../etc/style.css" rel="stylesheet" type="text/css">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js" integrity="sha384-b5kHyXgcpbZJO/tY9Ul7kGkf1S0CWuKcCD38l8YkeH8z8QjE0GmW1gYU5S9FOnJ0" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.6.0/dist/umd/popper.min.js" integrity="sha384-KsvD1yqQ1/1+IA7gi3P0tyJcT3vR+NdBTt13hSJ2lnve8agRGXTTyNaBYmCR/Nwi" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.min.js" integrity="sha384-nsg8ua9HAw1y0W1btsyWgBklPnCUAFLuTMS2G72MMONqmOymq585AcH49TLBQObG" crossorigin="anonymous"></script>
</head>
<body bgcolor="<%=bodyback_c%>">
<p>
<h3>신간소개</h3>
<%
  ShopBookDataBean bookLists[] = null;
  int number =0;
  String book_kindName="";
  
  ShopBookDBBean bookProcess = ShopBookDBBean.getInstance();
  for(int i=1; i<=3;i++){
	  bookLists = bookProcess.getBooks(i+"00",3);
     
     if(bookLists[0].getBook_kind().equals("100")){
	      book_kindName="문학";
     }else if(bookLists[0].getBook_kind().equals("200")){
	      book_kindName="외국어";  
     }else if(bookLists[0].getBook_kind().equals("300")){
	      book_kindName="컴퓨터";
     }
%>
  <br><font size="+1"><b><%=book_kindName%> 분류의 신간목록: 
  <a class = "btn btn-outline-dark btn-sm" href="list.jsp?book_kind=<%=bookLists[0].getBook_kind()%>">더보기</a>
  </b></font>
<%             
  for(int j=0;j<bookLists.length;j++){
%>
    <table > 
      <tr height="30" bgcolor="<%=value_c%>"> 
        <td rowspan="4"  width="100">
          <a class = "btn btn-outline-secondary btn-sm" href="bookContent.jsp?book_id=<%=bookLists[j].getBook_id()%>&book_kind=<%=bookLists[0].getBook_kind()%>">
             <img src="../../imageFile/<%=bookLists[j].getBook_image()%>"  
             border="0" width="60" height="90"></a></td> 
       <td width="350"><font size="+1"><b>
          <a class = "btn btn-outline-secondary btn-sm" href="bookContent.jsp?book_id=<%=bookLists[j].getBook_id()%>&book_kind=<%=bookLists[0].getBook_kind()%>">
              <%=bookLists[j].getBook_title() %></a></b></font></td> 
       <td rowspan="4" width="100">
          <%if(bookLists[j].getBook_count()==0){ %>
              <b>일시품절</b>
          <%}else{ %>
               &nbsp;
          <%} %>
       </td>
     </tr>        
     <tr height="30" bgcolor="<%=value_c%>"> 
       <td width="350">출판사 : <%=bookLists[j].getPublishing_com()%></td> 
     </tr>
     <tr height="30" bgcolor="<%=value_c%>"> 
       <td width="350">저자 : <%=bookLists[j].getAuthor()%></td>
     </tr>
     <tr height="30" bgcolor="<%=value_c%>"> 
       <td width="350">정가 :<%=NumberFormat.getInstance().format(bookLists[j].getBook_price())%>원<br>
                판매가 : <b><font color="red">
       <%=NumberFormat.getInstance().format((int)(bookLists[j].getBook_price()*((double)(100-bookLists[j].getDiscount_rate())/100)))%>
            </font></b>원</td> 
     </tr> 
     </table>
     <br>
<%
  }
}
%>

</body>
</html>