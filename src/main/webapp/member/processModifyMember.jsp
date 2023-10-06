<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.oreilly.servlet.multipart.*" %>
<%@ page import="com.oreilly.servlet.*" %>
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
		
		String sessionMemberId = (String) session.getAttribute("sessionMemberId");
		String passwd = request.getParameter("passwd");
		String memberName = request.getParameter("memberName");
		String gender = request.getParameter("gender");
		
		String birthyy = request.getParameter("birthyy");
		String birthmm = request.getParameter("birthmm");
		String birthdd = request.getParameter("birthdd");
		String birthday = birthyy + "-" + birthmm + "-" + birthdd;
		
		String mail1 = request.getParameter("mail1");
		String mail2 = request.getParameter("mail2");
		String email = mail1 + "@" + mail2;
		
		String phone01 = request.getParameter("phone01");
		String phone02 = request.getParameter("phone02");
		String phone03 = request.getParameter("phone03");
		String phone = phone01 + "-" + phone02 + "-" + phone03;
		
		String zipCode = request.getParameter("zipCode");
		
		String address01 = request.getParameter("address01");
		String address02 = request.getParameter("address02");
		
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		
		String sql = "select * from member where memberId = ?";
		preparedStatement = conn.prepareStatement(sql);
		preparedStatement.setString(1, sessionMemberId);
		resultSet = preparedStatement.executeQuery();
		
		if(resultSet.next()){
				sql = "update member set passwd = ?, memberName = ?, gender = ?, birthday = ?, "+
				"email = ?, phone = ?, zipCode = ?, address01 = ?, address02 = ? where memberId = ?";
				preparedStatement = conn.prepareStatement(sql);
				preparedStatement.setString(1, passwd);
				preparedStatement.setString(2, memberName);
				preparedStatement.setString(3, gender);
				preparedStatement.setString(4, birthday);
				preparedStatement.setString(5, email);
				preparedStatement.setString(6, phone);
				preparedStatement.setString(7, zipCode);
				preparedStatement.setString(8, address01);
				preparedStatement.setString(9, address02);
				preparedStatement.setString(10, sessionMemberId);
				preparedStatement.executeUpdate();
				
				session.setAttribute("sessionMemberName",memberName);
		}
		if(preparedStatement != null){
			preparedStatement.close();
		}
		if(conn != null){
			conn.close();
		}
		response.sendRedirect("./resultMember.jsp?msg=2");
	
	%>
</body>
</html>