<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ include file="../inc/dbconn.jsp"%>
<%
	PreparedStatement preparedStatement = null;
	ResultSet resultSet = null;
	
	
	String[] checkedId = request.getParameterValues("checkedId");
	if(checkedId != null){
		for(String s : checkedId){ // 받아온 체크값 순회
			String sql = "delete from cart where orderId = ? and productId = ?";
			preparedStatement = conn.prepareStatement(sql);
			preparedStatement.setString(1,orderId);
			preparedStatement.setString(2,s);
			preparedStatement.executeUpdate();
		}
	}
	
	if(preparedStatement != null){
		preparedStatement.close();
	}
	if(conn != null){
		conn.close();
	}
	response.sendRedirect("./cart.jsp");

%>