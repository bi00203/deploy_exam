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
		int no = Integer.parseInt(request.getParameter("no"));
	%>
	<h1>여기는 <%=no %>번글</h1>
	<p><a href="./write.jsp?no=<%=no %>">글에서 수정으로</a></p>
	<p><a href="./deleteContent.jsp?no=<%=no %>">글삭제</a></p>
	<p><a href="./main.jsp">돌아가기</a></p>
</body>
</html>