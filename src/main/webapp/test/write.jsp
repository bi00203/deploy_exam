<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		if(request.getParameter("no") == null){
	%>
		<p>글쓰기페이지</p>
		<p><a href="./main.jsp">취소</a></p>
		
	<%
		}
		else{
			int no = Integer.parseInt(request.getParameter("no"));
	%>
		<p>글수정페이지</p>
		글번호<%=no %>
		<p><a href="./content.jsp?no=<%=no %>">취소</a></p>
	<%
		}
	%>
	
</body>
</html>