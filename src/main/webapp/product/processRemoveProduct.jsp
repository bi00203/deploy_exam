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
	
		String productId = request.getParameter("productId");
		
		
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		
		String sql = "select * from product where productId = ?";
		preparedStatement = conn.prepareStatement(sql);
		preparedStatement.setString(1, productId);
		resultSet = preparedStatement.executeQuery();
		
		if(resultSet.next()){
			sql = "delete from product where productId = ?";
			preparedStatement = conn.prepareStatement(sql);
			preparedStatement.setString(1, productId);
			preparedStatement.executeUpdate();
		}
		else{
			out.print("일치하는 상품이 없습니다.");
		}
		if(preparedStatement != null){
			preparedStatement.close();
		}
		if(conn != null){
			conn.close();
		}
		response.sendRedirect("products.jsp");
	
	%>
</body>
</html>