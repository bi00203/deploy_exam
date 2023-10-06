<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ include file="../inc/dbconn.jsp"%>
	<%
		request.setCharacterEncoding("UTF-8");
		String memberId = request.getParameter("memberId");
		String passwd = request.getParameter("passwd");
		
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		
		String sql = "SELECT * FROM member WHERE memberId = ? AND passwd = ?";
		
		preparedStatement = conn.prepareStatement(sql);
		preparedStatement.setString(1, memberId);
		preparedStatement.setString(2, passwd);
		resultSet = preparedStatement.executeQuery();
		if(resultSet.next()){
			session.setAttribute("sessionMemberId", memberId);
			session.setAttribute("sessionMemberName", resultSet.getString("memberName"));
			
			sql = "UPDATE cart SET memberId = ? WHERE orderId = ?";
			preparedStatement = conn.prepareStatement(sql);
			preparedStatement.setString(1, memberId);
			preparedStatement.setString(2, orderId);
			preparedStatement.executeUpdate();
			
			sql = "UPDATE cart SET orderId = ?  WHERE memberId = ? AND orderId != ?";
			preparedStatement = conn.prepareStatement(sql);
			preparedStatement.setString(1, orderId);
			preparedStatement.setString(2, memberId);
			preparedStatement.setString(3, orderId);
			preparedStatement.executeUpdate();
			
			response.sendRedirect("./resultMember.jsp?msg=2");
		}
		else {
			response.sendRedirect("./loginMember.jsp?error=1");
		}
		
		if(preparedStatement != null){
			preparedStatement.close();
		}
		if(conn != null){
			conn.close();
		}
	
	%>
</body>
</html>