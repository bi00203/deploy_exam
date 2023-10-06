<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ include file="../inc/dbconn.jsp"%>
<%
	request.setCharacterEncoding("UTF-8");
	
	PreparedStatement preparedStatement = null;
	ResultSet resultSet = null;
	
	
	String sql = "delete from cart where orderId = '" + orderId + "'";
	preparedStatement = conn.prepareStatement(sql);
	preparedStatement.executeUpdate();
	
	if(preparedStatement != null){
		preparedStatement.close();
	}
	if(conn != null){
		conn.close();
	}
	
	response.sendRedirect("./cart.jsp");
%>