<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ include file="../inc/dbconn.jsp"%>
<%
	request.setCharacterEncoding("UTF-8");
	String productId = request.getParameter("productId");
	if (productId == null || productId.trim().equals("")){
		response.sendRedirect("../products.jsp");
		return;
	}
		
	PreparedStatement preparedStatement = null;
	ResultSet resultSet = null;
	
	String sql = "delete from cart where orderId = ? and productId = ?";
	preparedStatement = conn.prepareStatement(sql);
	preparedStatement.setString(1,orderId);
	preparedStatement.setString(2,productId);
	preparedStatement.executeUpdate();
	
	if(preparedStatement != null){
		preparedStatement.close();
	}
	if(conn != null){
		conn.close();
	}
	
	response.sendRedirect("./cart.jsp");
%>