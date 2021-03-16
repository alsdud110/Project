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
<title></title>
</head>
<body>
	
	
	<%
		String id = (String)session.getAttribute("id");
		
		CustomerDBBean dbpro = CustomerDBBean.getInstance();
		CustomerDataBean member = dbpro.getMember(id);
		String passwd = member.getPasswd();
			
		int check = dbpro.deleteMember(id, passwd);
		
		if(check == 1){
					session.invalidate();
			%>
				<script>
					alert('삭제되었습니다.');
					location.href = "shopMain.jsp";
				</script>
			<%
		}else if(check == 0){
			%>
			<script>
				alert('삭제에 실패하였습니다. check = 0');
				location.href = "updateMemberForm.jsp";
			</script>
		<%}
		else{
			%>
			<script>
				alert('삭제에 실패하였습니다. check = -1');
				location.href = "updateMemberForm.jsp";
			</script>
		<%}
	%>
	
	
	
</body>
</html>
